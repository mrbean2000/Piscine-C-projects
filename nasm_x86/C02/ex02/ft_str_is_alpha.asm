; This file contains a function that is responsible for testing if the string is alpha

section .text

global ft_str_is_alpha
ft_str_is_alpha:
	push	rcx
	push	rdi
	push	rbp

	mov	rbp, rsp

	xor	rcx, rcx
	not	rcx

	repnz 	scasb

	not	rcx
	dec	rcx
	mov	rdi, [rbp + 0x8]

.loop_check:
	cmp	byte [rdi + rcx - 1], 'a'
	jl	.chk_upper

	cmp	byte [rdi + rcx - 1], 'z'
	jle	.next_itr

.chk_upper:
	cmp	byte [rdi + rcx - 1], 'A'
	jl	.false

	cmp	byte [rdi + rcx - 1], 'Z'
	jg	.false

.next_itr:
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
