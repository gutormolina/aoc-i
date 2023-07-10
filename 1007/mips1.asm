.data
.word 10
.word 15
.word 20

.text
lui $t2, 0x1001
lw $t3, 0($t2)
lw $t4, 4($t2)
lw $t5, 8($t2)
add $t1, $t4, $t5
sw $t1, 0xc($t2)
lh $t6, 2($t2)