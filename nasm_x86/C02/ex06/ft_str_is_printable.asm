; This file contains a function to determine if the string only contains printable characters

section .text

global ft_str_is_printable
ft_str_is_printable:
	push	rcx
	push	rdi
	push	rbp

	mov	rbp, rsp

	xor	rcx, rcx
	not	rcx

	repne	scasb

	not	rcx
	dec	rcx
	jz	.true

	mov	rdi, [rbp + 0x8]

.loop_check:
	cmp	byte [rdi + rcx - 1], ' '
	jl	.false

	cmp	byte [rdi + rcx - 1], 0x7e
	jg	.false

	loop	.loop_check

.true:
	mov	rax, 1
	jmp	.exit

.false:
	mov	rax, 0

.exit:
	pop	rbp
	pop	rdi
	pop	rcx

	ret
