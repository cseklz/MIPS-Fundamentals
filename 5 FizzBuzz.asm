.data
fizz:       .asciiz "Fizz"
buzz:       .asciiz "Buzz"
fizzbuzz:   .asciiz "FizzBuzz"
newline:    .asciiz "\n"
prompt:     .asciiz "Enter n: "

.text
main:
    li   $v0, 4
    la   $a0, prompt
    syscall

    li   $v0, 5
    syscall
    move $s0, $v0

    li   $s1, 1

loop:
    slt  $t0, $s0, $s1		# if n < i then done
    bne  $t0, $zero, done

    li   $t0, 3				# t1 = i % 3
    div  $s1, $t0
    mfhi $t1

    li   $t0, 5				# t2 = i % 5
    div  $s1, $t0
    mfhi $t2

    bne  $t1, $zero, check_fizz    # if (i % 3 == 0 && i % 5 == 0)
    bne  $t2, $zero, check_fizz

    li   $v0, 4
    la   $a0, fizzbuzz
    syscall
    j    print_newline

check_fizz:
    bne  $t1, $zero, check_buzz    # else if (i % 3 == 0)

    li   $v0, 4
    la   $a0, fizz
    syscall
    j    print_newline

check_buzz:
    bne  $t2, $zero, print_number  # else if (i % 5 == 0)

    li   $v0, 4
    la   $a0, buzz
    syscall
    j    print_newline

print_number:
    li   $v0, 1    				   # Print i
    move $a0, $s1
    syscall

print_newline:
    li   $v0, 4
    la   $a0, newline
    syscall

    addi $s1, $s1, 1    		  # i++
    j    loop

done:
    li   $v0, 10
    syscall