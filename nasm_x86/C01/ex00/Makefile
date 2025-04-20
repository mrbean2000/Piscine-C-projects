PROG_NAME = ft_ft

FORMAT = elf64

CFLAGS = -Wall -Wextra -Werror -no-pie -z noexecstack

all: $(PROG_NAME)

$(PROG_NAME): main.c ft_ft.o
	cc -o $(PROG_NAME) $(CFLAGS) $^

ft_ft.o: ft_ft.asm
	nasm -f $(FORMAT) $^

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
