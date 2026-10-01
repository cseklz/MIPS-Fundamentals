main:
	li $t0, 1
	
	j start

start:
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	addi $t0, $t0, 1
	bne $t0, 101, start