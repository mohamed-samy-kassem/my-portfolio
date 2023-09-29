
#if !defined(__SOFT_FP__) && defined(__ARM_FP)
#warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
#endif




#include "stdio.h"
#include "stdint.h"

#define RCC_BASE		0X40021000
#define PORTA_BASE		0X40010800


//--------------OFSET-----------//

#define APB2_ENP		*(volatile uint32_t *)(RCC_BASE+0X18)
#define GPIOA_CHR		*(volatile uint32_t *)(PORTA_BASE+0X04)
#define GPIOA_ODR		*(volatile uint32_t *)(PORTA_BASE+0X0C)
#define GPIOA_CRL		*(volatile uint32_t *)(PORTA_BASE+0X00)

#define PORTB_BASE 		0x40010C00
#define GPIOB_ODR		*(volatile uint32_t *)(PORTB_BASE+0X0C)
#define GPIOB_CRL		*(volatile uint32_t *)(PORTB_BASE+0X00)

#define AFIO	       0x40010000
#define AFIO_EXTICR1		*(volatile uint32_t *)(AFIO+0x08)

#define EXTI 		   0x40010400
#define RISING		*(volatile uint32_t *)(EXTI+0x08)
#define MASK		*(volatile uint32_t *)(EXTI+0x00)
#define PANDING		*(volatile uint32_t *)(EXTI+014)

#define NVIC         *(volatile uint32_t *)(0xE000E100)



unsigned int n;
unsigned int const x =50;

void init ();
void pin_init();
void init_INTERRUPT ();


int main (void)
{


	pin_init();
	init_INTERRUPT ();

	while(1){

		GPIOB_ODR ^=(1<<0);
		for(int i=0 ; i<3000 ; i++);

	}
	return 0;
}

void EXTI0_IRQHandler(){
	GPIOA_ODR ^= (1<<13);
	//GPIOB_ODR ^=(1<<0);
	PANDING |= (1<<0);

}
void init_INTERRUPT (){
	AFIO_EXTICR1= 0;   // P0 PORT A USING IT IN INTERRUPT
	RISING |= (1<<0);
	MASK |= (1<<0);
	NVIC |= (1<<6);


}
void pin_init(){
	// pi 13 is out led
	APB2_ENP |=(1<<0);
	APB2_ENP |=(1<<2);
	APB2_ENP |=(1<<3);
	GPIOA_CHR &=0XFF0FFFFF;
	GPIOA_CHR |=0X00200000;



	// Port b0 is input pin to make interrupt
	GPIOA_CRL |= (1<<2);
	//PORTA B0 IS OUT PUT

	GPIOB_CRL &=0XFFFFFFF0;
	GPIOB_CRL |=0X00000002;

	GPIOA_ODR |= (1<<13);
	GPIOB_ODR |=(1<<0);

}
