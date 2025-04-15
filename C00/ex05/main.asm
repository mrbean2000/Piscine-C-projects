; This program will call the function that will print out all unique conmibinations of 3 different digits
; For reference to the system call table, follow the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_print_comb.asm"

section .text
global _start
_start:
	mov	rbp, rsp

	call	ft_print_comb

	mov	rax, 0x3c
	mov	rdi, 0;
	syscall
