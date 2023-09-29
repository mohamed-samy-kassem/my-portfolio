
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "conio.h"
#define DPRINTF(...)		{fflush(stdout);\
	                         fflush(stdin);\
							printf(__VA_ARGS__);\
							 fflush(stdout);\
	                         fflush(stdin);}

struct sdata{
   int id;
   float hight;
   char name[40];

};

struct sstudent{
   struct sdata student ;
   struct sstudent *p_next_studet;
};


struct sstudent *gpf_record= NULL;

//===============API=====================
void fill_record(struct sstudent *new_student);
void ADD_NEW_RECORD();
void view_all_student();
void print_any_thing();
void delete_all_student();
int delet_certain_record();
int show_selected_student();


char num [30];
void main(){

    while(1)
        {
    DPRINTF("\n=========================\n");
    DPRINTF(" 1:   ADD_NEW_RECORD()\n");
    DPRINTF(" 2:  delet_certain_record()\n");
    DPRINTF(" 3:  view_all_student()\n");
    DPRINTF(" 4:  delete_all_student()\n");
    DPRINTF(" 5:  show_selected_student();\n");

     DPRINTF("=========================\n");
    gets(num);
    switch(atoi(num)){
      case 1:  ADD_NEW_RECORD(); break;
      case 2:  delet_certain_record(); break;
      case 3:  view_all_student(); break;
      case 4:  delete_all_student(); break;
      case 5:  show_selected_student(); break;
      default: DPRINTF("\nWRONG OPTION !!!!!!");break;

          }
    }
}





void ADD_NEW_RECORD(){
    struct sstudent *p_last_record;
    struct sstudent *p_new_record;

    if(gpf_record == NULL){
       p_new_record=( struct sstudent *) malloc(sizeof(struct sstudent));
       gpf_record = p_new_record;
    }else{
        p_last_record = gpf_record;
        while(p_last_record->p_next_studet)
            p_last_record=p_last_record->p_next_studet;

       p_new_record=( struct sstudent *) malloc(sizeof(struct sstudent));
       p_last_record->p_next_studet = p_new_record;

    }

    fill_record(p_new_record);
    p_new_record->p_next_studet=NULL;

}




void fill_record(struct sstudent *new_student){

   // new_student = (struct sstudent *)malloc(sizeof(struct sstudent));
   char var[40];
   DPRINTF("ENTER YOUR ID .....?\n");
    gets(var);
   new_student->student.id= atoi (var);

   DPRINTF("ENTER YOUR height .....?\n");
   gets(var);
   new_student->student.hight= atof (var);

   DPRINTF("ENTER YOUR name .....?\n");
   gets(new_student->student.name);
}

void print_any_thing(){
    DPRINTF("=========================hi=======================");

}

void view_all_student(){
    struct sstudent *curent_student = gpf_record;
    int count = 0 ;

    if(gpf_record == NULL){
        DPRINTF("this list is empty");
    }else{
        while(curent_student){
            DPRINTF("\n=========================\n");
            DPRINTF("\n\t record number ====(%X)\n",count+1);
            DPRINTF("\n\t id number ====(%d)\n",curent_student->student.id);
            DPRINTF("\n\t hight number ====(%.1f)\n",curent_student->student.hight);
            DPRINTF("\n\t name number ====(%s)\n",curent_student->student.name);
            curent_student=curent_student->p_next_studet;
           DPRINTF("=========================");
            count++;

        }
    }
}






void delete_all_student(){
    struct sstudent *curent_student = gpf_record;


    if(gpf_record == NULL){
        DPRINTF("this list is empty");
    }else{
        while(curent_student){
            struct sstudent *p_temp = curent_student;
            curent_student=curent_student->p_next_studet;
            free(p_temp);


        }
        gpf_record=NULL;
    }
}



int delet_certain_record(){
     struct sstudent *prev_student= NULL;
     struct sstudent *selcted_student= gpf_record;

     char var[40];
     unsigned int id;

     DPRINTF("ENTER SELECTED ID TO REMOVE IT ");
     gets(var);
     id = atoi(var);


     while(selcted_student){

        if(selcted_student->student.id == id)
        {

                if(prev_student){
                    prev_student->p_next_studet = selcted_student->p_next_studet;



                }else{
                   gpf_record = selcted_student->p_next_studet;
                }
                free(selcted_student);
                return 1 ;

        }
        prev_student = selcted_student;
        selcted_student = selcted_student->p_next_studet;

     }
     DPRINTF("id is faulty take one more ");
     return 0 ;

}






int show_selected_student (){
    struct sstudent *selected_student = gpf_record ;
    struct sstudent *previous_student = NULL;

     char var[40];
     unsigned int id;

     DPRINTF("ENTER SELECTED ID TO show IT ");
     gets(var);
     id = atoi(var);



    while(selected_student){
       if(selected_student->student.id == id ){
                    DPRINTF("\n=========================\n");
                    DPRINTF("\n\t record number ====(%d)\n",id);
                    DPRINTF("\n\t id number     ====(%d)\n",selected_student->student.id);
                    DPRINTF("\n\t height number  ====(%.1f)\n",selected_student->student.hight);
                    DPRINTF("\n\t name number   ====(%s)\n",selected_student->student.name);
                    DPRINTF("=========================\n");
                    return 1;
       }else{
            previous_student = selected_student;
            selected_student=selected_student->p_next_studet;

       }

    }
    DPRINTF("fault id ");
    return 0;

}
