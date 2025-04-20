; This file contains the function to print out all the numbers starting with 0

STDOUT		equ	1
COUNT		equ	1
SIZE		equ	1
LOOP_COUNT	equ	10
WRITE		equ	1
WRITE_SIZE	equ	1

section .text
global ft_print_numbers
ft_print_numbers:
	push	rax
	push	rdi
	push	rsi
	push	rdx
	push	rbp
	push	rcx

	mov	rbp, rsp
	sub	rsp, SIZE
	mov	byte [rbp - SIZE], '0'

	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - SIZE]
	mov	rdx, COUNT

	mov	rcx, LOOP_COUNT
.print_numbers:
	push	rcx
	syscall
	inc	byte [rbp - SIZE]
	pop	rcx
	loop .print_numbers

	add	rsp, SIZE
	pop	rcx
	pop	rbp
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	ret

