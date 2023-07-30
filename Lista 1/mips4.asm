# Escreva a sequência 0x12345678 em $t1. A seguir, escreva um código
# que inverta a sequência, escrevendo 0x87654321 em $t2. Obviamente o 
# código deve inverter os bits de $t1 e não simplesmente
# escrever 0x87654321 diretamente em $t2.

.text
	ori $t1, $zero, 0x1234
	sll $t1, $t1, 16
	ori $t1, $t1, 0x5678
	sll $t1, $t1, 4
	addi $t1, $t1, 0x7
	sll $t1, $t1, 4
	addi $t1, $t1, 0x6
	sll $t1, $t1, 4
	addi $t1, $t1, 0x5
	sll $t1, $t1, 4
	addi $t1, $t1, 0x4
	sll $t1, $t1, 4
	addi $t1, $t1, 0x3
	sll $t1, $t1, 4
	addi $t1, $t1, 0x2
	sll $t1, $t1, 4
	addi $t1, $t1, 0x1
