PROG_NAME = ft_swap

FORMAT = elf64

CFLAGS = -Wall -Wextra -Werror -z noexecstack -no-pie

all: $(PROG_NAME)

$(PROG_NAME): main.c ft_swap.o
	cc $(CFLAGS) -o $@ $^

ft_swap.o: ft_swap.asm
	nasm -f $(FORMAT) $^

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
