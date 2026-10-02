main:
	li    $v0, 4
	la    $a0, greeting
	syscall

.data
greeting: .asciiz "Hello World"
