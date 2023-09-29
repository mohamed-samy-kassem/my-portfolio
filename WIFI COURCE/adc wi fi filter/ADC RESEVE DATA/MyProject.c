sbit LCD_RS at Rc4_bit;
sbit LCD_EN at Rc5_bit;
sbit LCD_D7 at Rc3_bit;
sbit LCD_D6 at Rc2_bit;
sbit LCD_D5 at Rc1_bit;
sbit LCD_D4 at Rc0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISc4_bit;
sbit LCD_EN_Direction at TRISc5_bit;
sbit LCD_D7_Direction at TRISc3_bit;
sbit LCD_D6_Direction at TRISc2_bit;
sbit LCD_D5_Direction at TRISc1_bit;
sbit LCD_D4_Direction at TRISc0_bit;
  void config();
  char get_string(char *string,char *from, char _from,char *to,char _to,char *get);
  char val[25];
  char adc1[10];
  char adc2[10];
void main() {
   config();
  while(1){
  if (UART1_Data_Ready() == 1) {          // if data is received
    UART1_Read_Text(val, "OK", 14);    // reads text until 'OK' is found
    get_string(val,"A",1,"B",0,adc1);
   lcd_out(1,1,adc1);
      get_string(val,"C",1,"D",0,adc2);
      lcd_out(1,7,adc2);

 }
  
  }
}
void config(){
    UART1_Init(9600);
 Lcd_Init();
 ADC_Init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_out(1,1,"wifi");
 delay_ms(1000);
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);
}
char get_string(char *string,char *from, char _from,char *to,char _to,char *get){
   char *p1;
   char *p2;
   char lenght=0;
   p1 = strstr(string,from)+ _from ;

   p2= strstr(p1,to ) + _to;
   lenght=p2-p1;
strncpy(get,p1,lenght);
  get[lenght]='\0';
}