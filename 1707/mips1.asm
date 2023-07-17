.data
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8

.text
	ori $t1, $zero, 0 # i = 0
	ori $t5, $zero, 2 # define divisor
	lui $s6, 0x1001 # vetor[0] = 0x10010000

inicio: slti $s1, $t1, 8
		beq $s1, $zero, fora
		div $t1, $t5
		mfhi $s2 # resto (i%2)
		bne $s2, $zero, impar

   par:	sll $s3, $t1, 1
		sll $t3, $t1, 2
		addu $t2, $s6, $t3
		sw $s3, 0($t2)
		addi $t1, $t1, 1 # i++
		j inicio
		
 impar: sll $t3, $t1, 2
 		addu $t2, $s6, $t3
 		lw $s3, 0($t2) # carrega vetor[i]
 		lw $s4, -1($t2) # carrega vetor [i - 1]
 		add $s5, $s3, $s4
 		sw $s5, 0($t2)
 		addi $t1, $t1, 1 # i++
 		j inicio
 		
  fora: sll $s5, $zero, 0 #fim do programa