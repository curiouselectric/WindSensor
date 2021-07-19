EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
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
L matts_components:DIODE D?
U 1 1 6070C5B1
P 4000 2650
F 0 "D?" H 4000 2842 40  0000 C CNN
F 1 "1N4001F" H 4000 2766 40  0000 C CNN
F 2 "REInnovationFootprint:SMA_F" H 4000 2650 60  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/SK-1N4001F_C122841.pdf" H 4000 2650 60  0001 C CNN
F 4 "C122841" H 4000 2650 50  0001 C CNN "LCSC"
F 5 "Y" H 4000 2650 50  0001 C CNN "JLCPCB Add"
F 6 "0.0074" H 4000 2650 50  0001 C CNN "JLCPCB Cost"
	1    4000 2650
	1    0    0    -1  
$EndComp
$Comp
L Isolator:NSL-32 U?
U 1 1 60710058
P 4900 3200
F 0 "U?" H 4900 3517 50  0000 C CNN
F 1 "EL357N-G" H 4900 3426 50  0000 C CNN
F 2 "REInnovationFootprint:SOP-4_4.1x4.4x2.54P" H 4900 2900 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Everlight-Elec-EL357N-B-TA-G_C6649.pdf" H 4950 3200 50  0001 C CNN
F 4 "Everlight" H 4900 3200 50  0001 C CNN "Manufacturer"
F 5 "EL357N-G" H 4900 3200 50  0001 C CNN "Manufacturer Part"
F 6 "C6649" H 4900 3200 50  0001 C CNN "LCSC"
F 7 "Y" H 4900 3200 50  0001 C CNN "JLCPCB Add"
F 8 "0.0607" H 4900 3200 50  0001 C CNN "JLCPCB Cost"
	1    4900 3200
	1    0    0    -1  
$EndComp
Text HLabel 5850 2650 2    50   Input ~ 0
Vcc
Text HLabel 3500 2650 0    50   Input ~ 0
AC_IN_1
Text HLabel 3500 3300 0    50   Input ~ 0
AC_IN_2
Text HLabel 8150 3750 2    50   Input ~ 0
GND
Text HLabel 8100 3100 2    50   Output ~ 0
AC_FREQ
Wire Wire Line
	3500 2650 3800 2650
Wire Wire Line
	4200 2650 4350 2650
Wire Wire Line
	4350 2650 4350 2750
Wire Wire Line
	4350 3050 4350 3100
Wire Wire Line
	4350 3100 4600 3100
Wire Wire Line
	5850 2650 5400 2650
Wire Wire Line
	5400 2650 5400 2700
Wire Wire Line
	5200 3100 5400 3100
Wire Wire Line
	5850 3300 5200 3300
Wire Wire Line
	5400 3000 5400 3100
Connection ~ 5400 3100
Wire Wire Line
	3500 3300 4600 3300
$Comp
L Device:R R?
U 1 1 60746323
P 6100 3100
AR Path="/60746323" Ref="R?"  Part="1" 
AR Path="/6070BDD0/60746323" Ref="R23"  Part="1" 
AR Path="/60F56E7F/60746323" Ref="R?"  Part="1" 
F 0 "R?" V 6200 3100 50  0000 L CNN
F 1 "1k" H 6170 3055 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 6030 3100 50  0001 C CNN
F 3 "~" H 6100 3100 50  0001 C CNN
F 4 "Farnell" H 6100 3100 50  0001 C CNN "Supplier 1"
F 5 "2447587" H 6100 3100 50  0001 C CNN "Supplier 1 Code"
F 6 "https://uk.farnell.com/multicomp/mcwr08x1001ftl/res-1k-1-0-125w-0805-thick-film/dp/2447587" H 6100 3100 50  0001 C CNN "Supplier 1 Web"
F 7 "MCWR08X1001FTL" H 6100 3100 50  0001 C CNN "Manufacturer Part"
F 8 "0.01" H 6100 3100 50  0001 C CNN "Supplier 1 Cost"
F 9 "C17513" H 6100 3100 50  0001 C CNN "LCSC"
F 10 "Y" H 6100 3100 50  0001 C CNN "JLCPCB Add"
F 11 "0.0029" H 6100 3100 50  0001 C CNN "JLCPCB Cost"
	1    6100 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 3750 7350 3750
