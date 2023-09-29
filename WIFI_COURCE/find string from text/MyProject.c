char response_mse[]=" hellomohamed samy kassem  coultan mekawy ";
 char get[6]="samyj";
void config ();
int find_text ( char *string ,char *string_find );

void main() {
  config();
 while(1){
  if (find_text ( response_mse ,"sam" )==1){
      portc.b0=1 ;
     }
     else{
        portc.b0=0;
     }
 
 }

}
void config (){
//ADCON1=0b00001111;
trisc.b0=0;
 portc.b0=0;

}
int find_text ( char *string ,char *string_find ){
          unsigned int matched =0;
          unsigned int index_string =0;
          unsigned int length_string_find=0;
          unsigned int length_string=0;
          
          
          length_string_find = strlen(string_find );
          length_string = strlen( string);
          if(   length_string_find> length_string){
              return 0;
          }
          for (index_string;index_string <length_string; index_string++){
            if(string[index_string]==string_find[matched]){
               matched++ ;
               if(length_string_find==matched ){
                 return 1;
               }
               }
            else{
              matched=0;
            }
           }
    return 0;
          


}