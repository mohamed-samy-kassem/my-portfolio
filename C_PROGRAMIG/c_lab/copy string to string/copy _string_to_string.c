/*
 * copy _string_to_string.c
 *
 *  Created on: Feb 6, 2023
 *      Author: original
 */
#include <stdio.h>
	char string1[30]={"mohamed samy"};
	char string2[20];
	int i=0;
	int k=0;
	char string3[20]=" kassem";

void main (){

	//printf("%c\r",string1[2]);
	while(string1[i] != 0 ){             //strcpy(string2,string1);
		string2[i]=string1[i];
		i++;
	}
	printf("%d\r",i);
	string2[i]= '\0';
	printf("%s\r",string2);
	while(  (string3[k]!=0)){

		string1[i]=string3[k];
		i++;
		k++;

	}
	printf("\r\n");
	printf("%s",string1);


}

