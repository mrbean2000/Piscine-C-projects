PROG_NAME = ft_strlowcase

FORMAT = elf64

all: $(PROG_NAME)

$(PROG_NAME): main.o
	ld -o $@ $^

main.o: main.asm ft_strlowcase.asm
	nasm -f $(FORMAT) $<

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
