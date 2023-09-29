/*
 * inline_conditional_operator.c
 *
 *  Created on: Feb 6, 2023
 *      Author: mohamed samy
 */
#include <stdio.h>
void main (){
	int a , b , min ;
	printf("enter a and b number = ");
	fflush(stdin);
	fflush(stdout);
	scanf("%d %d",&a,&b);
	min= (a<b) ? 1 : 0 ;
	printf("%d",min);
}


