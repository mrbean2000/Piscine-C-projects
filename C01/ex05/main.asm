; This file contains the main function for the entry point for printing
; The table of linux system call can be found in the following URL
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_putstr.asm"

section .rodata
STRING	db	"Hello world", 0	; Change the string here, do not remove the null terminator

section .text

EXIT	equ	0x3c
RETURN	equ	0


global _start
_start:
	push	rdi
	push	rbp

	mov	rbp, rsp
	mov	rdi, STRING

	call	ft_putstr

	pop	rbp
	pop	rdi
	
	mov	eax, EXIT
	mov	rdi, RETURN
	syscall
