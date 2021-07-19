EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8300 3500 8300 3600
Text Notes 8200 4100 2    50   ~ 0
DEBOUNCE\n(if needed)\n
Wire Wire Line
	9200 3800 9200 3600
Connection ~ 9200 3600
Wire Wire Line
	9200 3600 8400 3600
$Comp
L Device:R R?
U 1 1 60751298
P 8300 3350
AR Path="/60751298" Ref="R?"  Part="1" 
AR Path="/6073E175/60751298" Ref="R26"  Part="1" 
AR Path="/60F57495/60751298" Ref="R?"  Part="1" 
F 0 "R?" H 8370 3396 50  0000 L CNN
F 1 "10k" H 8370 3305 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 8230 3350 50  0001 C CNN
F 3 "~" H 8300 3350 50  0001 C CNN
F 4 "Farnell" H 8300 3350 50  0001 C CNN "Supplier 1"
F 5 "2073607" H 8300 3350 50  0001 C CNN "Supplier 1 Code"
F 6 "https://uk.farnell.com/multicomp/mcmr08x1002ftl/res-10k-1-0-125w-0805-ceramic/dp/2073607?st=0805%20resistor%2010k" H 8300 3350 50  0001 C CNN "Supplier 1 Web"
F 7 "0.02" H 8300 3350 50  0001 C CNN "Supplier 1 Cost"
F 8 "MCMR08X1002FTL" H 8300 3350 50  0001 C CNN "Manufacturer Part"
F 9 "C17414" H 8300 3350 50  0001 C CNN "LCSC"
F 10 "Y" H 8300 3350 50  0001 C CNN "JLCPCB Add"
F 11 "0.0029" H 8300 3350 50  0001 C CNN "JLCPCB Cost"
	1    8300 3350
	1    0    0    1   
$EndComp
Wire Wire Line
	9200 4300 8400 4300
Text HLabel 9900 3000 2    50   Input ~ 0
Vcc
Text HLabel 9900 3600 2    50   Output ~ 0
HALL_FREQ
Text HLabel 9900 4300 2    50   Input ~ 0
GND
Text HLabel 1550 3400 0    50   Input ~ 0
HALL_AC_1
Text HLabel 1500 4400 0    50   Input ~ 0
HALL_AC_2
Text Notes 5200 5000 2    50   ~ 0
Need Schmidt trigger-type circuit\nFor Hall Effect Sensor\n
Wire Wire Line
	9200 3600 9900 3600
Wire Wire Line
	8300 3000 9900 3000
Wire Wire Line
	8300 3000 8300 3200
Wire Wire Line
	9900 4300 9200 4300
Connection ~ 9200 4300
Wire Wire Line
	8400 3600 8400 3800
Connection ~ 8400 3600
Wire Wire Line
	8400 3600 8300 3600
$Comp
L Amplifier_Operational:LM321 U?
U 1 1 609A25E3
P 5050 4000
F 0 "U?" H 5394 4046 50  0000 L CNN
F 1 "LM321" H 5394 3955 50  0000 L CNN
F 2 "REInnovationFootprint:SM_SOT-23-5" H 5050 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm321.pdf" H 5050 4000 50  0001 C CNN
F 4 "Unisonic Tech" H 5050 4000 50  0001 C CNN "Manufacturer"
F 5 "LM321G-AE5-R" H 5050 4000 50  0001 C CNN "Manufacturer Part"
F 6 "C100068" H 5050 4000 50  0001 C CNN "LCSC"
F 7 "Y" H 5050 4000 50  0001 C CNN "JLCPCB Add"
F 8 "0.0778" H 5050 4000 50  0001 C CNN "JLCPCB Cost"
	1    5050 4000
	1    0    0    -1  
$EndComp
Text HLabel 5100 3550 2    50   Input ~ 0
Vcc
Text HLabel 5050 4500 2    50   Input ~ 0
GND
Wire Wire Line
	5100 3550 4950 3550
Wire Wire Line
	4950 3550 4950 3700
Wire Wire Line
	4950 4300 4950 4500
Wire Wire Line
	4950 4500 5050 4500
Text HLabel 5000 2250 2    50   Input ~ 0
Vcc
Text HLabel 5000 2900 2    50   Input ~ 0
GND
Wire Wire Line
	5000 2900 4900 2900
Wire Wire Line
	4900 2400 4900 2250
Wire Wire Line
	4900 2250 5000 2250
