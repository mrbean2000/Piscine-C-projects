PROG_NAME = ft_div_mod

FORMAT = elf64

CFLAGS = -Wall -Werror -Wextra -z noexecstack -no-pie

all: $(PROG_NAME)

$(PROG_NAME): main.c ft_div_mod.o
	cc $(CFLAGS) -o $@ $^

ft_div_mod.o: ft_div_mod.asm
	nasm -f $(FORMAT) $^

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
