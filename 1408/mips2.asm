.data
km: 	.asciiz "Insira a qtd de km percorridos: "
l:		.asciiz "Insira a qtd de l consumidos: "
kml:	.asciiz "km/l = "
nl:		.asciiz " "
buffer:	.space 5

.text
		la $s0, buffer
loop:	li $v0, 4 # Pede km
		la $a0, km
		syscall
		
		li $v0, 5 # Lê km
		syscall
		
		beq $v0, $zero fim # Valor Lido = 0 -> Finaliza
		move $t0, $v0
		
		li $v0, 4 # Pede litros
		la $a0, l
		syscall
		
		li $v0, 5 # Lê l
		syscall
		move $t1, $v0
		
		div $t0, $t1 # km/l
		mflo $t1
		sw $t1, 0($s0) # Envia resul p memória
		addiu $s0, $s0, 4 # Incrementa &mem[i]
		
		li $v0, 4 # Pede litros
		la $a0, kml
		syscall
		
		li $v0, 1 # Imprime int
		move $a0, $t1 # $a0 = km/l
		syscall
		
		li $v0, 4 # /n
		la $a0, nl
		syscall
		
		j loop

fim:	li $s0, 10
		syscall