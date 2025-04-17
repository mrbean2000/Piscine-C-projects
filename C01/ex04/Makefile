PROG_NAME = ft_ultimate_div_mod

FORMAT = elf64

CFLAGS = -Wall -Werror -Wextra -no-pie -z noexecstack

all: $(PROG_NAME)

$(PROG_NAME): main.c ft_ultimate_div_mod.o
	cc $(CFLAGS) -o $@ $^

ft_ultimate_div_mod.o: ft_ultimate_div_mod.asm
	nasm -f $(FORMAT) $^

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
