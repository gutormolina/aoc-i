.text
main:	jal ler
		la $s0, 0x100100000
		lw $a0, 0($s0)	# salva em $a0 1º int
		lw $a1, 4($s0)	# salva em $a1 2º int
		lw $a2, 8($s0)	# salva em $a2 3º int
		jal media
		move $t5, $v0
		jal imprime
		li $v0, 10
		syscall

ler:
	la $s0, 0x10010000	# end memoria dados
	li $t0, 0	# i = 0	
	li $t1, 3	# 3 inteiros
loop:	
	slti $t2, $t0, 3 	# i < 3 ?
	beq $t2, $zero, fim	# i = 3 -> fim
	li $v0, 5	# ler inteiro
	syscall
	sw $v0, 0($s0)	# armazena inteiro
	addiu $s0, $s0, 4	# mem[end + 4]
	addiu $t0, $t0, 1	# i++
	j loop		
fim:	
	jr $ra	# retorna para main

media:	
	add $t3, $a0, $a1	# soma dois inteiros
	add $t3, $t3, $a2	# soma tres inteiros
	li $t1, 3	# $t1 = 3
	div $t3, $t1
		
imprimir:
	