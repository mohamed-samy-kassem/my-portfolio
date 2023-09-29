CC=arm-none-eabi-
CFLAGS= -mcpu=cortex-m4 -gdwarf-2 -g
INCS=-I .
LIBS=
SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)
AS = $(wildcard *.s)
ASOBJ= $(AS:.s=.o)
p_name= flashing

all: $(p_name).bin


%.o: %.c
	$(CC)gcc.exe -c -std=c99 $(INCS) $(CFLAGS) $< -o $@


$(p_name).elf: $(OBJ) $(ASOBJ)
	$(CC)ld.exe -T linker.ld $(LIBS) $(OBJ) $(ASOBJ) -o $(p_name).elf -Map=Map_file.map
	$(CC)objcopy.exe -O binary $(p_name).elf $(p_name).hex
	$(CC)objcopy.exe -O binary $(p_name).elf $(p_name).axf

$(p_name).bin: $(p_name).elf
	$(CC)objcopy.exe -O binary $< $@
	

