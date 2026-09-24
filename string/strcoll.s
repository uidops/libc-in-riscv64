.section .text
.globl strcoll

.type strcoll, @function
strcoll:
	# a0 = const char *, a1 = const char *
	# C locale: collation is the same as strcmp
	.loop:
		lbu t0, (a0)
		lbu t1, (a1)
		bne t0, t1, .end
		addi a0, a0, 1
		addi a1, a1, 1
		bne t0, x0, .loop
	.end:
		sub a0, t0, t1
		ret
