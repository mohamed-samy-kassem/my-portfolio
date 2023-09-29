#define el portc.b0
#define l portc.b1
#define r portc.b2
#define er portc.b3   // 4 # DEFINE FOR THE line tracking sensor

#define  IN1  PORTD.B1
#define   IN2  PORTD.B2
#define   IN3 PORTD.B3
#define   IN4  PORTD.B4
#define   IN5  PORTD.B5
#define   IN6  PORTD.B6
#define   IN7  PORTD.B7
#define   IN8  PORTD.B0




int room1=0;
int ox=0; int oy=0;     // original point
int target_x=0; int target_y=0;  // target poit will be change by wifi module webpage
int x,y =0 ;  // number itersectiion which the robot move on them
int left,right,ex_left,ex_right;

int start_flage, intersection_flage,  flage3 ;
int mark1 , mark2=0;
int poss=0; // postion for the inter section points
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
 void  change_orintation() ;
 void excute_x() ;
 void excute_y_negative ();
 void excute_x_negative();
void main() {
   trisc.b0=1;  trisc.b1=1; trisc.b2=1; trisc.b3=1;
    while(1){
    // get_xy();

     moving_robot();
    }

}
/*void get_xy(){
  target_x=1;
  target_y=2;

}*/
void get_sensor_value(){
  el= ex_left;
  l=  left;
  r=  right;
  er= ex_right;


}
void moving_exactly_on_track (){
     if ( left==1 && right==1 && ex_left==1 && ex_right ==1){
        if(start_flage==0){
     // roboot will be turn on and move forward the frist moving
          start_flage=1;
        }
         // roboot_forward();
     }
      if(left==0  && right==1  && ex_left== 1  && ex_right== 1|| left== 1 && right== 1 && left==0&& ex_right==1  ){
       // robot_left (); // robot will move left

     }
        if(l==1  && r==0  && el== 1  && er==1 || l== 1 && r==1  && el== 1  && er==0  ){
         // robot_right(); // robot_will move right

     }
         if(l==0  && r==0  && el== 0  && er==0 && intersection_flage==0 ){
          // robot_off();  // robot will be off
           delay_ms(100);
           intersection_flage=1;
           if(x>0 && y<0 &&  mark1==1 ||x<0 && y>0 &&  mark1==1 ){
             poss--;
           }
             else if(x <0 && y<0 && mark2==1 || y<0 && x==0 || x<0 && y==0){
               poss--;
             }
             else poss++;
            // robot_forward();
         }
         if(el == 0 && er==0){
           intersection_flage=0;
         }

}
void moving_robot(){
       x=target_x-ox;
       y=target_y-oy;
       if ( x>0 && y >0 ){            // satate 1
            excute_y();
            change_orintation();      // right
            excute_x();
            change_orintation();   // to be fowward  left

       }
       else if( x<0 && y<0 ){         //satate 2
              mark2=1;
              get_sensor_value();
              excute_y_negative ();
               change_orintation();    // right
               excute_x_negative();
               change_orintation();   //right to be forward
               mark2=0 ;
       }
        else if( x==0 && y>0 ){        //satate 3
                get_sensor_value();
                  excute_y();
        
        
        }
           else if( x==0 && y<0 ){        //state 4
                get_sensor_value();
                  excute_y_negative ();
                

        }
           else if( x>0 && y==0 ){     // state 5
                   get_sensor_value();
                   change_orintation(); // right
                      excute_x();
                       change_orintation(); // left to be forward

        }
           else if( x<0 && y==0 ){       // satate 6
                    get_sensor_value();
                      change_orintation(); // left
                      excute_x_negative();
                        change_orintation(); //rigth to e forward
        }
           else if( x>0 && y<0 ){      // satate 7
                    get_sensor_value();
                      change_orintation(); // right
                      excute_x();
                      mark1=1;
                      change_orintation(); // right
                         excute_y_negative ();
                     change_orintation(); // 180 to be forward
                    mark1=0;


        }
           else if( x<0 && y>0 ){           //satte 8
                    get_sensor_value();
                      excute_y();
                      mark1=1;
                      change_orintation(); // right
                         excute_x_negative ();
                     change_orintation(); // right to be forward
                     mark1=0;



        }
       
}
void step_foward(){
      IN1=1;
      IN2=0;        //REVERS LOGIC TO BE FORWAED
      IN3=0;
      IN4=1;
      IN5=1;
      IN6=0;       /// REVERS LOGIC TO BE FOWARD
      IN7=0;
      IN8=1;

}


void roboot_forward(){
      IN1=1;
      IN2=0;        //REVERS LOGIC TO BE FORWAED
      IN3=0;
      IN4=1;
      IN5=1;
      IN6=0;       /// REVERS LOGIC TO BE FOWARD
      IN7=0;
      IN8=1;

}

void roboot_right(){
      IN1=1;
      IN2=0;        //REVERS LOGIC TO BE FORWAED
      IN3=1;
      IN4=0;
      IN5=1;
      IN6=0;       /// REVERS LOGIC TO BE FOWARD
      IN7=1;
      IN8=0;

}
void roboot_left(){
      IN1=0;
      IN2=1;        //REVERS LOGIC TO BE FORWAED
      IN3=0;
      IN4=1;
      IN5=0;
      IN6=1;       /// REVERS LOGIC TO BE FOWARD
      IN7=0;
      IN8=1;

}
void roboot_left_90(){
      IN1=0;
      IN2=1;        //REVERS LOGIC TO BE FORWAED
      IN3=0;
      IN4=1;
      IN5=0;
      IN6=1;       /// REVERS LOGIC TO BE FOWARD
      IN7=0;
      IN8=1;
      delay_ms(600);

}
void roboot_left_180(){
      IN1=0;
      IN2=1;        //REVERS LOGIC TO BE FORWAED
      IN3=0;
      IN4=1;
      IN5=0;
      IN6=1;       /// REVERS LOGIC TO BE FOWARD
      IN7=0;
      IN8=1;
      delay_ms(1200);

}
void roboot_right_90(){
      IN1=1;
      IN2=0;        //REVERS LOGIC TO BE FORWAED
      IN3=1;
      IN4=0;
      IN5=1;
      IN6=0;       /// REVERS LOGIC TO BE FOWARD
      IN7=1;
      IN8=0;
      delay_ms(600);

}
void roboot_right_180(){
      IN1=1;
      IN2=0;        //REVERS LOGIC TO BE FORWAED
      IN3=1;
      IN4=0;
      IN5=1;
      IN6=0;       /// REVERS LOGIC TO BE FOWARD
      IN7=1;
      IN8=0;
      delay_ms(1200);
}
 void roboot_off(){
      IN1=0;
      IN2=0;
      IN3=0;
      IN4=0;
      IN5=0;
      IN6=0;
      IN7=0;
      IN8=0;
 
 }
 void  change_orintation(){

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
  else if(  x==poss){
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
  

  

