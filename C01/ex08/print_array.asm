; This file contains functions that are resposible for printing the integers that are in the array in order

STDOUT	equ	1
WRITE	equ	1
LEN	equ	1

section .rodata
INT_MIN		db	"-2147483648"
MIN_LEN		equ	$ - INT_MIN
COMMA		db	", "
COMMA_LEN	equ	$ - COMMA

section .text

global print_array
print_array:
	push	rax
	push	rcx
	push	rdi
	push	rdx
	push	rbp

	mov	rbp, rsp

	mov	rcx, rsi
	mov	rax, rdi
	xor	rdx, rdx

.iterate_elements:
	movsx	rdi, dword [rax + rdx * 4]
	call	print_num

	cmp	rcx, 1
	je	.skip_comma

	push	rcx
	push	rdi
	push	rdx
	push	rax

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, COMMA
	mov	rdx, COMMA_LEN
	syscall

	pop	rax
	pop	rdx
	pop	rdi
	pop	rcx

.skip_comma:
	inc	rdx
	loop	.iterate_elements

	pop	rbp
	pop	rdx
	pop	rdi
	pop	rcx
	pop	rax

	ret

print_num:
	push	rdi
	push	rsi
	push	rax
	push	rcx
	push	rdx
	push	rbp

	mov	rbp, rsp
	sub	rsp, 1

	cmp	edi, 0x80000000
	jne	.process

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, INT_MIN
	mov	rdx, MIN_LEN
	syscall

	jmp	.exit

.process:
	cmp	rdi, 0
	jge	.print_num

	push	rdi

	mov	byte [rbp - 1], '-'
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, LEN
	syscall

	pop	rdi
	neg	rdi

.print_num:
	mov	rax, rdi
	xor	rdx, rdx
	mov	rsi, 10
	div	rsi

	cmp	rax, 0
	jz	.print

	mov	rdi, rax
	call	print_num

.print:
	mov	byte [rbp - 1], '0'
	add	byte [rbp - 1], dl

	lea	rsi, [rbp - 1]
	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rdx, LEN
	syscall

.exit:
	add	rsp, 1

	pop	rbp
	pop	rdx
	pop	rcx
	pop	rax
	pop	rsi
	pop	rdi

	ret
