/*
 * main.c
 *
 *  Created on: Mar 30, 2023
 *      Author: mohamed samy kassem
 */


#include "lifo.h"
unsigned int buf_array[10];

void  main (){
	unsigned int i = 0;
	unsigned int temp = 0;

   LIFO_BUF_T uart_buf ;
   LIFO_INIT(&uart_buf,buf_array,10);

   for ( i=0 ; i<4 ; i++){
	  LIFO_ADD_ITEM(&uart_buf,i);
	  printf("lifo_add_item : %d\n",i);
   }

   for ( i=0 ; i<4 ; i++){
	  LIFO_GIT_ITEM(&uart_buf,&temp);
	  printf("lifo_git_item : %d\n",temp);
   }



}
