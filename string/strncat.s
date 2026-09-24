.section .text
.globl strncat

.type strncat, @function
strncat:
	# a0 = dest, a1 = src, a2 = n
	add t1, x0, a0
.find_end:
	lbu t0, (t1)
	beqz t0, .cat
	addi t1, t1, 1
	j .find_end
.cat:
	beqz a2, .terminate
.loop:
	lbu t0, (a1)
	sb t0, (t1)
	beqz t0, .end
	addi a1, a1, 1
	addi t1, t1, 1
	addi a2, a2, -1
	bnez a2, .loop
.terminate:
	sb x0, (t1)
.end:
	ret
