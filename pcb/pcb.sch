EESchema Schematic File Version 4
LIBS:pcb-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
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
L Connector:USB_A J1
U 1 1 618AD874
P 6550 1450
F 0 "J1" H 6607 1917 50  0000 C CNN
F 1 "USB_A" H 6607 1826 50  0000 C CNN
F 2 "aa:USB-A-SMT-8231_fix00" H 6700 1400 50  0001 C CNN
F 3 " ~" H 6700 1400 50  0001 C CNN
	1    6550 1450
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2127N-1.0 U2
U 1 1 618AF286
P 8250 1250
F 0 "U2" H 8250 1492 50  0000 C CNN
F 1 "LM3480-3.3" H 8250 1401 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8250 1475 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm3480.pdf" H 8250 1250 50  0001 C CNN
	1    8250 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 618B076D
P 7200 1550
F 0 "R3" V 7250 1350 50  0000 C CNN
F 1 "68" V 7200 1550 50  0000 C CNN
F 2 "aa:R_0402_x2" V 7130 1550 50  0001 C CNN
F 3 "~" H 7200 1550 50  0001 C CNN
	1    7200 1550
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 618B0E64
P 7200 1450
F 0 "R2" V 7150 1250 50  0000 C CNN
F 1 "68" V 7200 1450 50  0000 C CNN
F 2 "aa:R_0402_x2" V 7130 1450 50  0001 C CNN
F 3 "~" H 7200 1450 50  0001 C CNN
	1    7200 1450
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 618B1267
P 6950 1950
F 0 "R1" H 7020 1996 50  0000 L CNN
F 1 "1.5k" H 7020 1905 50  0000 L CNN
F 2 "aa:R_0402_HandSoldering" V 6880 1950 50  0001 C CNN
F 3 "~" H 6950 1950 50  0001 C CNN
	1    6950 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 618B190A
P 4100 3300
F 0 "C2" V 3848 3300 50  0000 C CNN
F 1 "22pF" V 3939 3300 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4138 3150 50  0001 C CNN
F 3 "~" H 4100 3300 50  0001 C CNN
	1    4100 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 618B1DC3
P 4100 2900
F 0 "C1" V 3848 2900 50  0000 C CNN
F 1 "22pF" V 3939 2900 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4138 2750 50  0001 C CNN
F 3 "~" H 4100 2900 50  0001 C CNN
	1    4100 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 2900 4800 2900
Wire Wire Line
	4800 2900 4800 2950
Wire Wire Line
	4250 2900 4450 2900
Connection ~ 4450 2900
$Comp
L power:GND #PWR01
U 1 1 618C26C1
P 3650 3200
F 0 "#PWR01" H 3650 2950 50  0001 C CNN
F 1 "GND" H 3655 3027 50  0000 C CNN
F 2 "" H 3650 3200 50  0001 C CNN
F 3 "" H 3650 3200 50  0001 C CNN
	1    3650 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2900 3650 2900
Wire Wire Line
	3650 2900 3650 3100
Wire Wire Line
	3950 3300 3950 3100
Wire Wire Line
	3950 3100 3650 3100
Connection ~ 3650 3100
Wire Wire Line
	3650 3100 3650 3200
Wire Wire Line
	7050 1450 6850 1450
Wire Wire Line
	6850 1550 6950 1550
Wire Wire Line
	6950 1800 6950 1550
Connection ~ 6950 1550
Wire Wire Line
	6950 1550 7050 1550
$Comp
L power:+3.3V #PWR04
U 1 1 618D599E
P 6950 2250
F 0 "#PWR04" H 6950 2100 50  0001 C CNN
F 1 "+3.3V" H 6965 2423 50  0000 C CNN
F 2 "" H 6950 2250 50  0001 C CNN
F 3 "" H 6950 2250 50  0001 C CNN
	1    6950 2250
	-1   0    0    1   
$EndComp
Wire Wire Line
	6950 2250 6950 2100
$Comp
L power:GND #PWR07
U 1 1 618DAEE4
P 8250 1700
F 0 "#PWR07" H 8250 1450 50  0001 C CNN
F 1 "GND" H 8255 1527 50  0000 C CNN
F 2 "" H 8250 1700 50  0001 C CNN
F 3 "" H 8250 1700 50  0001 C CNN
	1    8250 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1550 8250 1700
