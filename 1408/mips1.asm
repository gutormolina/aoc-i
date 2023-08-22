.data
	string:	.asciiz "Hello World"
	buffer: .space 10
	
.text
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 5 # Ler um inteiro
	syscall
	
	move $a0, $v0 
	li $v0, 1 #	Imprimir um inteiro
	syscall
	
	li $v0, 8 #	Ler uma string
	la $a0, buffer
	li $a1, 10
	syscall
	
	li $v0,10
	syscall