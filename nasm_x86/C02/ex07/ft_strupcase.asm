; This file contains a function that converts all the lowercase alphabets to uppercase

section .text
global ft_strupcase
ft_strupcase:
	push	rcx
	push	rdi
	push	rbp

	mov	rbp, rsp

	xor	rcx, rcx
	not	rcx

	repnz	scasb

	not	rcx
	mov	rdi, [rbp + 0x8]

	mov	rax, 'a'
	sub	rax, 'A'

.loop_check:
	cmp	byte [rdi + rcx - 1], 'a'
	jl	.next

	cmp	byte [rdi + rcx - 1], 'z'
	jg	.next

	sub	byte [rdi + rcx - 1], al

.next:
	loop	.loop_check
	

	mov	rax, rdi

	pop	rbp
	pop	rdi
	pop	rcx

	ret
