.section .text
.globl getuid

.include "include/syscall.s"

getuid:
	addi a7, x0, SYS_getuid
	scall
	ret
