; This file will contain 2 different functions, one of the function is the answer that is required
; and another function is for the recursive call that is responsible for the iterating through
; unique combinations

COUNT	equ	3

section .rodata
	COMMA		db 	", ", 0x00
	COMMA_LEN	equ	$ - COMMA

section .text

global ft_print_comb
ft_print_comb:
	push	rdi
	push	rsi
	push	rdx
	push	rbp

	mov	rbp, rsp
	sub	rsp, COUNT

	mov	rdi, 0
	lea	rsi, [rbp - COUNT]
	mov	rdx, 0
	call	iterate_print

	add	rsp, COUNT
	pop	rbp
	pop	rdx
	pop	rsi
	pop	rdi

	ret

; This function is resposible for printing the data to the standard output
; we will iterate through all the possible conbinations in this function using recursion
WRITE		equ	1
STDOUT		equ	1
TOTAL_DIGITS	equ	10

iterate_print:
	push	rsi
	push	rdi
	push	rdx
	push	rax
	push	rbp
	push	rcx

	mov	rbp, rsp
	cmp	rdi, COUNT
	jnz	.skip
	
	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rdx, COUNT
	syscall

	; test if the current printing is the last possibility
	mov	rcx, COUNT
	mov	rax, 1
	mov	rdi, '9'
.test_last:
	cmp	byte [rsi + rcx - 1], dil
	setne	al
	dec	rdi
	loop	.test_last

	test	rax, rax
	je	.exit

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, COMMA
	mov	rdx, COMMA_LEN
	syscall

	jmp	.exit

.skip:
	; determine the character position to write into the array
	mov	rax, rdi
	inc	rdi

	; calculate the number we need from the current rcx to read 10
	mov	rcx, TOTAL_DIGITS
	sub	rcx, rdx

	; This statement is important, otherwise the loop will go on forever, printing wrong results
	; Reason being when the second digit is 9, the next digit is 10, causing the thrid character
	; to print a ASCII beyond '9'.
	; the loop instruction decrements rcx first then check for not equal to zero.
	; in this case the rcx is 0 and decrementint will cause it to have a maximum integer for the data type
	je	.exit
.iterate:
	mov	byte [rsi + rax], '0'
	add	byte [rsi + rax], dl
	inc	rdx
	call	iterate_print
	loop	.iterate

.exit:
	pop	rcx
	pop	rbp
	pop	rax
	pop	rdx
	pop	rdi
	pop	rsi

	ret

