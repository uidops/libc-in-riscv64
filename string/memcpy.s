.section .text
.globl memcpy

.type memcpy, @function
memcpy:
	beq a2, x0, .end
	add t1, x0, a0
	.loop:
		lb t0, (a1)
		sb t0, (t1)
		addi a2, a2, -1
		addi t1, t1, 1
		addi a1, a1, 1
		bne a2, x0, .loop
	.end:
		ret
