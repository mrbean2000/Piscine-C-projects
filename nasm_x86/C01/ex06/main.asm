; This file contains the main function for finding out the length of the string
; The list of the linux system call is available in the following URL
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_strlen.asm"
%include "ft_putnbr.asm"

section .rodata

STRING	db	"this is not how it was suppose to be", 0 ; change the string value here, do not remove the null terminator

section .text

global _start
_start:
	push	rax
	push	rdi

	mov	rbp, rsp

	push	rax
	mov	rdi, STRING
	call	ft_strlen

	mov	rdi, rax
	call	ft_putnbr

	pop	rax
	pop	rdi
	pop	rax

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
