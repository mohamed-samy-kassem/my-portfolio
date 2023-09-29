#line 1 "C:/Users/orginial pc/Desktop/WIFI COURCE/wifi confi/robot moving/MyProject.c"
#line 18 "C:/Users/orginial pc/Desktop/WIFI COURCE/wifi confi/robot moving/MyProject.c"
int room1=0;
int ox=0; int oy=0;
int target_x=0; int target_y=0;
int x,y =0 ;
int left,right,ex_left,ex_right;

int start_flage, intersection_flage, flage3 ;
int mark1 , mark2=0;
int poss=0;
int state=0;

void get_xy();
void get_sensor_value();
void moving_exactly_on_track ();
void moving_robot();
 void roboot_off() ;
 void roboot_right_180();
 void roboot_right_90();
 void roboot_left_180();
 void roboot_left_90();
 void roboot_right();
 void roboot_left();
 void roboot_forward();
 void excute_y() ;
 void change_orintation() ;
 void excute_x() ;
 void excute_y_negative ();
 void excute_x_negative();
void main() {
 trisc.b0=1; trisc.b1=1; trisc.b2=1; trisc.b3=1;
 while(1){


 moving_robot();
 }

}
#line 60 "C:/Users/orginial pc/Desktop/WIFI COURCE/wifi confi/robot moving/MyProject.c"
void get_sensor_value(){
  portc.b0 = ex_left;
  portc.b1 = left;
  portc.b2 = right;
  portc.b3 = ex_right;


}
void moving_exactly_on_track (){
 if ( left==1 && right==1 && ex_left==1 && ex_right ==1){
 if(start_flage==0){

 start_flage=1;
 }

 }
 if(left==0 && right==1 && ex_left== 1 && ex_right== 1|| left== 1 && right== 1 && left==0&& ex_right==1 ){


 }
 if( portc.b1 ==1 &&  portc.b2 ==0 &&  portc.b0 == 1 &&  portc.b3 ==1 ||  portc.b1 == 1 &&  portc.b2 ==1 &&  portc.b0 == 1 &&  portc.b3 ==0 ){


 }
 if( portc.b1 ==0 &&  portc.b2 ==0 &&  portc.b0 == 0 &&  portc.b3 ==0 && intersection_flage==0 ){

 delay_ms(100);
 intersection_flage=1;
 if(x>0 && y<0 && mark1==1 ||x<0 && y>0 && mark1==1 ){
 poss--;
 }
 else if(x <0 && y<0 && mark2==1 || y<0 && x==0 || x<0 && y==0){
 poss--;
 }
 else poss++;

 }
 if( portc.b0  == 0 &&  portc.b3 ==0){
 intersection_flage=0;
 }

}
void moving_robot(){
 x=target_x-ox;
 y=target_y-oy;
 if ( x>0 && y >0 ){
 excute_y();
 change_orintation();
 excute_x();
 change_orintation();

 }
 else if( x<0 && y<0 ){
 mark2=1;
 get_sensor_value();
 excute_y_negative ();
 change_orintation();
 excute_x_negative();
 change_orintation();
 mark2=0 ;
 }
 else if( x==0 && y>0 ){
 get_sensor_value();
 excute_y();


 }
 else if( x==0 && y<0 ){
 get_sensor_value();
 excute_y_negative ();


 }
 else if( x>0 && y==0 ){
 get_sensor_value();
 change_orintation();
 excute_x();
 change_orintation();

 }
 else if( x<0 && y==0 ){
 get_sensor_value();
 change_orintation();
 excute_x_negative();
 change_orintation();
 }
 else if( x>0 && y<0 ){
 get_sensor_value();
 change_orintation();
 excute_x();
 mark1=1;
 change_orintation();
 excute_y_negative ();
 change_orintation();
 mark1=0;


 }
 else if( x<0 && y>0 ){
 get_sensor_value();
 excute_y();
 mark1=1;
 change_orintation();
 excute_x_negative ();
 change_orintation();
 mark1=0;



 }

}
void step_foward(){
  PORTD.B1 =1;
  PORTD.B2 =0;
  PORTD.B3 =0;
  PORTD.B4 =1;
  PORTD.B5 =1;
  PORTD.B6 =0;
  PORTD.B7 =0;
  PORTD.B0 =1;

}


