.section .text
.globl strstr

.type strstr, @function

strstr:
	# a0 = haystack, a1 = needle
	lbu t0, (a1)
	bnez t0, .search
	ret                 # needle is empty, return haystack (a0)
.search:
	add s1, x0, a0      # s1 is current scan pointer in haystack
.outer_loop:
	lbu t2, (s1)
	beqz t2, .not_found
	add t3, x0, s1      # t3 scan pointer for haystack comparison
	add t4, x0, a1      # t4 scan pointer for needle comparison
.inner_loop:
	lbu t5, (t4)
	beqz t5, .found     # match completed
	lbu t6, (t3)
	bne t6, t5, .next_char
	addi t3, t3, 1
	addi t4, t4, 1
	j .inner_loop
.next_char:
	addi s1, s1, 1
	j .outer_loop
.found:
	add a0, x0, s1
	ret
.not_found:
	li a0, 0
	ret