$Comp
L power:GND #PWR03
U 1 1 618DB74F
P 6550 2000
F 0 "#PWR03" H 6550 1750 50  0001 C CNN
F 1 "GND" H 6555 1827 50  0000 C CNN
F 2 "" H 6550 2000 50  0001 C CNN
F 3 "" H 6550 2000 50  0001 C CNN
	1    6550 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1850 6550 2000
$Comp
L power:GND #PWR02
U 1 1 618DC04F
P 6450 2000
F 0 "#PWR02" H 6450 1750 50  0001 C CNN
F 1 "GND" H 6455 1827 50  0000 C CNN
F 2 "" H 6450 2000 50  0001 C CNN
F 3 "" H 6450 2000 50  0001 C CNN
	1    6450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2000 6450 1850
$Comp
L power:+3.3V #PWR08
U 1 1 618DD483
P 8650 1100
F 0 "#PWR08" H 8650 950 50  0001 C CNN
F 1 "+3.3V" H 8665 1273 50  0000 C CNN
F 2 "" H 8650 1100 50  0001 C CNN
F 3 "" H 8650 1100 50  0001 C CNN
	1    8650 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 1250 8650 1250
Wire Wire Line
	8650 1250 8650 1100
$Comp
L Device:C C3
U 1 1 618E13DB
P 7850 1600
F 0 "C3" H 7965 1646 50  0000 L CNN
F 1 "1u" H 7965 1555 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7888 1450 50  0001 C CNN
F 3 "~" H 7850 1600 50  0001 C CNN
	1    7850 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 618E2946
P 7850 1950
F 0 "#PWR06" H 7850 1700 50  0001 C CNN
F 1 "GND" H 7855 1777 50  0000 C CNN
F 2 "" H 7850 1950 50  0001 C CNN
F 3 "" H 7850 1950 50  0001 C CNN
	1    7850 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 6190650C
P 8650 1600
F 0 "C4" H 8765 1646 50  0000 L CNN
F 1 "1u" H 8765 1555 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8688 1450 50  0001 C CNN
F 3 "~" H 8650 1600 50  0001 C CNN
	1    8650 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 61906512
P 8650 1900
F 0 "#PWR09" H 8650 1650 50  0001 C CNN
F 1 "GND" H 8655 1727 50  0000 C CNN
F 2 "" H 8650 1900 50  0001 C CNN
F 3 "" H 8650 1900 50  0001 C CNN
	1    8650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1750 8650 1900
Wire Wire Line
	8650 1450 8650 1250
Connection ~ 8650 1250
Text GLabel 7450 1550 2    50   Input ~ 0
D-
Wire Wire Line
	7450 1450 7350 1450
Text GLabel 6250 3950 2    50   Input ~ 0
D-
Text GLabel 7450 1450 2    50   Input ~ 0
D+
Text GLabel 6250 3850 2    50   Input ~ 0
D+
Wire Wire Line
	6850 1250 7850 1250
Wire Wire Line
	7850 1450 7850 1250
Connection ~ 7850 1250
Wire Wire Line
	7850 1250 7950 1250
Wire Wire Line
	7850 1750 7850 1950
$Comp
L Device:LED D1
U 1 1 6191CA9E
P 7600 2950
F 0 "D1" V 7639 2833 50  0000 R CNN
F 1 "LED" V 7548 2833 50  0000 R CNN
F 2 "LEDs:LED_0603_HandSoldering" H 7600 2950 50  0001 C CNN
F 3 "~" H 7600 2950 50  0001 C CNN
	1    7600 2950
	0    -1   -1   0   
$EndComp
Text GLabel 7600 2000 1    50   Input ~ 0
led
Wire Wire Line
	7600 2800 7600 2650
$Comp
L Device:R R4
U 1 1 618B055F
P 7600 2500
F 0 "R4" H 7670 2546 50  0000 L CNN
F 1 "1k" H 7670 2455 50  0000 L CNN
F 2 "aa:R_0402_HandSoldering" V 7530 2500 50  0001 C CNN
F 3 "~" H 7600 2500 50  0001 C CNN
	1    7600 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2000 7600 2350
