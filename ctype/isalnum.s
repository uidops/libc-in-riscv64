.section .text
.globl isalnum

.type isalnum, @function

isalnum:
	ori t0, a0, 0x20
    addi t0, t0, -0x61
    addi t1, x0, 0x19
    bleu t0, t1, .no
    addi a0, a0, -0x30
    sltiu a0, a0, 0x0a
	ret
	.no:
		addi  a0, x0, 1
		ret
