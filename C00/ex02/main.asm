; This is a main function for the code that prints all the alphabets in reverse.
; All the alphabet will be done in lowercase
; For the system call table, go to the following URL
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls

%include "ft_print_reverse_alphabet.asm"

global _start
_start:
	mov	rbp, rsp

	call	ft_print_reverse_alphabet

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
