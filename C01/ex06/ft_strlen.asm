; This file contains a function that counts the number of characters in a string. The string has to be null-terminated

section .text

global ft_strlen
ft_strlen:
	push	rcx
	push	rbp

	mov	rbp, rsp

	xor	rax, rax
	xor	rcx, rcx
	not	rcx

	repnz	scasb

	not	rcx
	dec	rcx

	mov	rax, rcx

	pop	rbp
	pop	rcx

	ret
