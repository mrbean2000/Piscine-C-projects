; This file contains a function that reproduces strlcpy

global ft_strlcpy
ft_strlcpy:
	push	rdi
	push	rsi
	push	rcx
	push	rbx
	push	rdx
	push	rbp

	mov	rbp, rsp

	xor	rax, rax
	xor	rcx, rcx
	not	rcx

	xchg	rsi, rdi
	mov	rbx, rdi

	repne	scasb

	not	rcx
	mov	rax, rcx
	dec	rax

	cmp	rdx, 0
	je	.exit

	cmp	rcx, rdx
	cmovg	rcx, rdx
	dec	rcx
	
	mov	byte [rsi + rcx], 0
	jmp	.next_iter
	
.cpy_loop:
	movzx	rdx, byte [rbx + rcx]
	mov	byte [rsi + rcx], dl

.next_iter:
	dec	rcx
	jge	.cpy_loop

.exit:
	pop	rbp
	pop	rdx
	pop	rbx
	pop	rcx
	pop	rsi
	pop	rdi

	ret
