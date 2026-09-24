.section .text
.globl strxfrm

.type strxfrm, @function
strxfrm:
	# a0 = dest, a1 = src, a2 = n
	# C locale: the transformation is a plain copy,
	# the return value is strlen(src)
	add t0, x0, a1         # t0 = scan pointer
.count:
		lbu t1, (t0)
		addi t0, t0, 1
		bnez t1, .count
		sub t0, t0, a1
		addi t0, t0, -1       # t0 = strlen(src)
		beqz a2, .end         # n == 0, nothing is stored
		add t2, x0, x0        # t2 = i
		addi t3, a2, -1       # t3 = n - 1
.copy:
		bltu t2, t0, .check   # i < strlen(src)?
		j .term
.check:
		bltu t2, t3, .store   # i < n - 1?
		j .term
.store:
		add t4, a1, t2
		lbu t1, (t4)
		add t4, a0, t2
		sb t1, (t4)
		addi t2, t2, 1
		j .copy
.term:
		add t4, a0, t2
		sb x0, (t4)
.end:
		add a0, t0, x0
		ret
