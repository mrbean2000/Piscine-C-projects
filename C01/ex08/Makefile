PROG_NAME = ft_sort_int_tab

FORMAT = elf64

all: $(PROG_NAME)

$(PROG_NAME): main.o
	ld -o $@ $^

main.o: main.asm print_array.asm ft_sort_int_tab.asm
	nasm -f $(FORMAT) $<

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
