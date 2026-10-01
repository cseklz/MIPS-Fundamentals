.data
num:	.word 100
fizz:	.asciiz "Fizz"
buzz:	.asciiz "Buzz"
fbuz:	.asciiz "FizzBuzz"

.text
main:
	j Fizz

Fizz:
	li $v0, 4
	la $a0, fizz
	syscall