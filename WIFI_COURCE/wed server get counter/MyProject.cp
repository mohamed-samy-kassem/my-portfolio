#line 1 "C:/Users/orginial pc/Desktop/WIFI COURCE/wed server get counter/MyProject.c"

sbit LCD_RS at Rc4_bit;
sbit LCD_EN at Rc5_bit;
sbit LCD_D7 at Rc3_bit;
sbit LCD_D6 at Rc2_bit;
sbit LCD_D5 at Rc1_bit;
sbit LCD_D4 at Rc0_bit;


sbit LCD_RS_Direction at TRISc4_bit;
sbit LCD_EN_Direction at TRISc5_bit;
sbit LCD_D7_Direction at TRISc3_bit;
sbit LCD_D6_Direction at TRISc2_bit;
sbit LCD_D5_Direction at TRISc1_bit;
sbit LCD_D4_Direction at TRISc0_bit;

 char buff[500];
 char data_ready ;
 unsigned int data_len ;
 char temp;

 const char ready=1;
 const char no_change=1;
 const char send_ready=1;
 const char ok=1;

 char APIP[30];

 char APMAC[30];

 char STAIP[30];

 char STAMAC[30];

 char SSID[]="M";
 char password[]="engofmicro01111986203";
 char port[]="80";


 char send_comand[20];
 char close_comand[20];
 char connection_id[6];
 unsigned int size_data;
 unsigned int counter ;
 char counter_text[6];
#line 50 "C:/Users/orginial pc/Desktop/WIFI COURCE/wed server get counter/MyProject.c"
const char webpage_text[]="<meta http-equiv=\"refresh\" content=\"10\"><html><body><h1>Counter Value = ";

const char webpage_text2[]= "</h1></body></html>";

char target_x[2];
char target_y[2];





 void config();
 void uart1_write_at(char *_data);
 void UART1_write_text_const(const char *_data);
 void UART1_write_data(char *_data);
 void new_line();
 void reset_buff();
 char get_string(char *string,char *from, char _from,char *to,char _to,char *get);
 char find_text ( char *string ,char *string_find );
 char respons_success();
 void get_ip_mac();
 void wifi_config ();
 void interrupt_config();
 void check_connection () ;
 void get_counter ();
 unsigned int get_size();
void get_send_comand (char *connection_id, unsigned int size_data ,char *send_comand);
void function();


void main() {
 config();
 wifi_config ();
 while(1){









 }
}
void config(){
 UART1_Init(115200);
 interrupt_config();
 Lcd_Init();
 LCD_CMD(_LCD_CURSOR_OFF);
 LCD_OUT(1,1,"WIFI config ");
 delay_ms(1000);
 lcd_cmd(_LCD_CLEAR);
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




}
char get_string(char *string,char *from, char _from,char *to,char _to,char *get){
 char *p1;
 char *p2;
 char lenght=0;
 p1 = strstr(string,from)+ _from ;

 p2= strstr(p1,to ) + _to;
 lenght=p2-p1;
strncpy(get,p1,lenght);
 get[lenght];
}
char find_text ( char *string ,char *string_find ){
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
char respons_success(){
 char result;
 while(!data_ready);
 if( find_text(buff,"ok")==1){result=ok;}
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
#line 219 "C:/Users/orginial pc/Desktop/WIFI COURCE/wed server get counter/MyProject.c"
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
 void interrupt(){
 INTCON.GIE=0;
 if( PIE1.RCIE==1){
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
 PIE1.RCIE=0;
 }
 INTCON.GIE=1;

 }
 void interrupt_config(){
 INTCON.GIE=1;
 INTCON.PEIE=1;
 PIE1.RCIE=1;
 }
 void check_connection (){
 if (data_ready ==1){
 if ( find_text( buff ,"+IPD") ==1){
#line 342 "C:/Users/orginial pc/Desktop/WIFI COURCE/wed server get counter/MyProject.c"
 function();
 }
 }
 }
unsigned int get_size(){
 unsigned int size_data=0;
 size_data = strlen(*webpage_text);
 size_data += strlen (connection_id);
 size_data += strlen(*webpage_text2);
 return size_data;
}
void get_counter (){
 if(counter <1000){
 counter++;
 }
 else
 counter=0;
 wordtostr (counter,counter_text);
 ltrim(counter_text);
 }
void get_send_comand (char *connection_id, unsigned int size_data ,char *send_comand){
 char size_data_text [10];
 wordtostr(size_data,size_data_text);
 ltrim(size_data_text);
 strcpy(send_comand,"AT+CIPSEND=");
 strcat(send_comand,connection_id);
 strcat(send_comand,",");
 strcat(send_comand,size_data_text);

}
void function()
{
#line 387 "C:/Users/orginial pc/Desktop/WIFI COURCE/wed server get counter/MyProject.c"
 get_string( buff,"FLOOR=",6,"&",0,target_x);
 lcd_out(1,1,target_x);
 get_string( buff,"ROOM=",5,"en",0,target_y);
 lcd_out(2,1,target_y);



}
