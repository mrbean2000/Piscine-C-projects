; This file contains a main function that prints out the results of the string is numeric or not
; For the list of the linux system call, refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_str_is_numeric.asm"

section .rodata
NUM_STR		db	"883904982901", 0		; change the string for testing
POS_STR		db	"The string is numeric.", 0
POS_LEN		equ	$ - POS_STR
NEG_STR		db	"The string is not numeric.", 0
NEG_LEN		equ	$ - POS_STR

section .text

global _start
_start:
	mov	rbp, rsp
	
	mov	rdi, NUM_STR

	call	ft_str_is_numeric
	
	mov	rbx, rax

	mov	rax, 1
	mov	rdi, 1

	cmp	rbx, 1
	je	.true

	mov	rsi, NEG_STR
	mov	rdx, NEG_LEN
	jmp	.print

.true:
	mov	rsi, POS_STR
	mov	rdx, POS_LEN

.print:
	syscall

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
