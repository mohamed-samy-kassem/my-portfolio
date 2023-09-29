/*
 * comparing.c
 *
 *  Created on: Feb 8, 2023
 *      Author: original
 */
#include <stdio.h>
#include <string.h>

char name1[]="mohamed";
char name2[]="mohamed";
char name3[]="samy";
int i;
int index1=0;
int index2=0;
int len =0;
void main(){

//----------------------------------------------------------------//
	//this part will print hellow

	if(strcmp(name2,name1)==0)
			{
				printf("\nhellow ");
			}
	else{
		printf("\nerror");
	}
//------------------------------------------------------------------//
	// this part will print not matched
	for( i=0 ; i <7 ; i++)
	{
		if(name3[index1] == name2[index2])
		{
			index1++;
			index2++;
		}else
		{
			index1=0;
			index2++;
		}
	}
	if(index1 == index2)
	{
		printf("\nmatched");
	}else
	{
		printf("\nnot matched");
	}



}

