*** Ali Abyaneh VLSI CA1- Part1********

.prot
.inc '32nm_LP.pm'
.unprot

**** Define patameters
.param	Lmin=32n
+GND=0
.global	VDD
.temp	25

*********************Source Voltages**************
Vgs g GND 0
Vds d GND 0

******************Transistor Level Implementation****************
M1 	g 		g 		GND 	GND 	nmos		W=1um	L=Lmin
*M2	d	 	  d		VDD	VDD	pmos		W=1um	L=Lmin
*************Type of Analysis********
.tran	0.1ns	2u

.DC Vgs -1 2 0.1* SWEEP Vds -1 2 0.1

.PRINT DC I3(M1)
.PROBE DC I3(M1)
.end
