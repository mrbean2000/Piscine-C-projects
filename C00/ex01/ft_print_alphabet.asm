; This file contains a function that prints the alphabets from a to z.
; The alphabets will be in lower case.

STDOUT		equ	1
COUNT		equ	1
SIZE		equ	1
WRITE		equ	1
ALPHA_SET	equ	26

section .text
global ft_print_alphabet
ft_print_alphabet:
	push	rax
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	rbp

	mov	rbp, rsp
	sub	rsp, SIZE ; declare the local variable here

	mov	byte [rbp - SIZE], 'a'

	; we will be using the instruction "loop" to implement a while loop
	; the loop uses rcx as a counter for the loop
	; we save this counter into a local variable
	; brcause the syscall instrucition will overwrite value in rcx
	mov	rcx, ALPHA_SET 

.print_loop:
	push	rcx
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - SIZE]
	mov	rdx, COUNT
	syscall

	pop	rcx;
	inc	byte [rbp - SIZE]
	loop	.print_loop

	add	rsp, SIZE 
	pop	rbp
	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	ret
