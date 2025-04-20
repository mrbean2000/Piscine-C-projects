; This is a file that assigns a value that is pointed by a pointer
; The function prototype is as follows
;	void ft_ft(int *);

global ft_ft
ft_ft:
	mov	dword [rdi], 42
	ret
