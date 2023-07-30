# Faça um programa que calcule a seguinte equação:
# y = 3x^2 - 5x + 13
# Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no 
# registrador $t5. 
# Armazene o resultado y no registrador $t6. 
# Faça teste com diferentes valores positivos e negativos de x. 
# Faça um teste substituindo a primeira instrução addi por uma instrução ori
# equivalente e responda, nos comentários, qual o resultado quando são usados números
# positivos e números negativos.

.text
	ori $t1, $zero, 3	# $t1 = 3
	ori $t2, $zero, 5	# $t2 = 5
	addi $t5, $zero, -1	# $t5 = x (instrução "ori" não funcionou com números negativos)
	mult $t5, $t5		# x^2
	mflo $t3			# $t3 = x^2
	mult $t1, $t3		# 3x^2
	mflo $t3			# $t3 = 3x^2
	mult $t2, $t5		# 5x
	mflo $t4			# $t4 = 5x
	sub $t6, $t3, $t4	# $t6 = 3x^2 - 5x
	addi $t6, $t6, 13	# $t6 = ... + 13	