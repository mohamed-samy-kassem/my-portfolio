ENTRY(reset)

MEMORY
{
	Mem (rwx):ORIGIN = 0X00000000 , LENGTH =64M
}
SECTIONS
{
	. = 010000;
	.startup . :
	  {
	   startup.o(.text)

	  }>Mem
	  .text :
	  {
	   *(.text)
	  }>Mem
	  .data :
	  {
	    *(.data)
	  }>Mem
	  .bss :
	  {
	   *(.bss)
	  }>Mem
	  . = . +01000;
	  stak_top = . ;
} 