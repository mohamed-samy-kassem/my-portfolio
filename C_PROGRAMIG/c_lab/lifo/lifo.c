/*
 * fifo.c
 *
 *  Created on: Mar 30, 2023
 *      Author: original
 */
#include "lifo.h"
LIFO_STATUS_T LIFO_ADD_ITEM( LIFO_BUF_T * lifo_buf , unsigned int item){

	if (!lifo_buf->base || !lifo_buf->head )
		return LIFO_NULL;
	if (lifo_buf->length == lifo_buf->count)
		return LIFO_FULL;


	*(lifo_buf->head)=item ;
	lifo_buf->head++;
	lifo_buf->count++;
	return LIFO_NO_ERROR;
}


LIFO_STATUS_T LIFO_GIT_ITEM( LIFO_BUF_T *lifo_buf , unsigned int *item){

	if (!lifo_buf->base || !lifo_buf->head )
		return LIFO_NULL;
	if(lifo_buf->count == 0 )
		return LIFO_EMPTY;

	lifo_buf->head--;
	*item= *(lifo_buf->head);
	lifo_buf->count--;

	return LIFO_NO_ERROR;



}


LIFO_STATUS_T LIFO_INIT(LIFO_BUF_T *lifo_buf , unsigned int *buf , unsigned int length){

	 if (buf == NULL)
		return LIFO_NULL;


	  lifo_buf->base=buf;
	  lifo_buf->head=buf;
	  lifo_buf->length=length;
	  lifo_buf->count=0;

	  return LIFO_NO_ERROR;





}
