CC=arm-none-eabi-
CFLAGS=-g -mcpu=arm926ej-s
INCS=-I .
LIBS=
SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)
AS = $(wildcard *.s)
ASOBJ= $(AS:.s=.o)
p_name= any_name_you_type

all: print_mohamed.bin


%.o: %.c
	$(CC)gcc.exe -c $(INCS) $(CFLAGS) $< -o $@


startup.o: startup.s
	$(CC)as.exe $(CFLAGS) $< -o $@

print_mohamed.elf: $(OBJ) $(ASOBJ)
	$(CC)ld.exe -T linker.ld $(LIBS) $(OBJ) $(ASOBJ) -o print_mohamed.elf -Map=Map_file.map

print_mohamed.bin: print_mohamed.elf
	$(CC)objcopy.exe -O binary $< $@

