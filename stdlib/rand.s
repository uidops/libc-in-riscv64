.section .text
.globl rand

.type rand, @function
rand:
	# ANSI C generator: seed = seed * 1103515245 + 12345
	la t0, seed
	lwu t1, (t0)
	li t2, 1103515245
	mul t1, t1, t2
	li t2, 12345
	add t1, t1, t2
	slli t1, t1, 32
	srli t1, t1, 32     # keep 32 bits
	sw t1, (t0)
	srli t1, t1, 16     # seed / 65536
	li t2, 0x7fff
	and a0, t1, t2      # % 32768
	ret

.section .data
.align 2
.globl seed
seed:
	.long 1             # behaves as srand(1) until srand() is called
