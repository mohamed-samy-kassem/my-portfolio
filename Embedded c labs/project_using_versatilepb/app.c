#include "uart.h"
unsigned char string_tx[100]= "mohamed samy kassem";
unsigned char const string [100]="ali";
int x=50;
void main(void)
{
     
     
     uart_send_string(string_tx);
     
}