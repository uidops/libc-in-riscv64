.section .text
.globl atoi

.type atoi, @function

atoi:
	add a1, x0, a0
	add a0, x0, x0
	add a2, x0, x0
	addi t2, x0, 10

	lbu t0, (a1)
	
	addi t1, x0, 0x2b
	beq t0, t1, .positive

	addi t1, x0, 0x2d
	bne t0, t1, .rest
	addi a2, a2, 1

	.positive:
		addi a1, a1, 1

	.rest:
		lbu t0, (a1)
		addi t1, t0, -0x30
		bltu t2, t1, .end

	.loop:
		beq t0, x0, .end
		mul a0, a0, t2
		add a0, a0, t1

		addi a1, a1, 1
		lbu t0, (a1)
		addi t1, t0, -0x30
		bltu t1, t2, .loop
		beqz a2, .end
		neg a0, a0

	.end:
		ret

.section .data
.msg:
	.asciz "%d\n"
