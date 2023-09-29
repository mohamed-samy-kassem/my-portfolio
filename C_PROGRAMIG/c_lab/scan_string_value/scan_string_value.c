/*
 * scan_string_value.c
 *
 *  Created on: Feb 6, 2023
 *      Author: mohamed samy kassem
 */
#include <stdio.h>
int main (){
	char string [100];
	printf("enter your string value ");
	fflush(stdin);
	fflush(stdout);
	//scanf("%s",&string);
	gets(string);             // using gets to write the spaces  among my string like (  mohamed  samy )
	//printf("\r\n %s",&string[0]);
	printf("\r\n %s",string);




	return 0;
}

