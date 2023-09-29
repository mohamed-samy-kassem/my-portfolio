/*
 * fifo.h
 *
 *  Created on: Mar 30, 2023
 *      Author: original
 */

#ifndef FIFO_H_
#define FIFO_H_
#include "stdio.h"
#include "stdint.h"


typedef struct {
	unsigned int length;
	unsigned int count;
	unsigned int *base;
	unsigned int *head;
}LIFO_BUF_T;



typedef enum {
	LIFO_NO_ERROR,
	LIFO_FULL,
	LIFO_EMPTY,
	LIFO_NULL
}LIFO_STATUS_T;


// API FOR LIFO YOU CAN USE IT IN LIFO.C AD USING IT IN MAIN.C AS A LAYER ON YOUR DRIVER

LIFO_STATUS_T LIFO_ADD_ITEM( LIFO_BUF_T * lifo_buf , unsigned int item);
LIFO_STATUS_T LIFO_GIT_ITEM( LIFO_BUF_T *lifo_buf , unsigned int *item);
LIFO_STATUS_T LIFO_INIT(LIFO_BUF_T *lifo_buf , unsigned int *buf , unsigned int length);


#endif /* FIFO_H_ */
