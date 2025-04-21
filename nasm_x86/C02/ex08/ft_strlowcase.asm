; This file contains a function that converts all the uppercase alphabets to lowercase

section .text
global ft_strlowcase
ft_strlowcase:
	push	rbx
	push	rcx
	push	rdi
	push	rbp

	mov	rbp, rsp

	xor	rcx, rcx
	not	rcx

	xor	rax, rax
	repnz	scasb

	not	rcx
	mov	rdi, [rbp + 0x8]

	mov	rbx, 'a'
	sub	rbx, 'A'


.loop_check:
	cmp	byte [rdi + rcx - 1], 'A'
	jl	.next

	cmp	byte [rdi + rcx - 1], 'Z'
	jg	.next

	add	byte [rdi + rcx - 1], bl

.next:
	loop	.loop_check
	
	mov	rax, rdi

	pop	rbp
	pop	rdi
	pop	rcx
	pop	rbx

	ret
