/*
 * calculate_area_circurmference.c
 *
 *  Created on: Feb 3, 2023
 *      Author:mohamed samy kassem
 */
#include <stdio.h>
void main (){
	char choice;
	float area , circumference;
	float radious;
	printf("enter your choice area  type a or circumference type c  or t for both : ");
	fflush(stdin);
	fflush(stdout);
	scanf("%c",&choice);
	if(choice=='a')
	{
		printf("enter the radius of your shape := ");
		fflush(stdin); fflush(stdout);
		scanf("%f",&radious);
		area=2*3.14*radious*radious;
		printf("area= %f",area);
	}
	else if (choice=='c')
	{
		printf("enter the radius of your shape := ");
		fflush(stdin); fflush(stdout);
		scanf("%f",&radious);
		circumference=2*3.14*radious;
		printf("circumference= %f",circumference);
	}
	else if (choice=='t')
	{
		printf("enter the radius of your shape := ");
			fflush(stdin); fflush(stdout);
			scanf("%f",&radious);
			area=2*3.14*radious*radious;
			circumference=2*3.14*radious;
			printf("area= %f\n",area);
			printf("circumference= %f",circumference);
	}
	else
	{
		printf("Error");
	}


}

