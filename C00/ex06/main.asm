; This file will print all the combinations of 2 numbers, each of them are double digit
; The linux system call table is in the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_print_comb2.asm"

global _start
_start:
	mov	rbp, rsp

	call	ft_print_comb2

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
