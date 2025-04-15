; This function will print out the number that is passed as a parameter into the function.
; The function will print out all possible values of the integer variable
; This means that the data should handle 4 byte 2's complement number

WRITE	equ	1
STDOUT	equ	1
LEN	equ	1

section .rodata
MIN_INT		db	"-2147483648"
MIN_LEN		equ	$ - MIN_INT

section .text
global ft_putnbr
ft_putnbr:
	push	rax
	push	rdi
	push	rsi
	push	rdx

	mov	rbp, rsp
	sub	rsp, 1

	cmp	edi, 0x80000000
	jne	.analyze

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, MIN_INT
	mov	rdx, MIN_LEN
	syscall

	jmp	.exit

.analyze:
	cmp	rdi, 0
	jge	.print_pos_nbr

	push	rdi
	mov	byte [rbp - 1], '-'
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, 1
	syscall
	pop	rdi

	neg	rdi

.print_pos_nbr:
	mov	rsi, 10
	mov	rax, rdi
	xor	rdx, rdx

	div	rsi

	cmp	rax, 0
	jle	.print

	mov	rdi, rax
	call	ft_putnbr

.print:
	add	rdx, '0'
	mov	byte [rbp - 1], dl

	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, 1
	syscall

.exit:
	add	rsp, 1

	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	ret