Text Notes 5300 5300 2    50   ~ 0
This is either for a pulse sensor (pull to gnd)\nOr for a hall effect sensor (amplifiy & convert to pulse)\n
$Comp
L Device:R R?
U 1 1 607446F0
P 3400 3400
AR Path="/607446F0" Ref="R?"  Part="1" 
AR Path="/6073E175/607446F0" Ref="R25"  Part="1" 
AR Path="/60F57495/607446F0" Ref="R?"  Part="1" 
F 0 "R?" V 3500 3400 50  0000 L CNN
F 1 "4k7" H 3470 3355 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 3330 3400 50  0001 C CNN
F 3 "~" H 3400 3400 50  0001 C CNN
F 4 " C17673" H 3400 3400 50  0001 C CNN "LCSC"
F 5 "Y" H 3400 3400 50  0001 C CNN "JLCPCB Add"
F 6 "0.0033" H 3400 3400 50  0001 C CNN "JLCPCB Cost"
	1    3400 3400
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 607455DE
P 4300 3000
AR Path="/607455DE" Ref="R?"  Part="1" 
AR Path="/6073E175/607455DE" Ref="R36"  Part="1" 
AR Path="/60F57495/607455DE" Ref="R?"  Part="1" 
F 0 "R?" V 4400 3000 50  0000 L CNN
F 1 "100k" H 4370 2955 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 4230 3000 50  0001 C CNN
F 3 "~" H 4300 3000 50  0001 C CNN
F 4 "MCWR08X1001FTL" H 4300 3000 50  0001 C CNN "Manufacturer Part"
F 5 "0.01" H 4300 3000 50  0001 C CNN "Supplier 1 Cost"
F 6 "C17407" H 4300 3000 50  0001 C CNN "LCSC"
F 7 "Y" H 4300 3000 50  0001 C CNN "JLCPCB Add"
F 8 "0.0034" H 4300 3000 50  0001 C CNN "JLCPCB Cost"
	1    4300 3000
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60748ED5
P 5000 3250
AR Path="/60748ED5" Ref="R?"  Part="1" 
AR Path="/6073E175/60748ED5" Ref="R38"  Part="1" 
AR Path="/60F57495/60748ED5" Ref="R?"  Part="1" 
F 0 "R?" V 5100 3250 50  0000 L CNN
F 1 "4M7" H 5070 3205 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 4930 3250 50  0001 C CNN
F 3 "~" H 5000 3250 50  0001 C CNN
F 4 "C17674" H 5000 3250 50  0001 C CNN "LCSC"
F 5 "Y" H 5000 3250 50  0001 C CNN "JLCPCB Add"
F 6 "0.0031" H 5000 3250 50  0001 C CNN "JLCPCB Cost"
	1    5000 3250
	0    -1   1    0   
$EndComp
Wire Wire Line
	5350 4000 5800 4000
Wire Wire Line
	5150 3250 5800 3250
Wire Wire Line
	5800 3250 5800 4000
Connection ~ 5800 4000
Wire Wire Line
	5800 4000 7400 4000
Wire Wire Line
	4300 3150 4300 3250
Text HLabel 4050 4400 2    50   Input ~ 0
GND
Wire Wire Line
	3150 3900 3150 4400
Connection ~ 3150 4400
Wire Wire Line
	3150 4400 3850 4400
Wire Wire Line
	3000 3400 3150 3400
Connection ~ 3150 3400
Wire Wire Line
	3150 3400 3250 3400
Wire Wire Line
	3550 3400 3750 3400
Wire Wire Line
	4050 3400 4050 4100
Wire Wire Line
	4050 4100 4750 4100
Wire Wire Line
	3850 3600 3850 3400
Connection ~ 3850 3400
Wire Wire Line
	3850 3400 4050 3400
Wire Wire Line
	4300 3250 4600 3250
Connection ~ 4300 3250
Wire Wire Line
	4300 3250 4300 3350
Wire Wire Line
	4750 3900 4600 3900
Wire Wire Line
	4600 3900 4600 3250
Connection ~ 4600 3250
Wire Wire Line
	4600 3250 4850 3250
Text HLabel 4350 3850 2    50   Input ~ 0
GND
Text HLabel 4350 2650 2    50   Input ~ 0
Vcc
Wire Wire Line
	4350 2650 4300 2650
Wire Wire Line
	4300 2650 4300 2850
Wire Wire Line
	4300 3650 4300 3850
Wire Wire Line
	4300 3850 4350 3850
Wire Wire Line
	4300 2650 3750 2650
Wire Wire Line
	3750 2650 3750 2850
Connection ~ 4300 2650
Wire Wire Line
	3750 3150 3750 3400
Connection ~ 3750 3400
Wire Wire Line
	3750 3400 3850 3400
Wire Wire Line
	8300 3600 7400 3600
Wire Wire Line
	7400 3600 7400 4000
Connection ~ 8300 3600
Wire Wire Line
	4050 4400 3850 4400
