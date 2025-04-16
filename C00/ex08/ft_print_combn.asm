; This file contains a function that prints all the combination of n-digit numbers.
; The acceptable parameters are 0 > n > 10 (1 to 9)

section .text
global ft_print_combn
ft_print_combn:
	push	rsi
	push	rdi
	push	rbp
	mov	rbp, rsp

	sub	rsp, rdi

	xor	rsi, rsi
	mov	rdx, rbp
	mov	rcx, '0'
	call	iterate_comb
	
	add	rsp, rdi

	pop	rbp
	pop	rdi
	pop	rsi
	ret

WRITE	equ	1
STDOUT	equ	1
SEP_LEN	equ	2

iterate_comb:
	push	rcx
	push	rax
	push	rbx
	push	rdx
	push	rbp
	push	rdi
	push	rsi
	mov	rbp, rsp

	sub	rsp, 1;

	cmp	rsi, rdi
	je	.print
	
	mov	rax, rcx
	mov	rcx, 11
	sub	rcx, rdi

.iterate_loop:
	mov	rbx, rdi
	sub	rbx, rsi
	neg	rbx		; The addressing mode only supports addition of a register with another register
	mov	byte [rdx + rbx], al
	neg	rbx

	inc	rax	
	cmp	rax, '9' + 1
	jg	.exit

	push	rcx
	push	rsi
	
	mov	rcx, rax
	inc	rsi

	call	iterate_comb

	pop	rsi
	pop	rcx
	loop	.iterate_loop

	jmp	.exit
	
.print:
	push	rdi
	push	rsi
	push	rdx

	mov	rax, WRITE
	neg	rdi		; The addressing mode only supports addition of a register with another register
	lea	rsi, [rdx + rdi]
	neg	rdi
	mov	rdx, rdi
	mov	rdi, STDOUT
	syscall

	pop	rdx
	pop	rsi
	pop	rdi

	mov	rcx, rdi
	mov	rax, '9'
	xor	rbx, rbx
	mov	rsi, -1
.check_last:
	cmp	byte [rdx + rsi], al
	sete	bh
	dec	rsi
	add	bl, bh
	dec	rax
	loop	.check_last

	cmp	bl, dil
	je	.exit

	mov	byte [rbp - 2], ','
	mov	byte [rbp - 1], ' '
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - SEP_LEN]
	mov	rdx, SEP_LEN
	syscall

.exit:
	add	rsp, 1;

	pop	rsi
	pop	rdi
	pop	rbp
	pop	rdx
	pop	rbx
	pop	rax
	pop	rcx

	ret
