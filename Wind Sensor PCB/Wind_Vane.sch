EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7100 3600 2    60   Output ~ 0
VANE_OUT
$Comp
L device:C C4
U 1 1 60FE1B8A
P 8800 3300
F 0 "C4" H 8825 3400 50  0000 L CNN
F 1 "100n" H 8825 3200 50  0000 L CNN
F 2 "REInnovationFootprint:SM_C_0805" H 8838 3150 50  0001 C CNN
F 3 "" H 8800 3300 50  0000 C CNN
F 4 "C49678" H 8800 3300 50  0001 C CNN "LCSC"
F 5 "Y" H 8800 3300 50  0001 C CNN "JLCPCB Add"
F 6 "0.0108" H 8800 3300 50  0001 C CNN "JLCPCB Cost"
	1    8800 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 3550 8800 3450
Wire Wire Line
	8800 3150 8800 3050
Text HLabel 5250 3150 1    60   Input ~ 0
Vcc
Text HLabel 5250 4050 3    60   Input ~ 0
GND
Text HLabel 8800 3050 2    60   Input ~ 0
Vcc
Text HLabel 8800 3550 2    60   Input ~ 0
GND
Text HLabel 3350 3350 0    60   Output ~ 0
WIND_V+
Text HLabel 3350 3500 0    60   Output ~ 0
WIND_V_SIG
Text HLabel 3350 3650 0    60   Output ~ 0
WIND_V_GND
Text Notes 3800 5300 0    50   ~ 0
This adds some filtering and overvoltage protection for different wind vanes\nWind vane with 8 reed switchs + resistors - Output is stepped voltage\nWind vane with potentionmeter - Output is continous voltage
$Comp
L Amplifier_Operational:TSV911xxLx U?
U 1 1 60F77EAA
P 5350 3600
AR Path="/60F77EAA" Ref="U?"  Part="1" 
AR Path="/60F87947/60F77EAA" Ref="U?"  Part="1" 
AR Path="/60F57495/60F77EAA" Ref="U?"  Part="1" 
AR Path="/60FC880C/60F77EAA" Ref="U1"  Part="1" 
F 0 "U1" H 5694 3646 50  0000 L CNN
F 1 "TSV911xxLx" H 5450 3450 50  0000 L CNN
F 2 "REInnovationFootprint:SM_SOT-23-5" H 5250 3400 50  0001 L CNN
F 3 "www.st.com/resource/en/datasheet/tsv911.pdf" H 5350 3800 50  0001 C CNN
F 4 "C361052" H 5350 3600 50  0001 C CNN "LCSC"
F 5 "Y" H 5350 3600 50  0001 C CNN "JLCPCB Add"
F 6 "0.4576" H 5350 3600 50  0001 C CNN "JLCPCB Cost"
	1    5350 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3300 5250 3150
Wire Wire Line
	5250 4050 5250 3900
Wire Wire Line
	5050 3700 4750 3700
Wire Wire Line
	4750 3700 4750 4500
Wire Wire Line
	4750 4500 6050 4500
Wire Wire Line
	6050 4500 6050 3600
Wire Wire Line
	6050 3600 5650 3600
Text HLabel 3550 2550 1    60   Input ~ 0
Vcc
Text HLabel 3550 4400 3    60   Input ~ 0
GND
Wire Wire Line
	3350 3350 3550 3350
Wire Wire Line
	4200 4250 3550 4250
Wire Wire Line
	3550 4250 3550 3650
Wire Wire Line
	3550 3650 3350 3650
Wire Wire Line
	3550 4400 3550 4250
Connection ~ 3550 4250
Wire Wire Line
	3350 3500 4000 3500
Wire Wire Line
	4200 3850 4200 3500
Connection ~ 4200 3500
Wire Wire Line
	4200 3500 5050 3500
Text HLabel 6850 4650 3    60   Input ~ 0
GND
Connection ~ 6050 3600
Wire Wire Line
	6850 3950 6850 3600
Connection ~ 6850 3600
Wire Wire Line
	6850 3600 7100 3600
Wire Wire Line
	6050 3600 6850 3600
$Comp
L matts_components:ZENERsmall D?
U 1 1 610F8DED
P 4200 3950
AR Path="/60F57495/610F8DED" Ref="D?"  Part="1" 
AR Path="/60FC880C/610F8DED" Ref="D1"  Part="1" 
F 0 "D1" V 4154 4019 50  0000 L CNN
F 1 "5V1_Zener" V 4245 4019 50  0000 L CNN
F 2 "REInnovationFootprint:SOT23_ZENER" H 4200 3950 50  0001 C CNN
F 3 "" H 4200 3950 50  0000 C CNN
F 4 "C131770" H 4200 3950 50  0001 C CNN "LCSC"
F 5 "Y" H 4200 3950 50  0001 C CNN "JLCPCB Add"
	1    4200 3950
	0    1    1    0   
$EndComp
$Comp
L matts_components:ZENERsmall D?
U 1 1 610F9246
P 6850 4050
AR Path="/60F57495/610F9246" Ref="D?"  Part="1" 
AR Path="/60FC880C/610F9246" Ref="D3"  Part="1" 
F 0 "D3" V 6804 4119 50  0000 L CNN
F 1 "5V1_Zener" V 6895 4119 50  0000 L CNN
F 2 "REInnovationFootprint:SOT23_ZENER" H 6850 4050 50  0001 C CNN
F 3 "" H 6850 4050 50  0000 C CNN
F 4 "C131770" H 6850 4050 50  0001 C CNN "LCSC"
F 5 "Y" H 6850 4050 50  0001 C CNN "JLCPCB Add"
	1    6850 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 4250 4200 4050
Wire Wire Line
	6850 4150 6850 4650
$Comp
L Device:R R?
U 1 1 6165E116
P 4000 3050
F 0 "R?" H 4070 3096 50  0000 L CNN
F 1 "10k" H 4070 3005 50  0000 L CNN
F 2 "" V 3930 3050 50  0001 C CNN
F 3 "~" H 4000 3050 50  0001 C CNN
	1    4000 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2550 3550 2700
Wire Wire Line
	4000 3200 4000 3500
Connection ~ 4000 3500
Wire Wire Line
	4000 3500 4200 3500
Wire Wire Line
	4000 2900 4000 2700
Wire Wire Line
	4000 2700 3550 2700
Connection ~ 3550 2700
Wire Wire Line
	3550 2700 3550 3350
Text Notes 4050 2850 0    50   ~ 0
Potential divider here:\n10k for the Maplin vane
$EndSCHEMATC
