.section .text
.globl abs

.type abs, @function

abs:
	srai t0, a0, 31
	xor a0, a0, t0
	sub a0, a0, t0
	ret
