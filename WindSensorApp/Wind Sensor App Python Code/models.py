import sys
import time
import os
import csv
import ctypes
import tkinter as tk
from tkinter import filedialog
import numpy as np

class WindDataLogEngine:
    def __init__(self):
        self.prevent_windows_sleep()
        
        self.baud_rate = 9600
        self.device_id = "0"  
        self.channel = "00"
        
        self.update_commands()
        
        self.timestamps_real = []  
        self.wind_avg_history = []
        self.wind_min_history = []
        self.wind_max_history = []
        
        self.compass_directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
        self.wind_rose_angles = np.deg2rad(np.arange(0, 360, 45))
        
        # Initialize the global array
        self.reset_histogram()
        
        self.current_heading = "N/A"
        self.latest_avg_speed = 0.0
        self.session_grand_avg_speed = 0.0
        self.session_total_speed_samples = 0
        self.csv_filename = ""

    def reset_histogram(self):
        """Core Feature: Cleans out the global wind direction array vector cleanly."""
        self.vane_histogram_accumulation = [0.0] * 8
        print("[+] Wind Rose accumulation histogram array successfully cleared.")

    def update_commands(self):
        """Dynamically recreates polling vectors when Device ID changes."""
        self.data_command = f"aaI{self.device_id}R{self.channel}A1?#\r\n"
        self.ws_reset_command = f"aaI{self.device_id}RESET?#\r\n"
        self.startup_mode_command = f"aaI{self.device_id}SEND5?#\r\n"
        print(f"[+] Active Polling Packet Command modified to: '{self.data_command.strip()}'")

    def prevent_windows_sleep(self):
        """Disables CPU and Com port timeout sleep cycles on Windows."""
        if sys.platform == "win32":
            try:
                ctypes.windll.kernel32.SetThreadExecutionState(0x80000001 | 0x00000040)
                print("[+] Windows Power Management: Background logging active.")
            except Exception as e:
                print(f"[!] Warning: Could not adjust power states: {e}")

    def allow_windows_sleep(self):
        """Restores default OS sleep modes on safe termination."""
        if sys.platform == "win32":
            try:
                ctypes.windll.kernel32.SetThreadExecutionState(0x80000000)
                print("[+] Windows Power Management: Default state restored.")
            except Exception as e:
                print(f"[!] Warning: Could not reset power states: {e}")

    def select_save_file_gui(self):
        """Launches directory picker and initiates structural data headers."""
        root = tk.Tk()
        root.withdraw()
        timestamp_suffix = time.strftime("%Y%m%d_%H%M%S")
        suggested_name = f"wind_sensor_log_{timestamp_suffix}.csv"
        
        self.csv_filename = filedialog.asksaveasfilename(
            title="Select Output Log Target",
            initialfile=suggested_name,
            defaultextension=".csv",
            filetypes=[("CSV Files", "*.csv"), ("All Files", "*.*")]
        )
        if not self.csv_filename:
            print("[-] Setup cancelled by user. Exiting.")
            self.allow_windows_sleep()
            sys.exit(0)
            
        file_exists = os.path.isfile(self.csv_filename)
        try:
            with open(self.csv_filename, mode="a", newline="", encoding="utf-8") as f:
                if not file_exists:
                    csv.writer(f).writerow(["Date & Time", "Average Speed", "Minimum Speed", "Maximum Speed", "Current Direction"])
                    print(f"[+] Tracking initialized at: {self.csv_filename}")
        except Exception as e:
            print(f"[!] Warning: File setup failed: {e}")

    def append_record(self, avg_s, min_s, max_s, heading):
        """Appends streaming array records directly onto target file storage."""
        try:
            now = time.strftime('%Y-%m-%d %H:%M:%S')
            with open(self.csv_filename, mode="a", newline="", encoding="utf-8") as f:
                csv.writer(f).writerow([now, f"{avg_s:.2f}", f"{min_s:.2f}", f"{max_s:.2f}", heading])
        except Exception as e:
            print(f"[!] Failed logging row metrics: {e}")
