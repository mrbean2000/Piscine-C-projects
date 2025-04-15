; This file contains the main method for calling the function
; for testing. This will be written in assembly

%include 'ft_putchar.asm'

section .text
global _start

_start:
	mov	rbp, rsp
	sub	rsp, 1

	mov	byte [rbp - 1], 'a';
	lea	rdi, [rbp - 1];

	call	ft_putchar

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