Connection ~ 3850 4400
$Comp
L Device:R R?
U 1 1 6079CF2E
P 4300 3500
AR Path="/6079CF2E" Ref="R?"  Part="1" 
AR Path="/6073E175/6079CF2E" Ref="R37"  Part="1" 
AR Path="/60F57495/6079CF2E" Ref="R?"  Part="1" 
F 0 "R?" H 4370 3546 50  0000 L CNN
F 1 "10k" H 4370 3455 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 4230 3500 50  0001 C CNN
F 3 "~" H 4300 3500 50  0001 C CNN
F 4 "Farnell" H 4300 3500 50  0001 C CNN "Supplier 1"
F 5 "2073607" H 4300 3500 50  0001 C CNN "Supplier 1 Code"
F 6 "https://uk.farnell.com/multicomp/mcmr08x1002ftl/res-10k-1-0-125w-0805-ceramic/dp/2073607?st=0805%20resistor%2010k" H 4300 3500 50  0001 C CNN "Supplier 1 Web"
F 7 "0.02" H 4300 3500 50  0001 C CNN "Supplier 1 Cost"
F 8 "MCMR08X1002FTL" H 4300 3500 50  0001 C CNN "Manufacturer Part"
F 9 "C17414" H 4300 3500 50  0001 C CNN "LCSC"
F 10 "Y" H 4300 3500 50  0001 C CNN "JLCPCB Add"
F 11 "0.0029" H 4300 3500 50  0001 C CNN "JLCPCB Cost"
	1    4300 3500
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 6079D863
P 3750 3000
AR Path="/6079D863" Ref="R?"  Part="1" 
AR Path="/6073E175/6079D863" Ref="R35"  Part="1" 
AR Path="/60F57495/6079D863" Ref="R?"  Part="1" 
F 0 "R?" V 3850 3000 50  0000 L CNN
F 1 "100k" H 3820 2955 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 3680 3000 50  0001 C CNN
F 3 "~" H 3750 3000 50  0001 C CNN
F 4 "MCWR08X1001FTL" H 3750 3000 50  0001 C CNN "Manufacturer Part"
F 5 "0.01" H 3750 3000 50  0001 C CNN "Supplier 1 Cost"
F 6 "C17407" H 3750 3000 50  0001 C CNN "LCSC"
F 7 "Y" H 3750 3000 50  0001 C CNN "JLCPCB Add"
F 8 "0.0034" H 3750 3000 50  0001 C CNN "JLCPCB Cost"
	1    3750 3000
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6079E09B
P 2850 3400
AR Path="/6079E09B" Ref="R?"  Part="1" 
AR Path="/6073E175/6079E09B" Ref="R24"  Part="1" 
AR Path="/60F57495/6079E09B" Ref="R?"  Part="1" 
F 0 "R?" V 2950 3400 50  0000 L CNN
F 1 "4k7" H 2920 3355 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 2780 3400 50  0001 C CNN
F 3 "~" H 2850 3400 50  0001 C CNN
F 4 " C17673" H 2850 3400 50  0001 C CNN "LCSC"
F 5 "Y" H 2850 3400 50  0001 C CNN "JLCPCB Add"
F 6 "0.0033" H 2850 3400 50  0001 C CNN "JLCPCB Cost"
	1    2850 3400
	0    1    -1   0   
$EndComp
Wire Wire Line
	1550 3400 2700 3400
Wire Wire Line
	1500 4400 3150 4400
$Comp
L matts_components:ZENERsmall D?
U 1 1 60F5F219
P 9200 3900
F 0 "D?" V 9154 3969 50  0000 L CNN
F 1 "3V3_Zener" V 9245 3969 50  0000 L CNN
F 2 "" H 9200 3900 50  0000 C CNN
F 3 "" H 9200 3900 50  0000 C CNN
	1    9200 3900
	0    1    1    0   
$EndComp
$Comp
L matts_components:ZENERsmall D?
U 1 1 60F5F616
P 3150 3800
F 0 "D?" V 3104 3869 50  0000 L CNN
F 1 "3V3_Zener" V 3195 3869 50  0000 L CNN
F 2 "" H 3150 3800 50  0000 C CNN
F 3 "" H 3150 3800 50  0000 C CNN
	1    3150 3800
	0    1    1    0   
$EndComp
$Comp
L device:C C?
U 1 1 60F5FBE8
P 8400 3950
F 0 "C?" H 8515 3996 50  0000 L CNN
F 1 "100n" H 8515 3905 50  0000 L CNN
F 2 "" H 8438 3800 50  0001 C CNN
F 3 "~" H 8400 3950 50  0001 C CNN
	1    8400 3950
	1    0    0    -1  
$EndComp
$Comp
L device:C C?
U 1 1 60F5FEAC
P 4900 2550
F 0 "C?" H 5015 2596 50  0000 L CNN
F 1 "100n" H 5015 2505 50  0000 L CNN
F 2 "" H 4938 2400 50  0001 C CNN
F 3 "~" H 4900 2550 50  0001 C CNN
	1    4900 2550
	1    0    0    -1  
$EndComp
$Comp
L device:C C?
U 1 1 60F601A3
P 3850 3750
F 0 "C?" H 3965 3796 50  0000 L CNN
F 1 "22n" H 3965 3705 50  0000 L CNN
F 2 "" H 3888 3600 50  0001 C CNN
F 3 "~" H 3850 3750 50  0001 C CNN
	1    3850 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2700 4900 2900
Wire Wire Line
	3850 3900 3850 4400
Wire Wire Line
	3150 3400 3150 3700
Wire Wire Line
	8400 4100 8400 4300
Wire Wire Line
	9200 4000 9200 4300
$EndSCHEMATC
