; This file contains the function that assigns 42 to the ninth order pointer.
; The pointer will therefore have to be dereferenced 9 times.

global ft_ultimate_ft
ft_ultimate_ft:
	push	rcx
	push	rdi
	push	rbp

	mov	rbp, rsp

	mov	rcx, 8
.dereference_loop:
	mov	qword rdi, [rdi]
	loop	.dereference_loop

	mov	byte [rdi], 42

	pop	rbp
	pop	rdi
	pop	rcx

	ret
