PROG_NAME = ft_print_alphabet

ASM_FILES = main.asm

OBJ_FILES = $(ASM_FILES:.asm=.o)

FORMAT = elf64

all: $(PROG_NAME)

$(PROG_NAME): $(OBJ_FILES)
	ld -o $(PROG_NAME) $(OBJ_FILES)

$(OBJ_FILES): main.asm ft_print_alphabet.asm
	nasm -f $(FORMAT) $<

clean:
	rm -f $(OBJ_FILES)

fclean: clean
	rm -f $(PROG_NAME)

re: fclean all
