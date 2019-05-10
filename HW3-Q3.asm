# Store the value 0010 0000 0000 0001 0100 1001 0010 0100 at $t1
# 	target value in hex = 0x20014924 
#	target value in dec = 536955172

# First we divide the number in two parts, left and right
# left  = 0010 0000 0000 0001
# right = 0100 1001 0010 0100

# We calculate the decimal values of both expressions
# left = 2^13 + 1 = 8193
# right = 2^14 + 2^11 + 2^8 + 2^5 + 2^2 = 18724

li $t0, 0b100	# loaded target as reference using pseudo-instruction load immediate

lui $t1, 8193		# load left side at upper half of $t1
ori $t1, 18724		# or immediate to add bottom part

