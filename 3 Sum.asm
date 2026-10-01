main:
	li $t0, 0 			# sum
	li $t1, 2 			# increment
	
	j start

start:
	add $t0, $t0, $t1	# add increment to sum
	
	move $a0, $t1
	li $v0, 1			# print increment
	syscall
	
	la $a0, '\n'
	li $v0, 11		 	# newline
	syscall
	
	move $a0, $t0
	li $v0, 1			# print sum
	syscall
	
	la $a0, '\n'
	li $v0, 11
	syscall
	
	la $a0, '\n'
	li $v0, 11
	syscall
	
	addi $t1, $t1, 2	# increment even numbers
	
	ble $t1, 100, start
