; This program will print all the combinations of numbers specified by a parameter
; This parameter indicates the number of the digits to print
; for the list of system call table in linux, refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_print_combn.asm"

section .text
global _start
_start:
	push	rbp
	mov	rbp, rsp

	mov	rdi, 9		; change the constant here for testing
	call	ft_print_combn
	
	mov	rax, 0x3c
	mov	rdi, 0
	syscall
