; This file will contain the function to test a sorting algorithm.
; We will be using a insertion sort for the this exercise
; For the table of linux system calls, refer the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "print_array.asm"
%include "ft_sort_int_tab.asm"

section .data
ARRAY		dd	123123, -12312, 54678, 22, -9876544, 87670, 333, 87665
ARRAY_LEN	equ	$ - ARRAY

section .rodata
NEWLINE		db	0xa

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

	call	ft_sort_int_tab

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, NEWLINE
	mov	rdx, LEN
	syscall

	mov	rdi, ARRAY
	mov	rsi, ARRAY_LEN
	shr	rsi, 2

	call	print_array

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
