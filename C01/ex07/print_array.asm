; This file prints out the integers that are in order

WRITE	equ	1
STDOUT	equ	1

section .rodata
INT_MIN	db	"-2147483648"

section .text

global print_array
print_array:
	push	rdi
	push	rsi
	push	rax
	push	rdx
	push	rcx
	push	rbp

	mov	rbp, rsp
	sub	rsp, 2

	mov	byte [rbp - 2], ','
	mov	byte [rbp - 1], ' '

	mov	rcx, rsi
	mov	rax, rdi
	xor	rdx, rdx

.print_num:
	movsx	rdi, dword [rax + rdx * 4]
	call	print_num
	inc	rdx
	cmp	rcx, 1
	je	.fin_comma

	push	rdx
	push	rcx
	push	rax

	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 2]
	mov	rdx, 2
	syscall

	pop	rax
	pop	rcx
	pop	rdx
.fin_comma:
	loop	.print_num

	add	rsp, 2

	pop	rbp
	pop	rcx
	pop	rdx
	pop	rax
	pop	rsi
	pop	rdi

	ret

print_num:
	push	rdi
	push	rsi
	push	rdx
	push	rax
	push	rbp
	push	rcx

	mov	rbp, rsp
	sub	rsp, 1

	cmp	edi, 0x80000000
	jne	.process

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, INT_MIN
	mov	rdx, 11
	syscall

	jmp	.exit

.process:
	cmp	rdi, 0
	jge	.skip_neg

	mov	byte [rbp - 1], '-'
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, 1
	syscall

	mov	rdi, [rbp + 0x28]
	neg	rdi
.skip_neg:
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
	add	[rbp - 1], dl
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, 1
	syscall

.exit:
	add	rsp, 1

	pop	rcx
	pop	rbp
	pop	rax
	pop	rdx
	pop	rsi
	pop	rdi

	ret
