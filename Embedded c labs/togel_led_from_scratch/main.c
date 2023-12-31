/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Auto-generated by STM32CubeIDE
 * @brief          :m.samy
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2023 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */

/*
 * tog_led.c
 *
 *  Created on: Mar 13, 2023
 *      Author: original
 */
#include "stdio.h"
#include "stdint.h"

#define RCC_BASE		0X40021000
#define PORTA_BASE		0X40010800

//--------------OFSET-----------//

#define APB2_ENP		*(volatile uint32_t *)(RCC_BASE+0X18)
#define GPIOA_CHR		*(volatile uint32_t *)(PORTA_BASE+0X04)
#define GPIOA_ODR		*(volatile uint32_t *)(PORTA_BASE+0X0C)


int main (void)
{


	APB2_ENP |=(1<<2);
	GPIOA_CHR &=0XFF0FFFFF;
	GPIOA_CHR |=0X00200000;


	while(1){

		GPIOA_ODR |=(1<<13);
		for (int i=0 ; i<5000 ; i++);
		GPIOA_ODR &= ~(1<<13);
		for (int i=0 ; i<5000 ; i++);

	}
	return 0;
}

