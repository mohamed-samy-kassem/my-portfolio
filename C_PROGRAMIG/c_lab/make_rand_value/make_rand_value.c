/*
 * make_rand_value.c
 *
 *  Created on: Feb 8, 2023
 *      Author: original
 */
#include <stdio.h>
void main(){
	int value;
	int k =0x10+010+10;
	printf("%d %d",k );
	int i;
	for(i =0 ;i<10 ; i++ ){
		value=rand();
		printf("value=%d\n",value);

	}

}

