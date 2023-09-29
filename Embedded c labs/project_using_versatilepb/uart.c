#include "uart.h"
#define uart0d *((volatile unsigned int *)((unsigned int*) 0x101f1000))
void uart_send_string(unsigned char*p_string_tx)
{
	while(*p_string_tx != '\0')
	{
		uart0d= (unsigned int)(*p_string_tx);
		p_string_tx++;
	}
}