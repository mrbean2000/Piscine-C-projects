; This file contains the main method for calling the function
; for testing. This will be written in assembly

%include 'ft_putchar.asm'

section .text
global _start

_start:
	mov	rbp, rsp

	push	rdi
	mov	rdi, 'a' ; we will be declaring a local variable in the ft_putchar function
	call	ft_putchar
	pop	rdi

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