$Comp
L power:+3.3V #PWR0101
U 1 1 618B65D7
P 5400 2300
F 0 "#PWR0101" H 5400 2150 50  0001 C CNN
F 1 "+3.3V" H 5415 2473 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2450 5400 2350
$Comp
L power:GND #PWR0102
U 1 1 618BAF0D
P 5400 4800
F 0 "#PWR0102" H 5400 4550 50  0001 C CNN
F 1 "GND" H 5405 4627 50  0000 C CNN
F 2 "" H 5400 4800 50  0001 C CNN
F 3 "" H 5400 4800 50  0001 C CNN
	1    5400 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4800 5400 4650
Wire Wire Line
	7350 1550 7450 1550
$Comp
L power:GND #PWR0103
U 1 1 618BD6CA
P 4250 3500
F 0 "#PWR0103" H 4250 3250 50  0001 C CNN
F 1 "GND" H 4255 3327 50  0000 C CNN
F 2 "" H 4250 3500 50  0001 C CNN
F 3 "" H 4250 3500 50  0001 C CNN
	1    4250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3300 4450 3300
Wire Wire Line
	4800 3250 4800 3150
Wire Wire Line
	4450 3250 4800 3250
Wire Wire Line
	4450 3300 4450 3250
Wire Wire Line
	4450 3200 4450 3250
Connection ~ 4450 3250
Wire Wire Line
	4450 2900 4450 2950
$Comp
L Device:Crystal_GND24 Y1
U 1 1 618B2381
P 4450 3100
F 0 "Y1" H 4644 3146 50  0000 L CNN
F 1 "12MHz" V 4800 2900 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_3225-4pin_3.2x2.5mm" H 4450 3100 50  0001 C CNN
F 3 "~" H 4450 3100 50  0001 C CNN
	1    4450 3100
	0    1    1    0   
$EndComp
$Comp
L MCU_Microchip_ATtiny:ATtiny2313A-SU U1
U 1 1 618ACEC9
P 5400 3550
F 0 "U1" H 5150 4600 50  0000 C CNN
F 1 "ATtiny2313A-SU" H 5800 4600 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 5400 3550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc8246.pdf" H 5400 3550 50  0001 C CNN
	1    5400 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 618BDC50
P 4650 3500
F 0 "#PWR0104" H 4650 3250 50  0001 C CNN
F 1 "GND" H 4655 3327 50  0000 C CNN
F 2 "" H 4650 3500 50  0001 C CNN
F 3 "" H 4650 3500 50  0001 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2950 4450 3000
Wire Wire Line
	4650 3100 4650 3500
Wire Wire Line
	4250 3100 4250 3500
Wire Wire Line
	6250 3750 6000 3750
$Comp
L power:+3.3V #PWR0105
U 1 1 619133B6
P 7350 2000
F 0 "#PWR0105" H 7350 1850 50  0001 C CNN
F 1 "+3.3V" H 7365 2173 50  0000 C CNN
F 2 "" H 7350 2000 50  0001 C CNN
F 3 "" H 7350 2000 50  0001 C CNN
	1    7350 2000
	1    0    0    -1  
$EndComp
Text GLabel 6250 3450 2    50   Input ~ 0
led
$Comp
L Device:C C5
U 1 1 6193ED97
P 5100 2350
F 0 "C5" V 4848 2350 50  0000 C CNN
F 1 "100n" V 4939 2350 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5138 2200 50  0001 C CNN
F 3 "~" H 5100 2350 50  0001 C CNN
	1    5100 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6193FD56
P 4800 2450
F 0 "#PWR05" H 4800 2200 50  0001 C CNN
F 1 "GND" H 4805 2277 50  0000 C CNN
F 2 "" H 4800 2450 50  0001 C CNN
F 3 "" H 4800 2450 50  0001 C CNN
	1    4800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2450 4800 2350
Wire Wire Line
	4800 2350 4950 2350
Wire Wire Line
	5250 2350 5400 2350
Connection ~ 5400 2350
Wire Wire Line
	5400 2350 5400 2300
Wire Wire Line
	7600 3250 7600 3100
$Comp
L power:GND #PWR0106
U 1 1 619481C6
P 7600 3250
F 0 "#PWR0106" H 7600 3000 50  0001 C CNN
F 1 "GND" H 7605 3077 50  0000 C CNN
F 2 "" H 7600 3250 50  0001 C CNN
F 3 "" H 7600 3250 50  0001 C CNN
	1    7600 3250
	1    0    0    -1  
