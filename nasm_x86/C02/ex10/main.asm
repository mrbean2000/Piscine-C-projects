; This file contains the main function that reproduces the function strlcpy
; for the list of system calls refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_strlcpy.asm"

section .rodata
SOURCE		db	"Hello", 0
SPACE		db	" ", 0
NEWLINE		db	0x0a, 0

section .bss
DEST	resb	10

section .text
global _start
_start:
	xor	rbx, rbx

.start_loop:
	cmp	rbx, 10
	jge	.end_print

	mov	rdi, DEST
	mov	rsi, SOURCE
	mov	rdx, rbx
	call	ft_strlcpy

	xchg	rax, rdi
	call	ft_putnbr

	mov	rdi, SPACE
	call	ft_putstr

	mov	rdi, rax
	call	ft_putstr

	mov	rdi, NEWLINE
	call	ft_putstr

	inc	rbx
	jmp	.start_loop

.end_print:
	mov	rax, 0x3c
	mov	rdi, 0
	syscall

WRITE	equ	1
STDOUT	equ	1

ft_putnbr:
	push	rdi
	push	rsi
	push	rax
	push	rdx
	push	rbp

	mov	rbp, rsp
	sub	rsp, 1

	mov	rax, rdi
	xor	rdx, rdx

	mov	rdi, 10

	div	rdi

	cmp	rax, 0
	jz	.print

	mov	rdi, rax
	call	ft_putnbr

.print:
	mov	byte [rbp - 1], '0'
	add	byte [rbp - 1], dl

	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, 1
	syscall

	add	rsp, 1

	pop	rbp
	pop	rdx
	pop	rax
	pop	rsi
	pop	rdi

	ret

ft_putstr:
	push	rdi
	push	rcx
	push	rax
	push	rbp
	push	rsi

	mov	rbp, rsp

	xor	rax, rax
	xor	rcx, rcx
	not	rcx

	mov	rsi, rdi

	repnz	scasb

	not	rcx

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rdx, rcx
	syscall

	pop	rsi
	pop	rbp
	pop	rax
	pop	rcx
	pop	rdi

	ret
