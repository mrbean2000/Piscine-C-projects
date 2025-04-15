PROG_NAME = ft_putchar

ASM_FILES = main.asm

OBJ_FILES = $(ASM_FILES:.asm=.o)

OBJ_FORMAT = elf64

all: $(PROG_NAME)

$(PROG_NAME): $(OBJ_FILES)
	ld -o $@ $^

$(OBJ_FILES): $(ASM_FILES)
	nasm -f $(OBJ_FORMAT) $^

clean:
	rm -f $(OBJ_FILES)

fclean: clean
	rm -f $(PROG_NAME)
