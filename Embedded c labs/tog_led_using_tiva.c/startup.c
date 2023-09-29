
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


static  unsigned long stack_top [256];


void ( * const fu_vector[] )() __attribute__((section(".vectors"))) = {
           (void(*)())  (unsigned long)stack_top + sizeof(stack_top) ,
           &rest_handler,
           &nmi_handler,
           &h_fault_handler,
           &mm_fault_handler
} ;









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