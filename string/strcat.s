.section .text
.globl strcat

.type strcat, @function

strcat:
	add s1, x0, a0
	.loop1:
		lbu t0, (s1)
		addi s1, s1, 1
		bne t0, x0, .loop1

	.loop2:
		lbu t0, (a1)
		sb t0, (s1)
		addi a1, a1, 1
		addi s1, s1, 1
		bne t0, x0, .loop2

	.end:
		ret
