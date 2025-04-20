; This file contains the functionality to reproduce strcpy from the string.h header file

global ft_strcpy
ft_strcpy:
	push	rdi
	push	rsi
	push	rbx

	mov	rbx, rdi
.copy_str:
	movzx	rax, byte [rsi]
	mov	byte [rdi], al
	inc	rdi
	inc	rsi
	cmp	rax, 0
	jne	.copy_str

	mov	rax, rbx

	pop	rbx
	pop	rsi
	pop	rdi

	ret
