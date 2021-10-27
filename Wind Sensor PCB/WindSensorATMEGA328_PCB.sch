EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 59012D3E
P 6650 6750
F 0 "P5" H 6650 6850 50  0000 C CNN
F 1 "LOGO2" V 6750 6750 50  0000 C CNN
F 2 "CuriousElectric3:TCEC_Words_13mm" H 6650 6750 50  0001 C CNN
F 3 "" H 6650 6750 50  0000 C CNN
	1    6650 6750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 59012DA7
P 6650 7050
F 0 "P6" H 6650 7150 50  0000 C CNN
F 1 "PCB" V 6750 7050 50  0000 C CNN
F 2 "REInnovationFootprint:PCB_45_45_Cut_Out_Solar_Sensor" H 6650 7050 50  0001 C CNN
F 3 "" H 6650 7050 50  0000 C CNN
	1    6650 7050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 59012E13
P 6650 7400
F 0 "P7" H 6650 7500 50  0000 C CNN
F 1 "ENC" V 6750 7400 50  0000 C CNN
F 2 "" H 6650 7400 50  0001 C CNN
F 3 "https://www.rapidonline.com/pdf/30-3800e.pdf" H 6650 7400 50  0001 C CNN
F 4 "~" H 6650 7400 60  0000 C CNN "Notes"
F 5 "~" H 6650 7400 60  0001 C CNN "Description"
F 6 "~" H 6650 7400 60  0001 C CNN "Manufacturer"
F 7 "~" H 6650 7400 60  0001 C CNN "Manufacturer Part No"
F 8 "Rapid" H 6650 7400 60  0001 C CNN "Supplier 1"
F 9 "30-3804" H 6650 7400 60  0001 C CNN "Supplier 1 Part No"
F 10 "4.37" H 6650 7400 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6650 7400 60  0001 C CNN "Supplier 2"
F 12 "~" H 6650 7400 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6650 7400 60  0001 C CNN "Supplier 2 Cost"
	1    6650 7400
	1    0    0    -1  
$EndComp
NoConn ~ 6450 6750
NoConn ~ 6450 7050
NoConn ~ 6450 7400
$Sheet
S 3450 2900 750  850 
U 60FC880C
F0 "Wind_Vane" 50
F1 "Wind_Vane.sch" 50
F2 "Vcc" I L 3450 3050 50 
F3 "GND" I L 3450 3150 50 
F4 "VANE_OUT" O R 4200 3250 50 
F5 "WIND_V+" O L 3450 3450 50 
F6 "WIND_V_SIG" O L 3450 3550 50 
F7 "WIND_V_GND" O L 3450 3650 50 
$EndSheet
$Sheet
S 5500 3250 800  1850
U 60FF06B8
F0 "ATMega328" 60
F1 "atmega328.sch" 60
F2 "Vcc" I L 5500 3350 50 
F3 "GND" I L 5500 3450 50 
F4 "I2C_SCL" O R 6300 4200 50 
F5 "I2C_SDA" O R 6300 4100 50 
F6 "RXI" I L 5500 3600 50 
F7 "TXO" O L 5500 3700 50 
F8 "D2" O L 5500 3800 50 
F9 "D3" O L 5500 3900 50 
F10 "D4" O L 5500 4000 50 
F11 "D5" O L 5500 4100 50 
F12 "D6" O L 5500 4200 50 
F13 "D7_LED0" O L 5500 4300 50 
F14 "A0" O R 6300 3700 50 
F15 "A1" O R 6300 3800 50 
F16 "A2" O R 6300 3900 50 
F17 "A3" O R 6300 4000 50 
F18 "A6" O R 6300 4300 50 
F19 "A7" O R 6300 4400 50 
F20 "D8_SWA" O L 5500 4400 50 
F21 "D9_SWB" O L 5500 4500 50 
F22 "D10" O L 5500 4600 50 
F23 "MOSI" O L 5500 4700 50 
F24 "MISO" O L 5500 4800 50 
F25 "SCLK" O L 5500 4900 50 
$EndSheet
$Comp
L Connector_Generic:Conn_01x04 P2
U 1 1 60F54143
P 2300 2200
F 0 "P2" H 2300 2450 50  0000 C CNN
F 1 "SERIAL" V 2400 2200 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-4_Grove_SCREW" H 2300 2200 50  0001 C CNN
F 3 "" H 2300 2200 50  0000 C CNN
	1    2300 2200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 60F544CC
P 2650 2450
F 0 "#PWR01" H 2650 2200 50  0001 C CNN
F 1 "GND" H 2650 2300 50  0000 C CNN
F 2 "" H 2650 2450 50  0000 C CNN
F 3 "" H 2650 2450 50  0000 C CNN
	1    2650 2450
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 60F54817
P 2850 2300
F 0 "#PWR02" H 2850 2150 50  0001 C CNN
F 1 "VCC" H 2850 2440 50  0000 C CNN
F 2 "" H 2850 2300 50  0000 C CNN
F 3 "" H 2850 2300 50  0000 C CNN
	1    2850 2300
	-1   0    0    -1  
$EndComp
Text Label 2650 2200 2    50   ~ 0
Rx
Text Label 2650 2100 2    50   ~ 0
Tx
Wire Wire Line
	2850 2300 2500 2300
Wire Wire Line
	2650 2200 2500 2200
Wire Wire Line
	2650 2100 2500 2100
