#line 1 "D:/ÏíÓß ÊæÈ/WIFI COURCE/wifi confi/MyProject.c"


 sbit LCD_RS at Rc1_bit;
sbit LCD_EN at Rc2_bit;
sbit LCD_D7 at RC3_bit;
sbit LCD_D6 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D4 at RC6_bit;


sbit LCD_RS_Direction at TRISC1_bit;
sbit LCD_EN_Direction at TRISC2_bit;
sbit LCD_D7_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC6_bit;

 char buff[500];
 char data_ready ;
 unsigned int data_len ;
 char temp;

 char x[]= "samy";
const char AT[] = "AT";
const char AT_RST[] = "AT+RST";
const char AT_CWMODE[] = "AT+CWMODE=";
const char AT_CWJAP[] = "AT+CWJAP=";
const char AT_CWLAP[] = "AT+CWLAP";
const char AT_CWQAP[] = "AT+CWQAP";
const char AT_CWSAP[] = "AT+CWSAP=";
const char AT_CIPSTATUS[] = "AT+CIPSTATUS";
const char AT_CIPSTART[] = "AT+CIPSTART=";
const char AT_CIPCLOSE[] = "AT+CIPCLOSE=";
const char AT_CIFSR[] = "AT+CIFSR";
const char AT_CIPMUX[] = "AT+CIPMUX=";
const char AT_CIPSERVER[] = "AT+CIPSERVER=";
 const char ready=1;
 const char no_change=1;
 const char send_ready=1;
 const char ok=1;

 char APIP[30];

 char APMAC[30];

 char STAIP[30];

 char STAMAC[30];

 char SSID[]="M";
 char password[]="engofmicro 01111986203";
 char port[]="80";




 void config();
 void uart1_write_at(char *_data);
 void UART1_write_text_const(const char *_data);
 void UART1_write_data(char *_data);
 void new_line();
 void reset_buff();
 char get_string(char *string,char *from, char _from,char *to,char _to,char *get);
 int find_text ( char *string ,char *string_find );
 int respons_success();
 void get_ip_mac();
 void wifi_config ();
 void interrupt_config();
 void void check_connection () ;
 void interrupt(){
 INTCON.GIE=0;
 if( PIR1.RCIF==1){
 temp= UART1_Read();
 switch(temp){
 case  0X0A :
 if(data_len >1){
 data ready=1;
 }
 break;
 case  0x0D :
 buff[data_len]=0;
 break;
 default:
 buff[data_len]=temp ;
 data_len++;
 }
 PIR1.RCIF=0;
 }
 INTCON.GIE=1;

 }
void main() {
 UART1_Init(9600);
 while(1){


 UART1_write_text_const(AT_CIPSTART);
 new_line();
#line 122 "D:/ÏíÓß ÊæÈ/WIFI COURCE/wifi confi/MyProject.c"
 delay_ms(2000);


 }
}
void config(){
 UART1_Init(9600);
 interrupt_config();
#line 135 "D:/ÏíÓß ÊæÈ/WIFI COURCE/wifi confi/MyProject.c"
 trisd.B0=0;

}
void uart1_write_at(char *_data){
 UART1_write_Text(_data);
 UART1_write(0x0D);
 UART1_write(0x0A);
}