Wire Wire Line
	5850 3750 5850 3300
Wire Wire Line
	6750 3500 6750 3750
Connection ~ 6750 3750
Wire Wire Line
	6750 3750 5850 3750
Wire Wire Line
	7350 3500 7350 3750
Connection ~ 7350 3750
Wire Wire Line
	7350 3750 6750 3750
Wire Wire Line
	5400 3100 5950 3100
$Comp
L Device:R R?
U 1 1 6099C405
P 4350 2900
AR Path="/6099C405" Ref="R?"  Part="1" 
AR Path="/6070BDD0/6099C405" Ref="R16"  Part="1" 
AR Path="/60F56E7F/6099C405" Ref="R?"  Part="1" 
F 0 "R?" V 4450 2900 50  0000 L CNN
F 1 "1k" H 4420 2855 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 4280 2900 50  0001 C CNN
F 3 "~" H 4350 2900 50  0001 C CNN
F 4 "Farnell" H 4350 2900 50  0001 C CNN "Supplier 1"
F 5 "2447587" H 4350 2900 50  0001 C CNN "Supplier 1 Code"
F 6 "https://uk.farnell.com/multicomp/mcwr08x1001ftl/res-1k-1-0-125w-0805-thick-film/dp/2447587" H 4350 2900 50  0001 C CNN "Supplier 1 Web"
F 7 "MCWR08X1001FTL" H 4350 2900 50  0001 C CNN "Manufacturer Part"
F 8 "0.01" H 4350 2900 50  0001 C CNN "Supplier 1 Cost"
F 9 "C17513" H 4350 2900 50  0001 C CNN "LCSC"
F 10 "Y" H 4350 2900 50  0001 C CNN "JLCPCB Add"
F 11 "0.0029" H 4350 2900 50  0001 C CNN "JLCPCB Cost"
	1    4350 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 6099CDAE
P 5400 2850
AR Path="/6099CDAE" Ref="R?"  Part="1" 
AR Path="/6070BDD0/6099CDAE" Ref="R17"  Part="1" 
AR Path="/60F56E7F/6099CDAE" Ref="R?"  Part="1" 
F 0 "R?" V 5500 2850 50  0000 L CNN
F 1 "10k" H 5470 2805 50  0000 L CNN
F 2 "REInnovationFootprint:SM0805" V 5330 2850 50  0001 C CNN
F 3 "~" H 5400 2850 50  0001 C CNN
F 4 "Farnell" H 5400 2850 50  0001 C CNN "Supplier 1"
F 5 "0.01" H 5400 2850 50  0001 C CNN "Supplier 1 Cost"
F 6 " C17414" H 5400 2850 50  0001 C CNN "LCSC"
F 7 "Y" H 5400 2850 50  0001 C CNN "JLCPCB Add"
F 8 "0.0030" H 5400 2850 50  0001 C CNN "JLCPCB Cost"
	1    5400 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 3100 6750 3100
$Comp
L device:C C?
U 1 1 60F5D1E2
P 6750 3350
F 0 "C?" H 6865 3396 50  0000 L CNN
F 1 "100n" H 6865 3305 50  0000 L CNN
F 2 "" H 6788 3200 50  0001 C CNN
F 3 "~" H 6750 3350 50  0001 C CNN
	1    6750 3350
	1    0    0    -1  
$EndComp
$Comp
L matts_components:ZENERsmall D?
U 1 1 60F5D76A
P 7350 3400
F 0 "D?" V 7304 3469 50  0000 L CNN
F 1 "3V3_Zener" V 7395 3469 50  0000 L CNN
F 2 "" H 7350 3400 50  0000 C CNN
F 3 "" H 7350 3400 50  0000 C CNN
	1    7350 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 3300 7350 3100
Connection ~ 7350 3100
Wire Wire Line
	7350 3100 8100 3100
Wire Wire Line
	6750 3200 6750 3100
Connection ~ 6750 3100
Wire Wire Line
	6750 3100 7350 3100
$EndSCHEMATC
