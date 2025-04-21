; This file contains a main function to test if the string is printable
; For the list of system calls, refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_str_is_printable.asm"

section .rodata
STRING		db	"THISISAST8RING~~~~ZZ", 0xa, 0	; change the string here
POS_STR		db	"The string is printable.", 0
POS_LEN		equ	$ - POS_STR
NEG_STR		db	"The string is not printable.", 0
NEG_LEN		equ	$ - NEG_STR

section .text

global _start
_start:
	mov	rbp, rsp

	mov	rdi, STRING

	call	ft_str_is_printable

	mov	rbx, rax
	
	mov	rax, 1
	mov	rdi, 1

	cmp	rbx, 1
	jne	.false

	mov	rsi, POS_STR
	mov	rdx, POS_LEN
	jmp	.print

.false:
	mov	rsi, NEG_STR
	mov	rdx, NEG_LEN

.print:
	syscall

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
