/*
 * printing_array_of_strig.c
 *
 *  Created on: Feb 6, 2023
 *      Author: mohamed samy kassem
 */
#include <stdio.h>
void main (){
	char array_names[5][14]={"mohamed samy ","ahmed samy ","mahmoud samy ", "samy kassem","doctor essam"};
	int i;
	for (i=0 ; i<5 ; i++){
		printf("%s\r",array_names[i]);

	}
}

