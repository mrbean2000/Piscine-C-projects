; This file contains a function that outputs the quotient and remainder

section .text

global ft_div_mod
ft_div_mod:
	push	rax
	push	rdi
	push	rsi
	push	rcx
	push	rdx

	mov	eax, edi
	mov	edi, esi
	mov	rsi, rdx
	xor	rdx, rdx
	
	div	edi

	mov	dword [rsi], eax
	mov	dword [rcx], edx

	pop	rdx
	pop	rcx
	pop	rsi
	pop	rdi
	pop	rax

	ret