void roboot_forward(){
  PORTD.B1 =1;
  PORTD.B2 =0;
  PORTD.B3 =0;
  PORTD.B4 =1;
  PORTD.B5 =1;
  PORTD.B6 =0;
  PORTD.B7 =0;
  PORTD.B0 =1;

}

void roboot_right(){
  PORTD.B1 =1;
  PORTD.B2 =0;
  PORTD.B3 =1;
  PORTD.B4 =0;
  PORTD.B5 =1;
  PORTD.B6 =0;
  PORTD.B7 =1;
  PORTD.B0 =0;

}
void roboot_left(){
  PORTD.B1 =0;
  PORTD.B2 =1;
  PORTD.B3 =0;
  PORTD.B4 =1;
  PORTD.B5 =0;
  PORTD.B6 =1;
  PORTD.B7 =0;
  PORTD.B0 =1;

}
void roboot_left_90(){
  PORTD.B1 =0;
  PORTD.B2 =1;
  PORTD.B3 =0;
  PORTD.B4 =1;
  PORTD.B5 =0;
  PORTD.B6 =1;
  PORTD.B7 =0;
  PORTD.B0 =1;
 delay_ms(600);

}
void roboot_left_180(){
  PORTD.B1 =0;
  PORTD.B2 =1;
  PORTD.B3 =0;
  PORTD.B4 =1;
  PORTD.B5 =0;
  PORTD.B6 =1;
  PORTD.B7 =0;
  PORTD.B0 =1;
 delay_ms(1200);

}
void roboot_right_90(){
  PORTD.B1 =1;
  PORTD.B2 =0;
  PORTD.B3 =1;
  PORTD.B4 =0;
  PORTD.B5 =1;
  PORTD.B6 =0;
  PORTD.B7 =1;
  PORTD.B0 =0;
 delay_ms(600);

}
void roboot_right_180(){
  PORTD.B1 =1;
  PORTD.B2 =0;
  PORTD.B3 =1;
  PORTD.B4 =0;
  PORTD.B5 =1;
  PORTD.B6 =0;
  PORTD.B7 =1;
  PORTD.B0 =0;
 delay_ms(1200);
}
 void roboot_off(){
  PORTD.B1 =0;
  PORTD.B2 =0;
  PORTD.B3 =0;
  PORTD.B4 =0;
  PORTD.B5 =0;
  PORTD.B6 =0;
  PORTD.B7 =0;
  PORTD.B0 =0;

 }
 void change_orintation(){

 if(state==2){
 roboot_left_180();
 roboot_off();
 state=0;
 }
 else if(state==4){
 step_foward();
 roboot_left_90();
 roboot_off();
 state=0;
 }
 else if( state==3){
 step_foward();
 roboot_right_90();
 roboot_off();
 state=0;
 }

 }



 void excute_y(){
 loop1:
 if(y>poss){
 moving_exactly_on_track ();

 }
 else if (y==poss){
 roboot_off();
 poss=0;
 goto loop2;
 }
 goto loop1;
 loop2 :
 poss=0;

 }
 void excute_x(){
 loop1:
 if(x>poss){
 moving_exactly_on_track ();
 }
 else if( x==poss){
 roboot_off();
 poss=0;
 goto loop2;

 }
 goto loop1;
 loop2:
 poss=0;
 }
 void excute_y_negative (){
 loop1:
 if(y<poss){
 moving_exactly_on_track ();

 }
 else if (y==poss){
 roboot_off();
 poss=0;
 goto loop2;
 }
 goto loop1;
 loop2:
 poss=0;
 }
 void excute_x_negative (){
 loop1:
 if(x<poss){
 moving_exactly_on_track ();

 }
 else if (x==poss){
 roboot_off();
 poss=0;
 goto loop2;
 }
 goto loop1;
 loop2:
 poss=0;
 }
