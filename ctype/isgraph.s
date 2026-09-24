.section .text
.globl isgraph

.type isgraph, @function
isgraph:
	# a0 = c
	# check printable range without space: 0x21 '!' to 0x7e '~'
	li t0, 0x21
	bltu a0, t0, .Lno
	li t0, 0x7e
	bltu t0, a0, .Lno
	li a0, 1
	ret
.Lno:
	li a0, 0
	ret
