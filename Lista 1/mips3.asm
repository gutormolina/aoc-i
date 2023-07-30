#	Comece um programa pela instrução: ori $t1, $zero, 0x01. Usando
#	apenas as instruções lógicas do tipo R (dois registradores como
#	operandos) or, and e xor e instruções de shift (isto é, sem usar outras
#	instruções ori além da inicial e nem instruções nor), 
#	escreva 0xFFFFFFFF em $t1. Procure usar o menor número de 
#	instruções possível.

.text
	ori $t1, $zero, 0x01	# $t1 = 0x1
	sll $t2, $t1, 1 		# $t2 = 0x2
	sll $t3, $t2, 2			# $t3 = 0x8
	or $t4, $t1, $t2		# $t4 = 0x3
	sll $t4, $t4, 1			# $t4 = 0x6
	or $t5, $t3, $t4		# $t5 = 0xE
	or $t5, $t5, $t1		# $t5 = 0xF
	sll $t6, $t5, 4			# $t6 = 0xF0
	or $t6, $t6, $t5		# $t6 = 0xFF
	sll $t5, $t6, 8			# $t5 = 0xFF00
	or $t5, $t5, $t6		# $t5 = 0xFFFF
	sll $t6, $t5, 16		# $t6 = 0xFFFF0000
	or $t6, $t6, $t5		# $t6 = 0xFFFFFFFF