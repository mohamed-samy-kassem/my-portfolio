/*
 * sum from 1 to 99 .c
 *
 *  Created on: Feb 6, 2023
 *      Author: mohamed samy kassem
 */

#include <stdio.h>
void main (){
	int sum=0 ;
	int i ;
	for (i =0 ; i<100 ; i++){
		//sum =sum +i;
		sum +=i;
	}
	printf("sum from 1 to 99 = ( %d ) ",sum);
}
