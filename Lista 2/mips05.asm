# Escreva um programa que calcule: 
# 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser 
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o 
# código com: 
# .data
# y: .space 4

.data
	y: .space 4
	
.text
	lui $t0, 0x1001		# registrador base
	ori $t1, $zero, 1	# $t1 = 1
	ori $t2, $zero, 2	# $t2 = 2
	ori $t3, $zero, 333	# $t3 = 333
lp :beq $t2, $t3, end	# $t2 != $t3 -> lp
	add $t1, $t1, $t2	# $t1 = $t1 + $t2
	addi $t2, $t2, 1	# $t2 = $t2 + 1
	j lp				# retorna ao inicio do loop
end:sw $t1, 0x0($t0)	# y = $t1