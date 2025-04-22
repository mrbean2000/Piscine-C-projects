; This file contains the function to capitalize the first alphanumeric character in a string

section .text
global ft_strcapitalize
ft_strcapitalize:
	push	rsi
	push	rdi
	push	rcx
	push	rbp
	push	rbx

	mov	rbp, rsp

	mov	rax, rdi
	xor	rcx, rcx

	mov	rsi, 1
	mov	rbx, 'a'
	sub	rbx, 'A'

.loop_capitalize:
	cmp	byte [rdi + rcx], 0
	je	.exit

	cmp	byte [rdi + rcx], 'a'
	jl	.check_upper

	cmp	byte [rdi + rcx], 'z'
	jg	.check_upper

	cmp	rsi, 1
	jne	.next_itr

	sub	byte [rdi + rcx], bl
	jmp	.alphanumeric

.check_upper:
	cmp	byte [rdi + rcx], 'A'
	jl	.check_numeric

	cmp	byte [rdi + rcx], 'Z'
	jg	.check_numeric

	jmp	.alphanumeric

.check_numeric:
	cmp	byte [rdi + rcx], '0'
	jl	.not_alphanumeric

	cmp	byte [rdi + rcx], '9'
	jg	.not_alphanumeric

.alphanumeric:
	mov	rsi, 0
	jmp	.next_itr

.not_alphanumeric:
	mov	rsi, 1

.next_itr:
	inc	rcx
	jmp	.loop_capitalize

.exit:
	pop	rbx
	pop	rbp
	pop	rcx
	pop	rdi
	pop	rsi

	ret
