; This file reproduces the functionality of ft_putchar
; The function prototype for ft_putchar is as follows
; 	void ft_putchar(char c);
; The table of system calls will be at the URL:
; https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/
; This code will be using x86_64 syscall tables.

STDIN	equ	1
COUNT	equ	1
WRITE	equ	0x01

section .text
global ft_putchar
ft_putchar:
	push	rbp
	push	rsi
	push	rdx
	push	rax

	mov	rbp, rsp
	sub	rsp, 1 * COUNT	; number of bytes to allocate for the local variable.
	mov	byte [rbp - 1], dil

	mov	rax, WRITE	; refer to the syscall table in the URL above
	lea	rsi, [rbp - 1]
	mov	rdi, STDIN
	mov	rdx, COUNT
	syscall

	add	rsp, 1 * COUNT
	pop	rax
	pop	rdx
	pop	rsi
	pop	rbp

	ret
