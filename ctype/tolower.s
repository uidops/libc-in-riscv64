.section .text
.globl tolower

.type tolower, @function

tolower:
	# a0 = c
	li t0, 'A'
	li t1, 'Z'
	blt a0, t0, .Lend
	bgt a0, t1, .Lend
	addi a0, a0, 32
.Lend:
	ret
