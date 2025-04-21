; This file contains a main function that will test if a string is an alphabet
; For the list of the system call for the linux operating system, refer to the following table:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_str_is_alpha.asm"

section .rodata
TEST_STRING	db	"azSFDKJLSfkgjlaksdjfoiwejo", 0 ; change this line to test the string
POS_RESULT	db	"The string is alpha", 0
POS_LEN		equ	$ - POS_RESULT
NEG_RESULT	db	"The string is not alpha", 0
NEG_LEN		equ	$ - NEG_RESULT

section .text

global _start
_start:
	mov	rbp, rsp

	mov	rdi, TEST_STRING
	call	ft_str_is_alpha

	mov	rbx, rax
	mov	rax, 1
	mov	rdi, 1

	cmp	rbx, 1
	jne	.neg

	mov	rsi, POS_RESULT
	mov	rdx, POS_LEN
	syscall

	jmp	.exit

.neg:
	mov	rsi, NEG_RESULT
	mov	rdx, NEG_LEN
	syscall

.exit:
	mov	rax, 0x3c
	mov	rdi, 0
	syscall
