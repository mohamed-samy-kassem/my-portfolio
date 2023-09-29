/*
 * switch_labe.c
 *
 *  Created on: Feb 6, 2023
 *      Author: mohamed sam kassem
 */
#include <stdio.h>
void main(){
	int choice ;
	printf("enter your choice = ");
	fflush(stdin);
	fflush(stdout);
	scanf("%d",&choice);
	switch (choice){
	case 1 : {
		printf("hellow 1"); break;
	}
	case 2 :
	{
		printf("hellow 2"); break;
	}
	case 3 :
	{
		printf("hellow 3"); break;
	}
	default :
	{
		printf("ERROR NUM");
	}
	}
}

