# Reescreva o seguinte código C em MIPS Assembly:
# int i;
# int vetor[8];
# for(i=0; i<8; i++) {
# 	if(i%2==0)
# 		vetor[i] = i * 2; 
# 	else
# 		vetor[i] = vetor[i] + vetor[i-1]; 
# }
# Cada posição do vetor deve ter 4 bytes e deve ser armazenada, em sequência, a 
# partir da posição 0x1001000 da memória

.data
   v1: .space 4
   v2: .space 4
   v3: .space 4
   v4: .space 4
   v5: .space 4
   v6: .space 4
   v7: .space 4
   v8: .space 4

.text						# $t1 = i
	lui $t0, 0x1001			# registrador base
	ori $t2, $zero, 8		# 8 para comparar no for
	ori $t3, $zero, 2		# 2 (if)
for:
	beq $t1, $t2, end		
		
	div $t1, $t3
	mfhi $t4			# resto
	bne $t4, $zero, impar
			
	sll $t5, $t1, 1	# $t5 = i
	j i
			
impar:		
	lw $t5, 0($t0)
	lw $t6, -4($t0)
	add $t5, $t5, $t6
			
i:
	sw $t5, 0($t0)
	addi $t1, $t1, 1
	addi $t0, $t0, 4
	j for

end:
	nop