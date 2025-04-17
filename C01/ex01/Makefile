PROG_NAME = ft_ultimate_ft

FORMAT = elf64

CFLAGS = -Wall -Wextra -Werror -z noexecstack -no-pie

all: $(PROG_NAME)

$(PROG_NAME): main.c ft_ultimate_ft.o
	cc $(CFLAGS) -o $@ $^

ft_ultimate_ft.o: ft_ultimate_ft.asm
	nasm -f $(FORMAT) $^

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
