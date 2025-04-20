; This file contains a function to perform a swap of the values pointed to by a pointer.

section .text

global ft_swap
ft_swap:
	push	rbp
	push	rax

	mov	eax, [rdi]
	xchg	eax, [rsi]
	xchg	eax, [rdi]

	pop	rax
	pop	rbp

	ret
