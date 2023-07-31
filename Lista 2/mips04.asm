# Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
# divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
# forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O 
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da 
# memória .data. Inicie o código com: 
# .data
# a: .half 30
# b: .half 5
# y: .space 4

.data
	a: .half 30
	b: .half 5
	y: .space 4

.text
	lui $t0, 0x1001		# registrador base
	lh $t1, 0x0($t0)	# $t1 = a
	lh $t2, 0x2($t0)	# $t2 = b
	beq $t1, $t2, eq	# a == b -> eq
	div $t1, $t2		# a / b
	j end				# prossegue execucação
eq: mult $t1, $t2		# a * b
	j end				# sai do loop
end:mflo $t3			# $t3 = resultado
	sw $t3, 0x4($t0)	# y = $t3