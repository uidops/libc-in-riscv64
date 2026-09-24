.section .text
.globl strcat

.type strcat, @function
strcat:
	add t1, x0, a0
	.loop1:
		lbu t0, (t1)
		beqz t0, .loop2
		addi t1, t1, 1
		j .loop1

	.loop2:
		lbu t0, (a1)
		sb t0, (t1)
		addi a1, a1, 1
		addi t1, t1, 1
		bne t0, x0, .loop2

	.end:
		ret
