.section .text
.globl isspace

.type isspace, @function

isspace:
	# a0 = c
	# check '\t' (9) to '\r' (13)
	li t0, 9
	li t1, 13
	blt a0, t0, .Lcheck_space
	bgt a0, t1, .Lcheck_space
	li a0, 1
	ret
.Lcheck_space:
	li t0, 32 # ' '
	bne a0, t0, .Lnot_space
	li a0, 1
	ret
.Lnot_space:
	li a0, 0
	ret
