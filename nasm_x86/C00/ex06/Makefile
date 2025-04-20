PROG_NAME = ft_print_comb2

FORMAT = elf64

all: $(PROG_NAME)

$(PROG_NAME): main.o
	ld -o $@ $^

main.o: main.asm ft_print_comb2.asm
	nasm -f $(FORMAT) $<

clean:
	rm -f main.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
