; This file contains a function that test to see if the number that was passed is negative or positive

extern	INT_SIZE
extern	CHAR_SIZE

STDOUT		equ	1
WRITE		equ	1
SIZE		equ	1
COUNT		equ	1
SIGN_FLAG_POS	equ	15

; INT_SIZE + CHAR_SIZE + n * 8 byte address from push in this function
; plus 8 bytes for return address
TOTAL_OFFSET	equ	48

global ft_is_negative
ft_is_negative:
	push	rax
	push	rdi
	push	rsi
	push	rdx
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1;

	cmp	dword [rbp + TOTAL_OFFSET], 0
	lahf
	shr	rax, SIGN_FLAG_POS

	test	rax, 0x1
	jnz	.print_neg
	mov	byte [rbp - 1], 'P'
	jmp	.endif
.print_neg:
	mov	byte [rbp - 1], 'N'

.endif:
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, COUNT
	syscall

	add	rsp, 1
	pop	rbp
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax
	ret
	
