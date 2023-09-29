
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

char adc[14];
int val;
int val2;
 void config();
  void send_data(int val ,int val2,char *adc);

void main() {
config();
  while(1){
   val=  ADC_Read(0);
      val2= ADC_Read(1);
      send_data(val,val2,adc);
  
  }
}
void config(){
 UART1_Init(9600);
 Lcd_Init();
 ADC_Init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_out(1,1,"hi mohamed");
 delay_ms(1000);
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);


}
void send_data(int val ,int val2,char *adc){
   adc[0]  ='A';
    adc[1]  =(val/1000)+'0';
     adc[2] =(val/100)%10+'0';
      adc[3] =(val/10)%10+'0';
       adc[4] =(val%10)+'0';
        adc[5] ='B';
            adc[6]  ='C';
               adc[7]   = (val2/1000)+'0';
                  adc[8]  = (val2/100)%10+'0';
                     adc[9]  = (val2/10)%10+'0';
                        adc[10] = (val2%10)+'0';
                       adc[11]='D';
                       adc[12]='o';
                       adc[13]='k';
                       adc[14]='\0';
                UART_Write_Text(adc);
                lcd_out(1,1,adc);
                delay_ms(100);


}