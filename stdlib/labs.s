.section .text
.globl labs

.type labs, @function

labs:
	srai t0, a0, 63
	xor a0, a0, t0
	sub a0, a0, t0
	ret
