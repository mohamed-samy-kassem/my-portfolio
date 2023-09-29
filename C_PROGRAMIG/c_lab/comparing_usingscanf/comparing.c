/*
 * comparing.c
 *
 *  Created on: Feb 3, 2023
 *      Author: original
 */
#include <stdio.h>
void main(){
	int n;
	int m[50];
	int i;
	printf("enter n of metrics");
	fflush(stdin);
	fflush(stdout);
	scanf("%d",&n);
	printf("the value of size is %d",n);
	printf("\r\n");
	for (i=0 ; i<n ;i++){
		printf("the value of %d is ",i);
		fflush(stdin);
		fflush(stdout);
		scanf("%d",&m[i]);
	}
	int k=0;
	while(k < n){
		printf("\n%d",m[k]);
		k++;

	}

	int max = m[0];
	//int i =0;
	for (i=1 ; i<n ; i++){
		if(max < m[i]){
			max=m[i];
		}
	}
	printf("\nthe max is %d",max);
}

