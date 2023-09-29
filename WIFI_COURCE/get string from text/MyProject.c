// Lcd pinout settings
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
  char get_string(char *string,char *from, char _from,char *to,char _to,char *get);
 void config();
 char string[]=" mohamed samy is a good FLOOR=3&ROOM=1 engineer he will be a good manager ";
 char get[20];    //for storing the vale
 char find[]="engineer";

void main() {
  config();
  while(1){
  get_string( string,"FLOOR=",6,"&",0,get);
  lcd_out(1,1,get);
    get_string( string,"ROOM=",5,"en",0,get);
  lcd_out(2,1,get);
  
  }
}
void config(){
    Lcd_Init();
   LCD_CMD(_LCD_CURSOR_OFF);
   LCD_OUT(1,1,"WIFI GET TEXT ");
   delay_ms(1000);
   lcd_cmd(_LCD_CLEAR);
}
char get_string(char *string,char *from, char _from,char *to,char _to,char *get){
   char *p1;
   char *p2;
   char lenght=0;
   p1 = strstr(string,from)+ _from ;

   p2= strstr(p1,to ) + _to;
   lenght=p2-p1;
   get[lenght];
strncpy(get,p1,lenght);

}