.section .text
.globl strlen

.type strlen, @function

strlen:
	add s0, x0, a0
	.loop:
		addi s0, s0, 1
		lb t0, (s0)
		bne t0, x0, .loop

	sub a0, s0, a0
	ret
