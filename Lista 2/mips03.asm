#Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = - ax^4 + bx^3 -cx^2 + dx - e
# Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado 
# y. Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado 
# (.space 4). Utilize as sete primeiras posições da memória .data para armazenar, 
# consecutivamente, a, b, c, d, e, x e y, iniciando o código com:
# .data
# a: .word -3
# b: .word 7
# c: .word 5
# d: .word -2
# e: .word 8
# x: .word 4
# y: .space 4

.data
	a: .word -3
	b: .word 7
	c: .word 5
	d: .word -2
	e: .word 8
	x: .word 4
	y: .space 4

.text
	lui $t0, 0x1001		# registrador base
	lw $t1, 0x14($t0)	# $t1 = x
	mult $t1, $t1		# x * x
	mflo $t2			# $t2 = x * x
	mult $t2, $t1		# x^2 * x
	mflo $t3			# $t3 = x^2 * x
	mult $t3, $t1		# x^3 * x
	mflo $t4			# $t4 = x^3 * x
	lw $t5, 0x0($t0)	# $t5 = a
	mult $t5, $t4		# a * x^4
	mflo $t5			# $t5 = a * x^4
	nor $t5, $t5, $zero	# $t5 = -ax^4 - 1
	addi $t5, $t5, 1	# $t5 = -ax^4
	lw $t4, 0x4($t0)	# $t4 = b
	mult $t4, $t3		# b * x^3
	mflo $t4			# $t4 = b * x^3
	add $t4, $t5, $t4	# $t4 = -ax^4 + bx^3
	lw $t3, 0x8($t0)	# $t3 = c
	mult $t3, $t2		# c * x^2
	mflo $t3			# $t3 = c * x^2
	sub $t3, $t4, $t3	# $t3 = ... - cx^2
	lw $t2, 0xC($t0)	# $t2 = d
	mult $t2, $t1		# d * x
	mflo $t2			# $t2 = d * x
	add $t2, $t3, $t2	# $t2 = ... + dx
	lw $t1, 0x10($t0)	# $t1 = e
	sub $t1, $t2, $t1	# $t1 = ... - e
	sw $t1, 0x18($t0)	# y = $t1