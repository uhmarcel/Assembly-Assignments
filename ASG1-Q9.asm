.data
	inputArray: .word 5, 10, 15, 20, 25		# Input values. Modify here to test.
.text

main:
	addi $t0, $zero, 0	# Sum = 0
	addi $t1, $zero, 0	# Index = 0
	
	loop:
		slti $t2, $t1, 20			# If (index < 20) == false, branch endloop
		beq $t2, $zero, endloop		# Note: 20 = 5 * 4 (last offset index of array)	
		addi $v0, $zero, 1			# Load print_integer code for syscall  
		lw $a0, inputArray($t1)		# Load array[index] and set as argument for syscall
		syscall						# Call print_integer to displays array[index]
		jal linebreak
		add $t0, $t0, $a0			# Sum += array[index]
		addi $t1, $t1, 4			# Increment index by 4
		j loop
	
	endloop:
		addi $t3, $zero, 100		# Result = 100
		sub $t3, $t3, $t0			# Result = 100 - Sum
		add $a0, $zero, $t3			# Load Result as argument for display
		jal linebreak
		syscall						# Call print_integer to display Result
	
	exit:
		addi $v0, $zero, 10 		# Load exit code for syscall
		syscall						# Terminate execution
		
linebreak:					# LINEBREAK: inserts a linebreak 
	add $t8, $zero, $v0		# Save caller registers to use 
	add $t9, $zero, $a0   	# 
	addi $v0, $zero, 11		# Load print_character code
	addi $a0, $zero, 10		# Load ASCII for linefeed '12'
	syscall					# Call to print_character
	add $v0, $zero, $t8		# Restore caller registers
	add $a0, $zero, $t9		#
	jr $ra					# Return
	
