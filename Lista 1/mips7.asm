# Escreva um programa que calcule o valor de 
# 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3, 
# respectivamente) e coloque o resultado em $t7. Faça testes com alguns 
# valores diferentes de x, y e z. Utilize apenas instruções já vistas na 
# disciplina.

# x = 2; y = 3; z = 5

.text
	ori $t1, $zero, 2	# $t1 = x
	ori $t2, $zero, 3	# $t2 = y
	ori $t3, $zero, 5	# $t3 = z
	ori $t4, $zero, 4	# $t4 = 4
	mult $t4, $t1		# 4x
	mflo $t1			# $t1 = 4x
	ori $t5, $zero, 2	# $t5 = 2
	mult $t5, $t2		# 2y
	mflo $t2			# $t2 = 2y
	ori $t6, $zero, 3	# $t6 = 3
	mult $t6, $t3		# 3z
	mflo $t3			# $t3 = 3z
	sub $t7, $t1, $t2	# $t7 = 4x - 2y
	add $t7, $t7, $t3	# $t7 = $t7 + 3z
	