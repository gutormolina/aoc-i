.text
ori $t1, $zero, 15
ori $t2, $zero, 0xffff
sll $t2, $t2, 16
ori $t2, $t2, 0xffff
addi $t2, $zero, -1
ori $t2, $zero, 0x7000
sll $t2, $t2, 16
addu $t3, $t2, $t2
mult $t1, $t1
mflo $t4
ori $t3, $zero, 5
ori $t4, $zero, 2
div $t3, $t4