/* ENG : mohamed samy */

#define SYSCTL_RCGC2_R   (*(volatile unsigned int *)(0x400FE000+0x108))
#define GPIO_PORTF_DATA  *(volatile unsigned int *)(0x40025000+0x3FC)
#define GPIO_PORTF_DIR_R *(volatile unsigned int *)(0x40025000+0x400)
#define GPIO_PORTF_DEN_R *(volatile unsigned int *)(0x40025000+0x51c)

int main (void){
     volatile unsigned int i ;
	SYSCTL_RCGC2_R =0x00000020;
	for ( i = 0 ; i < 5000 ; i ++);

	GPIO_PORTF_DIR_R |=(1<<3);
	GPIO_PORTF_DEN_R |=(1<<3);

	while(1){
		GPIO_PORTF_DATA |=(1<<3);
	for ( i = 0 ; i < 5000 ; i ++);
		GPIO_PORTF_DATA &= ~(1<<3);
	for ( i = 0 ; i < 5000 ; i ++);


    }

	return 0 ; 
}