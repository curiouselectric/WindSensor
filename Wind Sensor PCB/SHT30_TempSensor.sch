EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4750 4450 0    60   ~ 0
Temperature & Humidity\nMeasurement\n
Text HLabel 4600 3800 0    60   Output ~ 0
SCL_I2C
Text HLabel 4600 3700 0    60   Output ~ 0
SDA_I2C
Wire Wire Line
	6550 2900 6550 2750
Wire Wire Line
	6800 4650 6800 4550
$Comp
L device:C C4
U 1 1 60FE1B8A
P 7650 3700
F 0 "C4" H 7675 3800 50  0000 L CNN
F 1 "100n" H 7675 3600 50  0000 L CNN
F 2 "REInnovationFootprint:SM_C_0805" H 7688 3550 50  0001 C CNN
F 3 "" H 7650 3700 50  0000 C CNN
F 4 "C49678" H 7650 3700 50  0001 C CNN "LCSC"
F 5 "Y" H 7650 3700 50  0001 C CNN "JLCPCB Add"
F 6 "0.0108" H 7650 3700 50  0001 C CNN "JLCPCB Cost"
	1    7650 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	7650 3950 7650 3850
Wire Wire Line
	7650 3550 7650 3450
Text HLabel 6550 2750 0    60   Input ~ 0
Vcc
Text HLabel 6800 4650 0    60   Input ~ 0
GND
Text HLabel 7650 3450 2    60   Input ~ 0
Vcc
Text HLabel 7650 3950 2    60   Input ~ 0
GND
$Comp
L SHT30-DIS-B:SHT30-DIS-B U?
U 1 1 60F6C1A4
P 5450 3700
F 0 "U?" H 5450 4367 50  0000 C CNN
F 1 "SHT30-DIS-B" H 5450 4276 50  0000 C CNN
F 2 "DFN250X250X100-9N" H 5450 3700 50  0001 L BNN
F 3 "" H 5450 3700 50  0001 L BNN
F 4 "Sensirion" H 5450 3700 50  0001 L BNN "MANUFACTURER"
	1    5450 3700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
