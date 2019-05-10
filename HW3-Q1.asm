# The initial conditions of the problem Q1
li $t1, 0x10000000
li $t2, 0x10000010
li $s0, 0x11223344
sw $s0, 0($t1)

# What would be value stored at $t2
lbu $t0, 0($t1) 	# loads first byte from t1 (That contains 0x11223344) being then the value 0x44, hence $t0 = x00000044
sw $t0, 0($t2)		# stores value at t2

# The stored value is 0x00000044