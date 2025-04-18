; This function tries to reproduce strncpy function from the string.h header

global ft_strncpy
ft_strncpy:
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	rbx

	mov	rax, rdi

.copy_str:
	cmp	rdx, 0
	je	.pad
	cmp	byte [rsi], 0
	je	.pad
	movzx	rbx, byte [rsi]
	mov	byte [rdi], bl
	inc	rsi
	inc	rdi
	dec	rdx
	jmp	.copy_str

.pad:
	mov	byte [rdi], 0

	pop	rbx
	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi

	ret
