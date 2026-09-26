.section .text
.globl memmove

.type memmove, @function
memmove:
	# a0 = dest, a1 = src, a2 = n
	# forward when dest < src, backward otherwise (overlap safe)
	beqz a2, .end
	bltu a0, a1, .forward
	# backward: start at the last byte
	add t0, a1, a2
	addi t0, t0, -1            # t0 = src + n - 1
	add t1, a0, a2
	addi t1, t1, -1            # t1 = dest + n - 1
	.loop_b:
		lbu t2, (t0)
		sb t2, (t1)
		addi t0, t0, -1
		addi t1, t1, -1
		addi a2, a2, -1
		bnez a2, .loop_b
		j .end
	.forward:
		add t0, x0, a1
		add t1, x0, a0
	.loop_f:
		lbu t2, (t0)
		sb t2, (t1)
		addi t0, t0, 1
		addi t1, t1, 1
		addi a2, a2, -1
		bnez a2, .loop_f
	.end:
		ret
