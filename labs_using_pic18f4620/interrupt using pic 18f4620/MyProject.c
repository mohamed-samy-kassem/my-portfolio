



void setup_pin();
void interrupt_init();


// External interrupt routine
void interrupt(){
      if(INTCON.B1){
        portc.b0 =~ portc.b0 ;
        delay_ms(1000);
        INTCON.B1=0;
      }
}



void main() {
        setup_pin();
        interrupt_init();
      while(1){
         portc.b1 =~ portc.b1;
         delay_ms(1000);
      }
}



void setup_pin(){
  trisc.b0= 0 ;
  portc.b0= 0;
  
  trisc.b1= 0 ;
  portc.b1= 0;
}



void interrupt_init(){
      ADCON1=0b00001111;
      trisb.b0=1 ;
      //RCON.B7=0;
      INTCON.B7=1;   // glopal interrupt
      INTCON.B6=1;
      //INTCON.INT0IF=0;      // FLAG
      INTCON2.B6=1;      //RISIG EDG
      INTCON2.B7=1;
      INTCON.B4=1;          //ENABLE

}