PROG_NAME = ft_putstr

FORMAT = elf64

all: $(PROG_NAME)

$(PROG_NAME): main.o
	ld -o $(PROG_NAME) $^

main.o: main.asm ft_putstr.asm
	nasm -f $(FORMAT) $<

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
