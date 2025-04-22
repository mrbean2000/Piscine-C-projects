; This file contains the main function for capitalizing the first alphanumeric character in the string
; For the list of system call, refer to the following URL:
;	https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

%include "ft_strcapitalize.asm"

section .data
;	Change the following string to capitalize
STRING		db	"salut, comment tu vas ? 42mots quarante-deux; cinquante+et+un", 0x0a, 0
STR_LEN		equ	$ - STRING

WRITE		equ	1
STDOUT		equ	1

section .text

global _start
_start:
	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, STRING
	mov	rdx, STR_LEN
	syscall

	mov	rdi, STRING
	call	ft_strcapitalize

	mov	rsi, rax

	mov	rax, WRITE
	mov	rdi, STDOUT
	mov	rsi, STRING
	mov	rdx, STR_LEN
	syscall

	mov	rax, 0x3c
	mov	rdi, 0
	syscall
