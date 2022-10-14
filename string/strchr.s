.section .text
.globl strchr

.type strchr, @function

strchr:
	.loop:
		lbu t0, (a0)
		beq t0, a1, .end
		addi a0, a0, 1
		bne t0, x0, .loop

		add a0, x0, x0
		ret

	.end:
		ret