$EndComp
Text GLabel 6550 4750 0    50   Input ~ 0
prog-mosi
Text GLabel 6550 4900 0    50   Input ~ 0
prog-miso
Text GLabel 6550 5050 0    50   Input ~ 0
prog-sclk
Text GLabel 6550 5200 0    50   Input ~ 0
prog-reset
$Comp
L Connector:TestPoint TP1
U 1 1 6190C76D
P 6800 4600
F 0 "TP1" V 6754 4788 50  0000 L CNN
F 1 "TestPoint" V 6845 4788 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Small" H 7000 4600 50  0001 C CNN
F 3 "~" H 7000 4600 50  0001 C CNN
	1    6800 4600
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 6191540F
P 6800 4750
F 0 "TP2" V 6754 4938 50  0000 L CNN
F 1 "TestPoint" V 6845 4938 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Small" H 7000 4750 50  0001 C CNN
F 3 "~" H 7000 4750 50  0001 C CNN
	1    6800 4750
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 61915761
P 6800 4900
F 0 "TP3" V 6754 5088 50  0000 L CNN
F 1 "TestPoint" V 6845 5088 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Small" H 7000 4900 50  0001 C CNN
F 3 "~" H 7000 4900 50  0001 C CNN
	1    6800 4900
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 61915ABD
P 6800 5050
F 0 "TP4" V 6754 5238 50  0000 L CNN
F 1 "TestPoint" V 6845 5238 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Small" H 7000 5050 50  0001 C CNN
F 3 "~" H 7000 5050 50  0001 C CNN
	1    6800 5050
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 61915E66
P 6800 5200
F 0 "TP5" V 6754 5388 50  0000 L CNN
F 1 "TestPoint" V 6845 5388 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Small" H 7000 5200 50  0001 C CNN
F 3 "~" H 7000 5200 50  0001 C CNN
	1    6800 5200
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 6191679F
P 6800 5350
F 0 "TP6" V 6754 5538 50  0000 L CNN
F 1 "TestPoint" V 6845 5538 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Small" H 7000 5350 50  0001 C CNN
F 3 "~" H 7000 5350 50  0001 C CNN
	1    6800 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 4750 6800 4750
Wire Wire Line
	6550 4900 6800 4900
Wire Wire Line
	6550 5050 6800 5050
Wire Wire Line
	6550 5200 6800 5200
$Comp
L power:GND #PWR0107
U 1 1 6191DC7A
P 6450 5450
F 0 "#PWR0107" H 6450 5200 50  0001 C CNN
F 1 "GND" H 6455 5277 50  0000 C CNN
F 2 "" H 6450 5450 50  0001 C CNN
F 3 "" H 6450 5450 50  0001 C CNN
	1    6450 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5350 6450 5450
Wire Wire Line
	6450 5350 6800 5350
$Comp
L power:+3.3V #PWR0108
U 1 1 619206AE
P 6450 4500
F 0 "#PWR0108" H 6450 4350 50  0001 C CNN
F 1 "+3.3V" H 6465 4673 50  0000 C CNN
F 2 "" H 6450 4500 50  0001 C CNN
F 3 "" H 6450 4500 50  0001 C CNN
	1    6450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 4600 6450 4500
Wire Wire Line
	6450 4600 6800 4600
Text GLabel 6500 3250 2    50   Input ~ 0
prog-mosi
Text GLabel 6500 3350 2    50   Input ~ 0
prog-miso
Text GLabel 6500 3450 2    50   Input ~ 0
prog-sclk
Wire Wire Line
	6000 3450 6100 3450
Wire Wire Line
	6100 3450 6100 3550
Wire Wire Line
	6100 3550 6500 3550
Wire Wire Line
	6500 3550 6500 3450
Connection ~ 6100 3450
Wire Wire Line
	6100 3450 6250 3450
Wire Wire Line
	6500 3350 6000 3350
Wire Wire Line
	6500 3250 6000 3250
Text GLabel 4400 2500 0    50   Input ~ 0
prog-reset
Wire Wire Line
	4800 2750 4550 2750
Wire Wire Line
	4550 2750 4550 2500
Wire Wire Line
	4550 2500 4400 2500
Wire Wire Line
	6000 3850 6250 3850
Wire Wire Line
	6000 3950 6250 3950
$EndSCHEMATC
