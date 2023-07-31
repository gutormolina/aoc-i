# Faça um programa que calcule a seguinte equação:
# y = 32ab - 3a + 7b - 13
# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada 
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as três primeiras posições da memória .data para armazenar, 
# consecutivamente, a, b e y, iniciando o código com:
# .data
# a: .word 3
# b: .word 5
# y: .space 4

.data
	a: .word 3
	b: .word 5
	y: .space 4
	
.text
	lui	$t0, 0x1001		# registrador base
	lw $t1, 0x0($t0)	# $t1 = a
	lw $t2, 0x4($t0)	# $t2 = b
	ori $t3, $zero, 32	# $t3 = 32
	ori $t4, $zero, 3	# $t4 = 3
	ori $t5, $zero, 7	# $t5 = 7
	mult $t1, $t2		# a * b
	mflo $t6			# $t6 = a * b
	mult $t3, $t6		# 32 * ab
	mflo $t6			# $t6 = 32 * ab
	mult $t4, $t1		# 3 * a
	mflo $t7			# $t7 = 3 * a
	sub $t6, $t6, $t7	# $t6 = 32ab - 3a
	mult $t5, $t2		# 7 * b
	mflo $t7			# $t7 = 7 * b
	add $t6, $t6, $t7	# $t6 = ... + 7b
	addi $t6, $t6, -13	# $t6 = ... - 13
	sw $t6, 0x8($t0)	# y = $t6