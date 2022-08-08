.section .text
.globl memcpy

.type memcpy, @function

memset:
	beq a2, x0, .end
	add s0, x0, a0
	.loop:
		lb t0, (a1)
		sb t0, (s0)
	    addi a2, a2, -1
		addi s0, s0, 1
		addi a1, a1, 1
		bne a2, x0, .loop
	.end:
		ret
