; This file contains a function that is responsible for printing a string to the standard out
; For the linux system call table refer to the following URL
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

STDOUT	equ	1
WRITE	equ	1

section .text

global	ft_putstr
ft_putstr:
	push	rax
	push	rcx
	push	rsi
	push	rdx
	push	rdi
	push	rbp

	mov	rbp, rsp

	mov	rsi, rdi
	xor	rcx, rcx
	not	rcx
	xor	rax, rax
	
	repnz	scasb

	not	rcx
	
	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rdx, rcx
	syscall

	pop	rbp
	pop	rdi
	pop	rdx
	pop	rsi
	pop	rcx
	pop	rax

	ret
