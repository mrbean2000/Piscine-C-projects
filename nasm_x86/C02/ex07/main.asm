; This file contains the main function to convert to uppercase letters
; for the list of system calls refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_strupcase.asm"

section .data
STRING		db	"the lazy dog jump over the big brown fox testing 4 UPPERCASE !@#$%()894930", 0x0a, 0	; Change the string here
STRING_LEN	equ	$ - STRING

WRITE	equ	1
STDOUT	equ	1

section .text

global _start
_start:
	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, STRING
	mov	rdx, STRING_LEN
	syscall

	mov	rdi, STRING
	call	ft_strupcase

	mov	rsi, rax
	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rdx, STRING_LEN
	syscall

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
