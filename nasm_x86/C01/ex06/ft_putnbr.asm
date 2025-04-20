; This assembly file contains a function that print out an integer returned from ft_strlen
; for the table of linux system calls refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

WRITE	equ	1
STDOUT	equ	1
LEN	equ	1

global ft_putnbr

; We will only deal with positive number in this function, the strlen return only positive integers
ft_putnbr:
	push	rdi
	push	rsi
	push	rdx
	push	rax
	push	rbp

	mov	rbp, rsp
	sub	rsp, 1

	mov	rax, rdi
	xor	rdx, rdx
	mov	rsi, 10

	div	rsi

	mov	byte [rbp - 1], '0'
	add	[rbp - 1], dl

	cmp	rax, 0
	je	.print

	mov	rdi, rax
	call	ft_putnbr

.print:
	mov	rax, WRITE
	mov	rdi, STDOUT
	lea	rsi, [rbp - 1]
	mov	rdx, LEN
	syscall

	add	rsp, 1
	pop	rbp
	pop	rax
	pop	rdx
	pop	rsi
	pop	rdi

	ret
