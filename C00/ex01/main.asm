; This for the question that requires the program to print
; all the alphabets in order. The alphabets are in lowercase.

%include 'ft_print_alphabet.asm'

section .text
global _start
_start:
	mov	rbp, rsp

	call	ft_print_alphabet

	mov	rax, 0x3c	; exit opcode for x86_64 systems
	mov	rdi, 0		; exit code for the return value
	syscall
