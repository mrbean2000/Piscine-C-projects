; This file contains a main method to test the ft_strcpy function
; The table for the linux system call can be found in the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_strcpy.asm"

section .rodata
STRING	db	"This is a string.", 0
STRLEN	equ	$ - STRING

section .bss
STRCPY	resb	STRLEN

section .text

global _start
_start:
	mov	rbp, rsp

	mov	rdi, STRCPY
	mov	rsi, STRING

	call	ft_strcpy

	call	ft_putstr

	mov	rax, 0x3c
	mov	rdi, 0
	syscall

WRITE	equ	1
STDOUT	equ	1

ft_putstr:
	push	rax
	push	rdi
	push	rsi
	push	rdx
	push	rcx

	xor	rcx, rcx
	not	rcx
	repnz	scasb
	not	rcx

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, STRCPY
	mov	rdx, rcx
	syscall

	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	ret
