/*
 * sum using while .c
 *
 *  Created on: Feb 6, 2023
 *      Author: mohamed samyy kassem
 */
#include <stdio.h>
void main (){
	int i=1;
	int sum =0;
	while (i <= 99 ){
		sum+=i;
		i++;

	}
	printf("the sum is (%d)",sum);
}

