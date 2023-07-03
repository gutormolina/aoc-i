.text
ori $t1, $zero, 1
ori $t2, $zero, 2
ori $t3, $zero, 3
ori $t4, $zero, 4
mult $t1, $t4
mflo $t1
mult $t2, $t2
mflo $t2
mult $t3, $t3
mflo $t3
sub $t7, $t1, $t2
add $t7, $t7, $t3