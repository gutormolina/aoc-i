# Faça um programa que calcule a área do triângulo equilátero abaixo e escreva o 
# resultado em $t3. 
# Armazene b em $t1 e h em $t2 utilizando as instruções addi $t1, $zero, b e 
# addi $t2, $zero, h, substituindo b e h pelos valores desejados, e sempre que precisar
# de b e h, utilize os valores armazenados nos registradores $t1 e $t2. 

.text
	addi $t1, $zero, 16	# $t1 = b
	addi $t2, $zero, 12	# $t2 = h
	addi $t4, $zero, 2	# $t4 = 2
	mult $t1, $t2		# b * h
	mflo $t3			# $t3 = b * h
	div $t3, $t4		# (b * h) / 2
	mflo $t3			# $t3 = area