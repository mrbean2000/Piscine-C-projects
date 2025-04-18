; This file contains a function for reversing the elements in the array of integers
; for the table of linux system call, refer to the following URL
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/


%include "print_array.asm"
%include "ft_rev_int_tab.asm"

section .data

ARRAY		dd	12312, 333333, -3888, -123045, -589745, 0x80000000, -34534, 90345, -23423
ARRAY_LEN	equ	$ - ARRAY
NEWLINE		db	10

section .text

global _start
_start:
	mov	rbp, rsp
	
	mov	rdi, ARRAY
	mov	rsi, ARRAY_LEN
	shr	rsi, 2

	call	print_array

	mov	rdi, ARRAY
	mov	rsi, ARRAY_LEN
	shr	rsi, 2

	call	ft_rev_int_tab

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, NEWLINE
	mov	rdx, 1
	syscall

	mov	rdi, ARRAY
	mov	rsi, ARRAY_LEN
	shr	rsi, 2

	call	print_array

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
