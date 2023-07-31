# Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = 9a^3 - 5a^2 + 7a + 15
# Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada 
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as duas primeiras posições da memória .data para armazenar, 
# consecutivamente, a e y, iniciando o código com:
# .data
# a: .word 3
# y: .space 4
# Observe como o método de Horner é mais eficiente (faz menos operações) que 
# calcular o polinômio de forma sequencial.

.data
	a: .word 3
	y: .space 4

.text
	lui $t0, 0x1001		# registrador base
	lw $t1, 0x0($t0)	# $t1 = a
	ori $t2, $zero, 9	# $t2 = 9
	ori $t3, $zero, 5	# $t3 = 5
	ori $t4, $zero, 7	# $t4 = 7
	mult $t1, $t1		# a * a
	mflo $t5			# $t5 = a * a
	mult $t5, $t1		# a^2 * a
	mflo $t6			# $t6 = a^2 * a
	mult $t2, $t6		# 9 * a^3
	mflo $t6			# $t6 = 9 * a^3
	mult $t3, $t5		# 5 * a^2
	mflo $t5			# $t5 = 5 * a^2
	sub $t5, $t6, $t5	# $t5 = 9a^3 - 5a^2
	mult $t4, $t1		# 7 * a
	mflo $t6			# $t6 = 7 * a
	add $t5, $t5, $t6	# $t5 = ... + 7a
	addi $t5, $t5, 15 	# $t5 = ... + 15
	sw $t5, 0x4($t0)	# y = $t5