.section .text
.globl memset

.type memset, @function

memset:
	and t0, a0, a2
	beq t0, x0, .end
	add s0, x0, a0
	.loop:
		sb  a1, (s0)
	    addi a2, a2, -1
		addi s0, s0, 1
		bne a2, x0, .loop
	.end:
		ret
