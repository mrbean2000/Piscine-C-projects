; This file reproduces the functionality of ft_putchar
; The function prototype for ft_putchar is as follows
; 	void ft_putchar(char c);
; The table of system calls will be at the URL:
; https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/
; This code will be using x86_64 syscall tables.

STDIN	equ	1
COUNT	equ	1
WRITE	equ	0x01

global ft_putchar
ft_putchar:
	push	rbp
	push	rdi
	push	rsi
	push	rdx
	push	rax

	mov	rbp, rsp

	mov	rax, WRITE	; refer to the syscall table in the URL above
	mov	rsi, rdi
	mov	rdi, STDIN
	mov	rdx, COUNT
	syscall

	pop	rax
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rbp

	ret
