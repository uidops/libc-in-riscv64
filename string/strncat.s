.section .text
.globl strncat

.type strncat, @function

strncat:
	# a0 = dest, a1 = src, a2 = n
	add s1, x0, a0
.find_end:
	lbu t0, (s1)
	beqz t0, .cat
	addi s1, s1, 1
	j .find_end
.cat:
	beqz a2, .terminate
.loop:
	lbu t0, (a1)
	sb t0, (s1)
	beqz t0, .end
	addi a1, a1, 1
	addi s1, s1, 1
	addi a2, a2, -1
	bnez a2, .loop
.terminate:
	sb x0, (s1)
.end:
	ret
