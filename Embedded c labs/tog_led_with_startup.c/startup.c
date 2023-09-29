
#include <stdint.h>

extern int main(void);


void rest_handler ();

void default_handler (){
	rest_handler();
}



void nmi_handler(void) __attribute__((weak,alias("default_handler")));;
void h_fault_handler(void) __attribute__((weak,alias("default_handler")));;
void mm_fault_handler(void) __attribute__((weak,alias("default_handler")));;

extern unsigned int _stack_top;

extern unsigned int data_size;

extern unsigned int bss_size;

extern unsigned int _E_DATA;

extern unsigned int _S_DATA;

extern unsigned int _E_bss;

extern unsigned int _S_bss;

extern unsigned int p_dst;

extern unsigned int p_src;

extern unsigned int _E_text;

uint32_t vector [] __attribute__((section(".vectors"))) = {
 (uint32_t) &_stack_top,
 (uint32_t) &rest_handler ,
 (uint32_t) &nmi_handler,
 (uint32_t) &h_fault_handler,
 (uint32_t) &mm_fault_handler
};

void rest_handler()
{
    unsigned int data_size =  (unsigned char*)&_E_DATA - (unsigned char *)&_S_DATA ;
    unsigned char * p_src = (unsigned char * )&_E_text ;
    unsigned char *p_dst = (unsigned char *)&_S_DATA ;
    for ( int i=0 ; i< data_size ; i++){
            *((unsigned char *) p_dst ++) = *((unsigned char *) p_src ++) ; 
    }


    unsigned int bss_size =  (unsigned char*)&_E_bss - (unsigned char *)&_S_bss ;
    p_dst = (unsigned char *)&_S_bss ;
    for ( int i=0 ; i< data_size ; i++){
            *((unsigned char *) p_dst ++) = (unsigned char) 0 ; 
    }





	main();
}