/* mohamed samy kassem */


.section .vectors

.word 0x20001000  /* stack topp address in sram add  */  
	.word _reset
	.word vector_handler






.section .text
_reset:
	bl main 
stop : b stop

.thumb_func
vector_handler:
	b _reset
