.data	# Variable declarations
.text	# Instructions

main:
	addi $v0, $zero, 5		# Load read_int code
	syscall					# Get input
	add $t0, $zero, $v0		# A = first input
	
	addi $v0, $zero, 5		# Load read_int code
	syscall					# Get input
	add $t1, $zero, $v0		# B = second input
	
	slt $t9, $zero, $t1 	# If (0 < B) == false then 
	beq $t9, $zero, exit	# terminate the program
	
	mul $t2, $t1, $t0		# Sentinel = A x B
	add $t3, $zero, $t0		# Multiple = A
	addi $v0, $zero, 1		# Set print int code for syscall
	
	loop:
		add $a0, $zero, $t3		# Move Multiple as argument
		jal linebreak
		syscall					# Display Multiple
		beq $t3, $t2, exit		# While (Multiple != Sentinel)
		add $t3, $t3, $t0		# Multiple += A
		j loop	

exit:
	addi $v0, $zero, 10		# Set exit code
	syscall					# Terminate program
	
linebreak:					# LINEBREAK: inserts a linebreak 
	add $t8, $zero, $v0		# Save caller registers to use 
	add $t9, $zero, $a0   	# 
	addi $v0, $zero, 11		# Load print_character code
	addi $a0, $zero, 10		# Load ASCII for linefeed '12'
	syscall					# Call to print_character
	add $v0, $zero, $t8		# Restore caller registers
	add $a0, $zero, $t9		#
	jr $ra					# Return
		 