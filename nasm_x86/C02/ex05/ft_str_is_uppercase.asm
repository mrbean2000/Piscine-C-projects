; This file contains a function to determine if the string only contains upper case alphabets

section .text

global ft_str_is_uppercase
ft_str_is_uppercase:
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
	cmp	byte [rdi + rcx - 1], 'A'
	jl	.false

	cmp	byte [rdi + rcx - 1], 'Z'
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