void UART1_write_text_const(const char *_data){
 while(*_data){
 UART1_write(*_data++);
 }

}
void UART1_write_data(char *_data){
 while(*_data){
 UART1_write(*_data++);

 }

}
void new_line(){
 UART1_write(0x0D);
 UART1_write(0x0A);

}
void reset_buff(){
 memset(buff,0,data_len);
 data_ready=0;
 data_len=0;
}
void reset_wifi(){

 portd.b0=1;

 delay_ms(500);

 portd.b0=0;
}
#line 186 "D:/ÏíÓß ÊæÈ/WIFI COURCE/wifi confi/MyProject.c"
int find_text ( char *string ,char *string_find ){
 unsigned int matched =0;
 unsigned int index_string =0;
 unsigned int length_string_find=0;
 unsigned int length_string=0;


 length_string_find = strlen(string_find );
 length_string = strlen( string);
 if( length_string_find> length_string){
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
int respons_success(){
 int result;
 while(!data_ready);
 if( find_text(buff,"OK")==1){result=1;}
 else if(find_text (buff,"no change")==1){result=no_change;}
 else if(find_text (buff,">")==1){result=send_ready;}
 else result=0;
 reset_buff();
 return result;
}
void get_ip_mac(){
 while(!data_ready);
 reset_buff();
 lcd_cmd(_LCD_CLEAR);
 while(!data_ready);
 get_string(buff, "APIP,\"",6,"\"",0,APIP);
 LCD_OUT(1,1,APIP);

 get_string(buff, "APMAC,\"",7,"\"",0,APMAC);
 LCD_OUT(1,2,APIP);

 get_string(buff, "STAIP,\"",7,"\"",0,STAIP);
 LCD_OUT(1,3,APIP);

 get_string(buff, "STAMAC,\"",8,"\"",0,STAMAC);
 LCD_OUT(1,4,APIP);

 reset_buff();

}
 void wifi_config (){
 data_ready=0;
 data_len=0;
 memset(buff,0,500);
 lcd_out(1,1,"restarting wifi");
 lcd_out(1,2,"please wait.....");

 uart1_write_at("AT");
 while( respons_success() !=OK);
 delay_ms(1000);
 lcd_cmd(_LCD_CLEAR);
lcd_out(1,1,"sending AT ");
 lcd_out(1,2,"please wait .....");
 uart1_write_at("AT");
 while( respons_success()!=OK);
 delay_ms(1000);

 lcd_cmd(_LCD_CLEAR);


 lcd_out(1,1,"DISCONNECTING WIFI");
 lcd_out(1,2,"please wait .....");
 uart1_write_at("AT+CWQAP");
 while( respons_success()!=OK);
 delay_ms(1000);

 lcd_cmd(_LCD_CLEAR);

 lcd_out(1,1,"SETTING MODE");
 lcd_out(1,2,"please wait .....");
 uart1_write_at("AT+CWMODE=3");
 while( respons_success()!=OK);
 delay_ms(1000);

 lcd_cmd(_LCD_CLEAR);
 lcd_out(1,1,"SETTING CONNECTION ");
 lcd_out(1,2,"please wait .....");
 uart1_write_at("AT+CIPMUX=1");
 while( respons_success()!=OK);
 delay_ms(1000);

 lcd_cmd(_LCD_CLEAR);

 while(1){
 lcd_out(1,1,"connecting to AP");
 UART1_Write_Text("AT+CWJAP");
 UART1_Write('"');
 UART1_Write_Text(SSID);
 UART1_Write('"');
 UART1_Write(',');
 UART1_Write_Text(password);
 UART1_Write('"');
 new_line();
 if( respons_success()!=OK){
 lcd_out(1,2,"success");
 break;

 }
 else{
 lcd_cmd(_LCD_CLEAR);
 lcd_out(1,1,"try agine");
 delay_ms(1000);

 }

 }
 lcd_cmd(_LCD_CLEAR);
 lcd_out(1,1,"check connection ");
 UART1_Write_Text("AT+CWJAP=?");
 while( respons_success()!=OK);
 LCD_OUT(1,2,"WIFI CONNECTED");
 delay_ms(1000);


 lcd_cmd(_LCD_CLEAR);
 lcd_out(1,1,"configure tcp server");
 UART1_Write_Text("AT+CIPSEVER=1");
 UART1_Write(',');
 UART1_Write_Text(port);
 new_line();
 while( respons_success()!=OK);
 reset_buff();
 get_ip_mac();

 }

 void interrupt_config(){
 INTCON.GIE=1;
 INTCON.PEIE=1;
 PIE1.RCIE=1;
 }
void check_connection (){
 if (data_ready ==1){
 if ( find_text( buff ,"+IPD") ==1){
 uart1_write_at("AT+SIPSEND=0,29");
 delay_ms(1000);
 reset_buff();
 uart1_write_at("<h1>MOHAMED SAMY KASSEM</h1>");
 delay_ms(1000);
 reset_buff();
 uart1_write_at("AT+CIPCLOSE=0");
 delay_ms(1000);
 reset_buff();
 }


 }
 }
