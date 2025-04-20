; This file contains the sorting algorithm for the array of integers.

section .text

global ft_sort_int_tab
ft_sort_int_tab:
	push	rax
	push	rbx
	push	rcx
	push	rdx
	push	rdi
	push	rsi
	push	rbp

	mov	rbp, rsp

	xor	rdx, rdx
	mov	rcx, rsi

.outer_loop:
	push	rcx
	mov	rcx, rsi
	sub	rcx, rdx
	mov	rbx, rdx
	mov	eax, dword [rdi + rbx * 4]

.inner_loop:
	cmp	eax, dword [rdi + rbx * 4]
	jle	.after_swap

	mov	eax, dword [rdi + rbx * 4]
	xchg	dword [rdi + rdx * 4], eax
	xchg	eax, dword [rdi + rbx * 4]

.after_swap:
	inc	rbx
	loop	.inner_loop

	inc	rdx
	pop	rcx
	loop	.outer_loop

	pop	rbp
	pop	rsi
	pop	rdi
	pop	rdx
	pop	rcx
	pop	rbx
	pop	rax

	ret
