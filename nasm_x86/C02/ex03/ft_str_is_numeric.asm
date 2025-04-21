; This file contains a function that test if the string only contains numeric characters

section .text

global ft_str_is_numeric
ft_str_is_numeric:
	push	rcx
	push	rdi
	push	rbp

	mov	rbp, rsp

	xor	rcx, rcx
	not	rcx

	repnz	scasb

	not	rcx
	dec	rcx

	mov	rdi, [rbp + 0x8]

.loop_check:
	cmp	byte [rdi + rcx - 1], '0'
	jl	.false

	cmp	byte [rdi + rcx - 1], '9'
	jg	.false

	loop	.loop_check

	mov	rax, 1
	jmp	.exit

.false:
	mov	rax, 0

.exit:
	pop	rbp
	pop	rdi
	pop	rcx

	ret
