EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 5591 7890
encoding utf-8
Sheet 1 1
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
L Connector:Raspberry_Pi_2_3 J?
U 1 1 5FD567D2
P 2000 2300
F 0 "J?" H 2000 3781 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 2000 3690 50  0000 C CNN
F 2 "" H 2000 2300 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 2000 2300 50  0001 C CNN
	1    2000 2300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:TIP120 Q?
U 1 1 5FD60C1C
P 2750 3750
F 0 "Q?" H 2957 3796 50  0000 L CNN
F 1 "TIP120" H 2957 3705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2950 3675 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 2750 3750 50  0001 L CNN
	1    2750 3750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:TIP120 Q?
U 1 1 5FD6675B
P 2750 5300
F 0 "Q?" H 2957 5346 50  0000 L CNN
F 1 "TIP120" H 2957 5255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2950 5225 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 2750 5300 50  0001 L CNN
	1    2750 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3750 1100 3750
Wire Wire Line
	2550 5300 900  5300
$Comp
L Transistor_BJT:TIP120 Q?
U 1 1 5FD64373
P 2750 4500
F 0 "Q?" H 2957 4546 50  0000 L CNN
F 1 "TIP120" H 2957 4455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2950 4425 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 2750 4500 50  0001 L CNN
	1    2750 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FD882D3
P 2850 3950
F 0 "#PWR?" H 2850 3700 50  0001 C CNN
F 1 "GND" H 2855 3777 50  0000 C CNN
F 2 "" H 2850 3950 50  0001 C CNN
F 3 "" H 2850 3950 50  0001 C CNN
	1    2850 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FD8881A
P 2850 4700
F 0 "#PWR?" H 2850 4450 50  0001 C CNN
F 1 "GND" H 2855 4527 50  0000 C CNN
F 2 "" H 2850 4700 50  0001 C CNN
F 3 "" H 2850 4700 50  0001 C CNN
	1    2850 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FD88D79
P 2850 5500
F 0 "#PWR?" H 2850 5250 50  0001 C CNN
F 1 "GND" H 2855 5327 50  0000 C CNN
F 2 "" H 2850 5500 50  0001 C CNN
F 3 "" H 2850 5500 50  0001 C CNN
	1    2850 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5FD9909E
P 4150 3100
F 0 "J?" H 4178 3076 50  0000 L CNN
F 1 "Conn_01x04_Female" H 4178 2985 50  0000 L CNN
F 2 "" H 4150 3100 50  0001 C CNN
F 3 "~" H 4150 3100 50  0001 C CNN
	1    4150 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5FD9CA2C
P 3600 2750
F 0 "#PWR?" H 3600 2600 50  0001 C CNN
F 1 "+12V" H 3615 2923 50  0000 C CNN
F 2 "" H 3600 2750 50  0001 C CNN
F 3 "" H 3600 2750 50  0001 C CNN
	1    3600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2750 3600 3000
Wire Wire Line
	3600 3000 3950 3000
Wire Wire Line
	2850 3550 2850 3100
Wire Wire Line
	2850 3100 3950 3100
Wire Wire Line
	2850 4300 3300 4300
Wire Wire Line
	3300 4300 3300 3200
Wire Wire Line
	3300 3200 3950 3200
Wire Wire Line
	2850 5100 3450 5100
Wire Wire Line
	3450 5100 3450 3300
Wire Wire Line
	3450 3300 3950 3300
Wire Wire Line
	2550 4500 1000 4500
Wire Wire Line
	1200 3000 1100 3000
Wire Wire Line
	1100 3000 1100 3750
Wire Wire Line
	1200 2500 1000 2500
Wire Wire Line
	1000 2500 1000 4500
Wire Wire Line
	900  1800 1200 1800
Wire Wire Line
	900  1800 900  5300
$EndSCHEMATC
