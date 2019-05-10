.data 		# variable declarations follow this line 
.text 		# instructions follow this line 
main: 
## Code Part 1: Get first number from user, put into $t0. 
ori $v0, $0, 5 		# OUR CODE BEGINS HERE: load syscall read_int into $v0. 
syscall 			# make the syscall. 
addu $t0, $0, $v0 		# move the number read into $t0. 
## Get second number from user, put into $t1. 
ori $v0, $0, 5 		# load syscall read_int into $v0. 
syscall 			# make the syscall. 
addu $t1, $0, $v0 		# move the number read into $t1. 

	## ------------ MODIFICATION -------------- ##
ori $v0, $zero, 5		# load read_int code to $v0
syscall			# make the syscall
addu $t2, $zero, $v0	# save third value as $t2
## 	Compute the sum
addu $t1, $t1, $t0		# sum = first + second + third
addu $t2, $t2, $t1		
	## ---------------------------------------- ##

addu $a0, $0, $t2 		# move the number to print into $a0. 
ori $v0, $0, 1 		# load syscall print_int into $v0. 
syscall 			# make the syscall. 
ori $v0, $0, 10 		# syscall code 10 is for exit. 
syscall 			# make the syscall. 
## end of add2.asm.


