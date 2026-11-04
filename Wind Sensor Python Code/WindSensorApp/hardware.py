import sys
import time
import tkinter as tk
from tkinter import messagebox, ttk
import serial
import serial.tools.list_ports

class SerialConnectionManager:
    def __init__(self, data_engine):
        self.engine = data_engine
        self.ser = None
        self.selected_port = None
        self.is_connected = False  

    def select_port_gui(self):
        """Generates a drop-down prompt targeting online serial device options."""
        ports = sorted(serial.tools.list_ports.comports())
        if not ports:
            root = tk.Tk()
            root.withdraw()
            messagebox.showerror("Hardware Error", "No serial ports detected!\n\nPlease check hardware connections.")
            sys.exit(1)

        port_map = {f"{p.device} ({p.description})": p.device for p in ports}
        
        def on_submit():
            chosen = port_combobox.get()
            if chosen:
                self.selected_port = port_map[chosen]
                gui_window.destroy()
            else:
                messagebox.showwarning("Selection Required", "Please choose a COM port.")

        gui_window = tk.Tk()
        gui_window.title("Port Configuration Engine")
        gui_window.geometry("420x160")
        gui_window.resizable(False, False)
        
        gui_window.update_idletasks()
        x = (gui_window.winfo_screenwidth() // 2) - 210
        y = (gui_window.winfo_screenheight() // 2) - 80
        gui_window.geometry(f"420x160+{x}+{y}")

        ttk.Label(gui_window, text="Select Wind Sensor Serial Port:", font=("Arial", 11, "bold")).pack(pady=(15, 10))
        port_combobox = ttk.Combobox(gui_window, values=list(port_map.keys()), width=45, state="readonly")
        port_combobox.pack(pady=5)
        port_combobox.current(0)

        ttk.Button(gui_window, text="Connect Sensor", command=on_submit).pack(pady=15)
        gui_window.protocol("WM_DELETE_WINDOW", lambda: sys.exit(0))
        gui_window.mainloop()

    def connect(self):
        """Initializes raw hardware link."""
        try:
            self.ser = serial.Serial(self.selected_port, self.engine.baud_rate, timeout=1.0)
            self.is_connected = True
            print(f"[+] Pipeline link assigned to port {self.selected_port}.")
        except Exception as e:
            self.is_connected = False
            root = tk.Tk()
            root.withdraw()
            messagebox.showerror("Link Failure", f"Could not establish device link on {self.selected_port}:\n\n{e}")
            sys.exit(1)

    def trigger_recovery_dialog(self):
        """Holds operational sequences while displaying interactive retry prompts."""
        print("\n[!] HARDWARE LOSS: Connection link disconnected.")
        self.is_connected = False
        try:
            if self.ser and self.ser.is_open:
                self.ser.close()
        except Exception:
            pass

        root = tk.Tk()
        root.withdraw()
        while True:
            choice = messagebox.askretrycancel(
                "Hardware Disconnected",
                f"The connection to the Wind Sensor on {self.selected_port} was lost!\n\n"
                "Secure the physical USB wire connections and click 'Retry' to resume tracking operations."
            )
            if choice:
                try:
                    self.ser = serial.Serial(self.selected_port, self.engine.baud_rate, timeout=1.0)
                    time.sleep(2)
                    
                    self.ser.write(self.engine.startup_mode_command.encode("utf-8"))
                    time.sleep(0.2)
                    self.ser.readline()
                    
                    self.ser.write(self.engine.ws_reset_command.encode("utf-8"))
                    time.sleep(2.0)
                    
                    self.ser.reset_input_buffer()
                    self.is_connected = True
                    print("[+] Session link recovered and hardware reinitialised. Continuing trace.")
                    return
                except Exception as e:
                    print(f"[!] Recovery connection failure: {e}")
            else:
                self.engine.allow_windows_sleep()
                sys.exit(0)

    def fetch_sample(self):
        """Polls serial buffer metrics, outputs raw terminal text, and parses telemetry strings."""
        if not self.ser or not self.ser.is_open:
            self.trigger_recovery_dialog()
            return None

        for attempt in range(1, 4):
            try:
                self.ser.reset_input_buffer()
                self.ser.write(self.engine.data_command.encode("utf-8"))
                res = self.ser.readline().decode("utf-8", errors="ignore").strip()
                
                if not res:
                    continue

                print(f"[{time.strftime('%H:%M:%S')}] RAW SERIAL RX: '{res}'")

                # CORE FEATURE: Catch incorrect Device ID signal packet explicitly
                if res == "aaFAILIDX#":
                    print(f"[{time.strftime('%H:%M:%S')}] [!] Hardware warning: Device ID '{self.engine.device_id}' is incorrect.")
                    root = tk.Tk()
                    root.withdraw()
                    messagebox.showwarning(
                        "Device ID Incorrect",
                        f"The sensor rejected the request!\n\nDevice ID '{self.engine.device_id}' is incorrect for this hardware device. Please change it in the dashboard view entry box."
                    )
                    return None

                if not res.startswith("aaI") or not res.endswith("#"):
                    print(" [!] Malformed packet signature. Retrying...")
                    continue

                clean_response = res[:-1]
                prefix = f"aaI{self.engine.device_id}R{self.engine.channel}A1:"
                
                if clean_response.startswith(prefix):
                    clean_str = clean_response[len(prefix):]
                else:
                    clean_str = clean_response

                parts = clean_str.split(":")
                valid_payload = False
                incoming_histogram = [0.0] * 8
                avg_v, min_v, max_v = 0.0, 0.0, 0.0

                if len(parts) == 5:
                    avg_v = max(0.0, float(parts[0]))
                    min_v = max(0.0, float(parts[1]))
                    max_v = max(0.0, float(parts[2]))
                    try:
                        idx = int(float(parts[3]))
                        if 0 <= idx < 8:
                            self.engine.current_heading = self.engine.compass_directions[idx]
                            incoming_histogram[idx] = max(0.0, float(parts[4]))
                    except (ValueError, IndexError):
                        self.engine.current_heading = "Unknown"
                    valid_payload = True

                elif len(parts) >= 12:
                    avg_v = max(0.0, float(parts[0]))
                    min_v = max(0.0, float(parts[1]))
                    max_v = max(0.0, float(parts[2]))
                    self.engine.current_heading = str(parts[4]).strip()
                    incoming_histogram = [max(0.0, float(x)) for x in parts[5:13]]
                    valid_payload = True

                if valid_payload:
                    self.is_connected = True
                    for i in range(8):
                        self.engine.vane_histogram_accumulation[i] += incoming_histogram[i]

                    self.engine.latest_avg_speed = avg_v
                    self.engine.session_total_speed_samples += 1
                    self.engine.session_grand_avg_speed += (avg_v - self.engine.session_grand_avg_speed) / self.engine.session_total_speed_samples
                    self.engine.session_grand_avg_speed = max(0.0, self.engine.session_grand_avg_speed)

                    self.engine.append_record(avg_v, min_v, max_v, self.engine.current_heading)
                    
                    self.ser.write(self.engine.ws_reset_command.encode("utf-8"))
                    time.sleep(0.5)
                    self.ser.reset_input_buffer()
                    return avg_v, min_v, max_v

            except (serial.SerialException, OSError):
                self.trigger_recovery_dialog()
                return None
            except Exception as e:
                print(f"[*] Parsing exception warning (Attempt {attempt}): {e}")
                time.sleep(0.1)
        return None
