/*
 * comparing_numbers.c
 *
 *  Created on: Feb 3, 2023
 *      Author:mohamed samy kassem
 *
 */
#include <stdio.h>
	int num[5]={10,5,12,90,20};
	int i ;

void main (){

     int max_number = num[0];
	for (i=1 ; i<5 ; i++){
		if (num[i] > max_number )
		{
			max_number=num[i];

		}
	}
	printf("max_number = %d", max_number);

	printf("\r\n");

	   int min_number = num[0];
		for (i=1 ; i<5 ; i++){
			if (num[i] < min_number )
			{
				min_number=num[i];

			}
		}
		printf("min_number = %d", min_number);

}