Wire Wire Line
	2500 2400 2650 2400
Wire Wire Line
	2650 2400 2650 2450
$Comp
L power:GND #PWR08
U 1 1 60F5D9DB
P 5150 3500
F 0 "#PWR08" H 5150 3250 50  0001 C CNN
F 1 "GND" H 5150 3350 50  0000 C CNN
F 2 "" H 5150 3500 50  0000 C CNN
F 3 "" H 5150 3500 50  0000 C CNN
	1    5150 3500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 60F5D9E1
P 5150 3350
F 0 "#PWR07" H 5150 3200 50  0001 C CNN
F 1 "VCC" H 5150 3490 50  0000 C CNN
F 2 "" H 5150 3350 50  0000 C CNN
F 3 "" H 5150 3350 50  0000 C CNN
	1    5150 3350
	1    0    0    -1  
$EndComp
Text Label 5350 3600 0    50   ~ 0
Rx
Text Label 5350 3700 0    50   ~ 0
Tx
Wire Wire Line
	5150 3350 5500 3350
Wire Wire Line
	5350 3600 5500 3600
Wire Wire Line
	5350 3700 5500 3700
Wire Wire Line
	5150 3450 5150 3500
Wire Wire Line
	5150 3450 5500 3450
$Comp
L power:GND #PWR06
U 1 1 60F70FDB
P 3100 3200
F 0 "#PWR06" H 3100 2950 50  0001 C CNN
F 1 "GND" H 3100 3050 50  0000 C CNN
F 2 "" H 3100 3200 50  0000 C CNN
F 3 "" H 3100 3200 50  0000 C CNN
	1    3100 3200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 60F70FE1
P 3100 3050
F 0 "#PWR05" H 3100 2900 50  0001 C CNN
F 1 "VCC" H 3100 3190 50  0000 C CNN
F 2 "" H 3100 3050 50  0000 C CNN
F 3 "" H 3100 3050 50  0000 C CNN
	1    3100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3050 3450 3050
Wire Wire Line
	3100 3150 3100 3200
Wire Wire Line
	3100 3150 3450 3150
Text Label 6450 4100 0    50   ~ 0
I2C_SDA
Text Label 6450 4200 0    50   ~ 0
I2C_CLK
Wire Wire Line
	6300 4100 6450 4100
Wire Wire Line
	6300 4200 6450 4200
Text Notes 2150 2700 0    60   ~ 0
SERIAL
$Sheet
S 3450 4450 750  800 
U 60F57495
F0 "Hall_to_Freq" 50
F1 "Hall_to_Freq.sch" 50
F2 "Vcc" I L 3450 4550 50 
F3 "HALL_FREQ" O R 4200 4800 50 
F4 "GND" I L 3450 4650 50 
F5 "WIND_A+" I L 3450 4900 50 
F6 "WIND_A_GND" I L 3450 5100 50 
F7 "WIND_A_SIG" I L 3450 5000 50 
$EndSheet
$Comp
L power:GND #PWR0102
U 1 1 60F655DF
P 3100 4700
F 0 "#PWR0102" H 3100 4450 50  0001 C CNN
F 1 "GND" H 3100 4550 50  0000 C CNN
F 2 "" H 3100 4700 50  0000 C CNN
F 3 "" H 3100 4700 50  0000 C CNN
	1    3100 4700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 60F655E5
P 3100 4550
F 0 "#PWR0103" H 3100 4400 50  0001 C CNN
F 1 "VCC" H 3100 4690 50  0000 C CNN
F 2 "" H 3100 4550 50  0000 C CNN
F 3 "" H 3100 4550 50  0000 C CNN
	1    3100 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4550 3450 4550
Wire Wire Line
	3100 4650 3100 4700
Wire Wire Line
	3100 4650 3450 4650
$Comp
L Connector_Generic:Conn_01x03 P11
U 1 1 60F65D3A
P 2350 5000
F 0 "P11" H 2268 5317 50  0000 C CNN
F 1 "WIND_A" H 2268 5226 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_screw_terminal" H 2350 5000 50  0001 C CNN
F 3 "~" H 2350 5000 50  0001 C CNN
	1    2350 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2550 4900 3450 4900
Wire Wire Line
	3450 5000 2550 5000
Wire Wire Line
	2550 5100 3450 5100
$Comp
L Connector_Generic:Conn_01x03 P8
U 1 1 60F7494C
P 2300 3550
F 0 "P8" H 2218 3867 50  0000 C CNN
F 1 "VANE" H 2218 3776 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_screw_terminal" H 2300 3550 50  0001 C CNN
F 3 "~" H 2300 3550 50  0001 C CNN
	1    2300 3550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 3450 3450 3450
Wire Wire Line
	3450 3550 2500 3550
Wire Wire Line
	2500 3650 3450 3650
Text Label 6450 4000 0    50   ~ 0
WIND_VANE
Text Label 4350 3250 0    50   ~ 0
WIND_VANE
Wire Wire Line
	4200 3250 4350 3250
Wire Wire Line
	6300 4000 6450 4000
Text Label 4350 4800 0    50   ~ 0
WIND_FREQ
Text Label 4950 3800 0    50   ~ 0
WIND_FREQ
Wire Wire Line
	5500 3800 4950 3800
Wire Wire Line
	4200 4800 4350 4800
$EndSCHEMATC
