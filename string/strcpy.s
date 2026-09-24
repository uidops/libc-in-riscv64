.section .text
.globl strcpy

.type strcpy, @function
strcpy:
	add t1, x0, a0
	.loop:
		lb t0, (a1)
		sb t0, (t1)
		addi a1, a1, 1
		addi t1, t1, 1
		bne t0, x0, .loop
	ret
