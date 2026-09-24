.section .text
.globl atol

.type atol, @function
atol:
	# a0 = const char *
	# skip whitespace, handle sign, convert digits
	add a1, x0, a0
	li t0, 0           # t0 = result (accumulated value)
	li t1, 1           # t1 = sign (1 or -1)

.Lskip_space:
	lbu t2, (a1)
	# Check spaces: ' ', '\t', '\n', '\v', '\f', '\r' (9 to 13, and 32)
	li t3, 9
	li t4, 13
	blt t2, t3, .Lcheck_space32
	bgt t2, t4, .Lcheck_space32
	addi a1, a1, 1
	j .Lskip_space

.Lcheck_space32:
	li t3, 32
	bne t2, t3, .Lcheck_sign
	addi a1, a1, 1
	j .Lskip_space

.Lcheck_sign:
	li t3, '+'
	bne t2, t3, .Lcheck_minus
	addi a1, a1, 1
	lbu t2, (a1)
	j .Lconvert
.Lcheck_minus:
	li t3, '-'
	bne t2, t3, .Lconvert
	li t1, -1
	addi a1, a1, 1
	lbu t2, (a1)

.Lconvert:
	li t3, '0'
	li t4, '9'
.Lloop:
	blt t2, t3, .Lend
	bgt t2, t4, .Lend
	addi t5, t2, -48   # t5 = t2 - '0'
	li t6, 10
	mul t0, t0, t6
	add t0, t0, t5
	addi a1, a1, 1
	lbu t2, (a1)
	j .Lloop

.Lend:
	mul a0, t0, t1
	ret
