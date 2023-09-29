
  void int_pin();

  static char segmant[]={0x3f , 0x06 , 0x5b ,0x4f ,0x66 , 0x6d ,0x7d ,0x07 ,0x7f ,0x6f}  ;
void main() {
    int_pin();
   while(1){
   int i ;
   int j ;
       for(i=1 ; i < 10 ; i++){
          for( j=0 ; j<10 ;j++){
             portc=(j<<0);
             delay_ms(300);
          }
         portd=(i<<0);

       }

   
   }
}

void int_pin(){
    portc=0;
    trisc=0;
    portd= 0;
    trisd=0;

}