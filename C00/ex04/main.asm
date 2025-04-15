; This file will call a function that determine of the value that is passed into the function is negative
; or not. The value that is tested will be printed out in the main function.
; The system call table will be at the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls

%include "ft_is_negative.asm"

INT_SIZE	equ	4

global _start
_start:
	mov	rbp, rsp
	sub	rsp, INT_SIZE

	; edit the integer value for the test
	mov	dword [rbp - INT_SIZE], -20

	call	ft_is_negative

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
