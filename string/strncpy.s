.section .text
.globl strncpy

.type strncpy, @function
strncpy:
	# a0 = dest, a1 = src, a2 = n
	add t1, x0, a0
	beqz a2, .end
.loop:
	lbu t0, (a1)
	sb t0, (t1)
	beqz t0, .pad
	addi a1, a1, 1
	addi t1, t1, 1
	addi a2, a2, -1
	bnez a2, .loop
	j .end
.pad:
	addi t1, t1, 1
	addi a2, a2, -1
	beqz a2, .end
.pad_loop:
	sb x0, (t1)
	addi t1, t1, 1
	addi a2, a2, -1
	bnez a2, .pad_loop
.end:
	ret
