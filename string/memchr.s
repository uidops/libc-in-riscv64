.section .text
.globl memchr

.type memchr, @function

memchr:
	beqz a2, .end
	andi a1, a1, 0xff

	.loop:
		lbu t0, (a0)
		beq t0, a1, .end
		addi a0, a0, 1
		addi a2, a2, -1
		bne a2, x0, .loop

	.null_end:
		add a0, x0, x0

	.end:
		ret
