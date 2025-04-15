; This assembly file contains the method for printing the alphabets in reverse order

SIZE		equ	1
COUNT		equ	1
STDOUT		equ	1
ALPHA_SET	equ	26
WRITE		equ	1

global ft_print_reverse_alphabet
ft_print_reverse_alphabet:
	push	rax
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	rbp

	mov	rbp, rsp
	sub	rsp, SIZE
	mov	byte [rbp - SIZE], 'z'
	mov	rcx, ALPHA_SET

.print_reverse_alpha:
	push	rcx
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - SIZE]
	mov	rdx, COUNT
	syscall
	dec	byte [rbp - SIZE]
	pop	rcx
	loop	.print_reverse_alpha

	add	rsp, SIZE
	pop	rbp
	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	ret
