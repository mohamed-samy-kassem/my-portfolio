/*
 * printing_string.c
 *
 *  Created on: Feb 6, 2023
 *      Author: mohamed samy kassem
 */
#include <stdio.h>
int main (){

	char text1[]="hi students";
	char text2[]={"hi students"};
	char text3[5]={'h','i',0};
	printf("%s\r",text1);
	printf("%s\r",text2);
	printf("%s\r",text3);
	return 0;
}

