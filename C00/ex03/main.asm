; This is a program that prints out the numbers in ascending order
; To reference the system call table, refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls

%include "ft_print_numbers.asm"

global _start
_start:
	mov	rbp, rsp

	call	ft_print_numbers
	
	mov	rax, 0x3c
	mov	rdi, 0
	syscall
