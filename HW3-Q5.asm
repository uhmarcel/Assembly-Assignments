# Question assumptions
addi $s3, $zero, 900
addi $t0, $zero, 77

# load addresses 900, 904, 908 with 10, 15, 20 respectibly
addi $t9, $zero, 10
sw $t9, 0($s3)
addi $t9, $zero, 15
sw $t9, 4($s3)
addi $t9, $zero, 20
sw $t9, 8($s3)
addi $t9, $zero, 0



