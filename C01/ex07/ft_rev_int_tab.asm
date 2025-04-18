; This file will try to reverse the array of integers that are specified in an array

global ft_rev_int_tab
ft_rev_int_tab:
	push	rcx
	push	rdi
	push	rsi
	push	rax
	push	rbx

	mov	rcx, rsi
	mov	rbx, rdi
	xor	rax, rax

.loop:
	mov	edi, [rbx + rax * 4]
	inc	rax
	push	rdi
	loop	.loop

	mov	rcx, rsi
	xor	rax, rax

.rev:
	pop	rdi
	mov	[rbx + rax * 4], edi
	inc	rax
	loop	.rev

	pop	rbx
	pop	rax
	pop	rsi
	pop	rdi
	pop	rcx

	ret
