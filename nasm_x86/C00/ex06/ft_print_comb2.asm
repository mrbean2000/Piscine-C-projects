; This file will contain a function that prints out the combination of 2 numbers, each going from 00 to 99
; The last combination is 98 99.
; For reference to the linux system call table, refer to the following URL
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

DEPTH	equ	2

section .text
global ft_print_comb2
ft_print_comb2:
	push	rdx
	push	rdi
	push	rsi
	push	rbp

	mov	rbp, rsp
	sub	rsp, 2 * 4
	
	mov	dword [rbp - 4], 0
	mov	dword [rbp - 8], 0

	mov	rdi, 0
	lea	rsi, [rbp - 8]
	mov	rdx, 0
	call	iterate_comb

	add	rsp, 2 * 4
	pop	rbp
	pop	rsi
	pop	rdi
	pop	rdx

	ret

COUNT		equ	100
WRITE		equ	1
STDOUT		equ	1
WRITE_COUNT	equ	1

iterate_comb:
	push	rdi
	push	rsi
	push	rax
	push	rbx
	push	rbp
	push	rdx
	push	rcx
	mov	rbp, rsp

	sub	rsp, 2
	
	cmp	rdi, DEPTH
	jne	.skip

	mov	edi, [rsi + 4]
	call	print_number
	push	rsi

	mov	byte [rbp - 2], ' '
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 2]
	mov	rdx, 1
	syscall

	pop	rsi
	mov	edi, [rsi]
	call	print_number
	
	mov	rcx, DEPTH
	mov	rax, 98
	mov	rbx, 0
	mov	rdx, rcx

.test_last:
	dec	rdx
	cmp	eax, [rsi + rdx * 4]
	sete	bl
	add	bh, bl
	inc	rax
	loop	.test_last

	cmp	bh, 2
	je	.exit

	mov	byte [rbp - 2], ','
	mov	byte [rbp - 1], ' '
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 2]
	mov	rdx, 2
	syscall
	jmp	.exit

.skip:
	inc	rdi
	mov	rax, rdi
	sub	rax, DEPTH
	neg	rax
	mov	rcx, COUNT
	sub	rcx, rdx

	; This statement is important so that the rcx is always more than 0
	; The loop instruction will decrement the rcx first and then perform a jump when rcx is non zero.
	; Without this check the decrement will cause the rcx to loop back to its maximum value, causing
	; the loop to be very long, and output incorrect results.
	jz	.exit
.iterate:
	mov	[rsi + rax * 4], edx
	inc	rdx
	call	iterate_comb
	loop	.iterate
.exit:
	add	rsp, 2 

	pop	rcx
	pop	rdx
	pop	rbp
	pop	rbx
	pop	rax
	pop	rsi
	pop	rdi

	ret

print_number:
	push	rax
	push	rdx
	push	rbp
	push	rsi
	push	rdi

	mov	rbp, rsp

	sub	rsp, 1
	mov	rax, rdi
	mov	rdx, 0
	
	mov	rdi, 10
	div	rdi		; The quotient is stored in rax and the remainder is stored in rdx

	add	rax, '0'
	add	rdx, '0'

	push	rdx;
	mov	byte [rbp - 1], al

	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, WRITE_COUNT
	syscall
	pop	rax

	mov	byte [rbp - 1], al

	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, WRITE_COUNT
	syscall
	
	add	rsp, 1;
	pop	rdi
	pop	rsi
	pop	rbp
	pop	rdx
	pop	rax

	ret
