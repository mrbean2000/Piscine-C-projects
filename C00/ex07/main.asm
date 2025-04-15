; This program will print out the number on the standard ouput.
; It should handle all possible values of the int datatype.
; The reference for the linux system call is references in the URL
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_putnbr.asm"

section .text
global _start
_start:
	push	rdi

	mov	rbp, rsp

	mov	rdi, 214748364
	call	ft_putnbr
	pop	rdi

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
