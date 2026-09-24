.section .text
.globl isprint

.type isprint, @function
isprint:
	# a0 = c
	# check printable range 0x20 ' ' to 0x7e '~'
	li t0, 0x20
	bltu a0, t0, .Lno
	li t0, 0x7e
	bltu t0, a0, .Lno
	li a0, 1
	ret
.Lno:
	li a0, 0
	ret
