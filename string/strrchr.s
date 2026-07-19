.section .text
.globl strrchr

.type strrchr, @function

strrchr:
	# a0 = s, a1 = c
	li t1, 0           # t1 will store last match address (NULL initially)
	andi a1, a1, 0xff
.loop:
	lbu t0, (a0)
	bne t0, a1, .check_null
	add t1, x0, a0     # update last match
.check_null:
	beqz t0, .end
	addi a0, a0, 1
	j .loop
.end:
	add a0, x0, t1
	ret
