PROG_NAME = ft_strlcpy

FORMAT = elf64

all: $(PROG_NAME) test

$(PROG_NAME): main.o
	ld -o $@ $^

main.o: main.asm ft_strlcpy.asm
	nasm -f $(FORMAT) $<

clean:
	rm -f *.o

fclean: clean
	rm -f $(PROG_NAME) test

re: fclean all

test: test.c
	cc -o $@ $^
