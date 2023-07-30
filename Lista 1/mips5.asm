# Faça um programa que some os números decimais 326, -211, 311 e -684 e 
# escreva o resultado no registrador $t0. NÃO utilize a instrução sub.

.text
	ori $t1, $zero, 326	# $t1 = 326
	ori $t2, $zero, 211	# $t2 = 211
	nor $t2, $zero, $t2	# $t2 = -212
	addi $t2, $t2, 1	# $t2 = -211
	add $t0, $t1, $t2	# $t0 = 321 + (-212) = 115
	ori $t3, $zero, 311	# $t3 = 311
	add $t0, $t0, $t3	# $t0 = 115 + 311 = 426
	ori $t4, $zero, 684	# $t4 = 684
	nor $t4, $zero, $t4	# $t4 = -685
	addi $t4, $t4, 1	# $t4 = -684
	add $t0, $t0, $t4	# $t0 = 426 + (-684) = -258