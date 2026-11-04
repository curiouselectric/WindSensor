import sys
import time
from datetime import datetime, timedelta
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from matplotlib.animation import FuncAnimation
from matplotlib.widgets import TextBox, Button  

# Cross-module component imports
from models import WindDataLogEngine
from hardware import SerialConnectionManager

class WindSensorApp:
    def __init__(self):
        self.engine = WindDataLogEngine()
        self.hardware = SerialConnectionManager(self.engine)
        
        self.hardware.select_port_gui()
        self.engine.select_save_file_gui()
        
        # Startup handshaking routing blocks
        self.hardware.connect() 
        if self.hardware.ser and self.hardware.ser.is_open:
            print(f"-> Sending startup initialization mode: '{self.engine.startup_mode_command.strip()}'")
            self.hardware.ser.write(self.engine.startup_mode_command.encode("utf-8"))
            time.sleep(0.2)
            self.hardware.ser.readline()  
            
            print(f"-> Sending hardware reset sequence command: '{self.engine.ws_reset_command.strip()}'")
            self.hardware.ser.write(self.engine.ws_reset_command.encode("utf-8"))
            time.sleep(2.0)  
            
            self.hardware.ser.reset_input_buffer()
            print(f"[+] Initialization complete: Device set to SEND5 and reset using ID '{self.engine.device_id}'!\n")

        self.fig = plt.figure(figsize=(16, 6))  
        self.ax_speed_line = self.fig.add_subplot(1, 3, 1)
        self.ax_text = self.fig.add_subplot(1, 3, 2)
        self.ax_wind_rose = self.fig.add_subplot(1, 3, 3, projection='polar')
        
        # 1. Device ID TextBox layout placement
        self.ax_box = self.fig.add_axes([0.25, 0.03, 0.08, 0.04])
        self.text_box = TextBox(self.ax_box, 'Device ID: ', initial=self.engine.device_id)
        self.text_box.on_submit(self.change_device_id)  

        # 2. Reset Button layout placement
        self.ax_btn = self.fig.add_axes([0.45, 0.03, 0.12, 0.04])
        self.reset_btn = Button(self.ax_btn, 'Reset Compass', color='#f0f0f0', hovercolor='#ffcccc')
        self.reset_btn.on_clicked(self.click_reset_btn)  

        # CORE FEATURE: 3. Quit Button layout placement
        self.ax_quit_btn = self.fig.add_axes([0.65, 0.03, 0.10, 0.04])
        self.quit_btn = Button(self.ax_quit_btn, 'Quit App', color='#f0f0f0', hovercolor='#ff4d4d')
        self.quit_btn.on_clicked(self.click_quit_btn)  # Wire up the quit click handler

        self.fig.canvas.mpl_connect("key_press_event", self.on_key_press)

    def click_reset_btn(self, event):
        """Cleans, recalculates, and forces an immediate canvas refresh."""
        self.engine.reset_histogram()
        self.render()               
        self.fig.canvas.draw_idle()  

    def click_quit_btn(self, event):
        """CORE FEATURE: Cleanly terminates the pipeline and closes graph windows."""
        print("\n[Quit Button Pressed] Initiating teardown...")
        plt.close(self.fig)  # Triggers the window close event handle down in finally block

    def change_device_id(self, new_id):
        clean_id = str(new_id).strip()
        if clean_id:
            self.engine.device_id = clean_id
            self.engine.update_commands()
        else:
            self.text_box.set_val(self.engine.device_id)

    def on_key_press(self, event):
        if event.inaxes == self.ax_box:
            return
        if event.key in ["q", "ctrl+c"]:
            print("\n[Instant Exit] Graceful exit triggered.")
            plt.close(self.fig)

    def render(self):
        """Draws live updates onto dashboard panels."""
        self.fig.texts.clear()
        if self.hardware.is_connected:
            status_text = f"PORT STATUS: CONNECTED ({self.hardware.selected_port})  |  ACTIVE DEVICE ID: {self.engine.device_id}"
            status_color = "darkgreen"
        else:
            status_text = f"PORT STATUS: DISCONNECTED (RETRYING...)"
            status_color = "crimson"
            
        self.fig.text(0.5, 0.95, status_text, color=status_color, fontsize=12, 
                      fontweight="bold", ha="center", va="center",
                      bbox=dict(facecolor='white', edgecolor=status_color, boxstyle='round,pad=0.3', alpha=0.9))

        # Panel 1: Live Speed History Graph
        self.ax_speed_line.clear()
        self.ax_speed_line.set_title("Live Wind Speed Statistics (Rolling Past 1 Hour)")
        self.ax_speed_line.set_xlabel("Time (HH:MM:SS)")
        self.ax_speed_line.set_ylabel("Speed")
        
        if self.engine.timestamps_real:
            self.ax_speed_line.plot(self.engine.timestamps_real, self.engine.wind_avg_history, label="Average", color="blue", marker="", linestyle="-")
            self.ax_speed_line.plot(self.engine.timestamps_real, self.engine.wind_max_history, label="Max (Gust)", color="red", linestyle="--", alpha=0.5)
            self.ax_speed_line.plot(self.engine.timestamps_real, self.engine.wind_min_history, label="Min", color="green", linestyle="--", alpha=0.5)
            self.ax_speed_line.fill_between(self.engine.timestamps_real, self.engine.wind_min_history, self.engine.wind_max_history, color="blue", alpha=0.03)
            self.ax_speed_line.legend(loc="upper left")
            
            self.ax_speed_line.xaxis.set_major_formatter(mdates.DateFormatter('%H:%M:%S'))
            self.ax_speed_line.relim()
            self.ax_speed_line.autoscale_view()
            
            current_time = self.engine.timestamps_real[-1]
            start_window_time = current_time - timedelta(minutes=60)
            self.ax_speed_line.set_xlim(start_window_time, current_time)
            self.ax_speed_line.set_ylim(bottom=0.0, top=max(self.engine.wind_max_history) * 1.2 if max(self.engine.wind_max_history, default=0) > 0 else 1.0)
            self.ax_speed_line.tick_params(axis='x', rotation=15)
        else:
            self.ax_speed_line.text(0.5, 0.5, "Waiting for data stream...", ha="center", va="center", color="gray")
            self.ax_speed_line.set_ylim(0.0, 1.0)
            
        self.ax_speed_line.grid(True, linestyle=":", alpha=0.6)

        # Panel 2: Summary metrics text
        self.ax_text.clear()
        self.ax_text.axis("off")
        self.ax_text.set_title("Live Dashboard Summary", fontsize=12, fontweight="bold", pad=20)
        self.ax_text.text(0.5, 0.80, f"{self.engine.latest_avg_speed:.2f}", fontsize=40, color="navy", weight="bold", va="center", ha="center")
        self.ax_text.text(0.5, 0.68, "Current 10s Avg Speed", fontsize=10, color="gray", va="center", ha="center")
        self.ax_text.axhline(y=0.58, xmin=0.2, xmax=0.8, color="lightgray", linewidth=0.8)
        self.ax_text.text(0.5, 0.44, f"{self.engine.session_grand_avg_speed:.2f}", fontsize=28, color="darkgreen", weight="bold", va="center", ha="center")
        self.ax_text.text(0.5, 0.34, f"Session Avg Speed ({self.engine.session_total_speed_samples} samples)", fontsize=10, color="gray", va="center", ha="center")
        self.ax_text.axhline(y=0.26, xmin=0.2, xmax=0.8, color="lightgray", linewidth=0.8)
        self.ax_text.text(0.5, 0.14, f"{self.engine.current_heading}", fontsize=24, color="#ff4d4d", weight="bold", va="center", ha="center")
        self.ax_text.text(0.5, 0.04, "Current Wind Direction", fontsize=10, color="gray", va="center", ha="center")

        # Panel 3: Polar compass rose layout
        self.ax_wind_rose.clear()
        self.ax_wind_rose.set_title(f"Wind Rose Distribution (Current: {self.engine.current_heading})", pad=20, fontweight="bold")
        self.ax_wind_rose.set_theta_direction(-1)
        self.ax_wind_rose.set_theta_offset(1.5707963267948966) 
        self.ax_wind_rose.set_xticks(self.engine.wind_rose_angles)
        self.ax_wind_rose.set_xticklabels(self.engine.compass_directions)
        self.ax_wind_rose.set_yticklabels([])
        
        colors = ["#ff4d4d" if d == self.engine.current_heading else "#3399ff" for d in self.engine.compass_directions]
        self.ax_wind_rose.bar(self.engine.wind_rose_angles, self.engine.vane_histogram_accumulation, width=0.45, color=colors, edgecolor="gray", alpha=0.8)
        self.ax_wind_rose.grid(True, linestyle=":", alpha=0.6)

    def update_frame(self, frame):
        """Processes data intervals, handles physical timestamps, and drops oldest values over 1 hour."""
        data = self.hardware.fetch_sample()
        if data:
            avg_v, min_v, max_v = data
            self.engine.timestamps_real.append(datetime.now())
            self.engine.wind_avg_history.append(avg_v)
            self.engine.wind_min_history.append(min_v)
            self.engine.wind_max_history.append(max_v)

            if len(self.engine.timestamps_real) > 360:
                self.engine.timestamps_real.pop(0)
                self.engine.wind_avg_history.pop(0)
                self.engine.wind_min_history.pop(0)
                self.engine.wind_max_history.pop(0)
        self.render()

    def run(self):
        try:
            self.render()
            self.fig.set_size_inches(18, 6.0)
            ani = FuncAnimation(self.fig, self.update_frame, interval=10000, cache_frame_data=False)
            plt.subplots_adjust(left=0.06, right=0.95, top=0.82, bottom=0.22, wspace=0.3)
            plt.show()
        except KeyboardInterrupt:
            print("\n[-] Thread execution interrupted by system console.")
        finally:
            self.engine.allow_windows_sleep()
            if self.hardware.ser and self.hardware.ser.is_open:
                print(f"[#] Disconnecting serial communication channel...")
                self.hardware.ser.close()
            print("[#] Pipeline safely terminated. Goodbye!")
            sys.exit(0)

if __name__ == "__main__":
    app = WindSensorApp()
    app.run()
