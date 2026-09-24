.section .text
.globl strlen

.type strlen, @function
strlen:
	add t1, x0, a0
	.loop:
		lb t0, (t1)
		addi t1, t1, 1
		bne t0, x0, .loop

	sub a0, t1, a0
	addi a0, a0, -1
	ret
