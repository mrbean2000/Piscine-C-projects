section .text

global ft_ultimate_div_mod
ft_ultimate_div_mod:
	push	rax
	push	rdx
	
	mov	eax, [rdi]
	xor	edx, edx

	div	dword [rsi]

	mov	dword [rdi], eax
	mov	dword [rsi], edx

	pop	rdx
	pop	rax

	ret
