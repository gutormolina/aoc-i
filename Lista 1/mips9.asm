#Faça um programa que calcule a seguinte equação:
#y = (9x + 7) / (2x + 8)
#Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor 
#desejado, e sempre que precisar o valor de x, utilize o valor armazenado no 
#registrador $t1. 
#Armazene o quociente da divisão em $t2 e o resto em $t3.
#Responda o que acontece quando x = -4.

.text
	addi $t1, $zero, -4	# $t1 = x
	ori $t4, $zero, 9	# $t4 = 9
	ori $t5, $zero, 2	# $t5 = 2
	mult $t4, $t1		# 9x
	mflo $t4			# $t4 = 9x
	addi $t4, $t4, 7	# $t4 = 9x + 7
	mult $t5, $t1		# 2x
	mflo $t5			# $t5 = 2x
	addi $t5, $t5, 8	# $t5 = 2x + 8
	div $t4, $t5		# (9x + 7) / (2x + 8)
	mflo $t2			# $t2 = quociente
	mfhi $t3			# $t3 = resto