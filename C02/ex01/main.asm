; This file contains the main function for testing strncpy that we will be reproducing
; For the table of linux system calls, refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_strncpy.asm"

section .rodata
STRING	db	"This is a string to test strncpy.", 0
STRLEN	db	10

section .bss
STRCPY	resb	100

section .text

global _start
_start:
	mov	rdi, STRCPY
	mov	rsi, STRING
	movzx	rdx, byte [STRLEN]

	call	ft_strncpy

	mov	rdi, rax

	call	ft_putstr

	mov	rax, 0x3c
	mov	rdi, 0
	syscall

WRITE	equ	1
STDOUT	equ	1

ft_putstr:
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	rax

	mov	rsi, rdi
	xor	rax, rax
	xor	rcx, rcx
	not	rcx
	repnz	scasb
	not	rcx

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, STRCPY
	mov	rdx, rcx
	syscall

	pop	rax
	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi

	ret
