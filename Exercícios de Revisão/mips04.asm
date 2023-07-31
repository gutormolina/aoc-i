# Escreva um programa que calcule o fatorial de n.
# O valor de n deve ser lido da memória na posição 0x10010000 e o valor de n! deve 
# ser escrito na posição seguinte na memória (0x10010004).

.data
	n: .word 4
	f: .space 4
	
.text
	lui $t0, 0x1001
	lw $t1, 0x0($t0)
	addi $t2, $t1, -1
	blez $t1, primeiro
	
primeiro:
	mult $t1, $t2
	mflo $t2
	addi $t1, $t1, -2
	
loop:
	blez $t1, end
	mult $t1, $t2
	mflo $t2
	addi $t1, $t1, -1
	j loop
	
end:
	sw $t2, 0x4($t0)