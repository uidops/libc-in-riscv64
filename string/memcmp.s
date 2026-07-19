.section .text
.globl memcmp

.type memcmp, @function

memcmp:
	# a0 = s1, a1 = s2, a2 = n
	beqz a2, .equal
.loop:
	lbu t0, (a0)
	lbu t1, (a1)
	bne t0, t1, .diff
	addi a0, a0, 1
	addi a1, a1, 1
	addi a2, a2, -1
	bnez a2, .loop
.equal:
	li a0, 0
	ret
.diff:
	sub a0, t0, t1
	ret
