
_main:

;MyProject.c,46 :: 		void main() {
;MyProject.c,47 :: 		trisc.b0=1;  trisc.b1=1; trisc.b2=1; trisc.b3=1;
	BSF         TRISC+0, 0 
	BSF         TRISC+0, 1 
	BSF         TRISC+0, 2 
	BSF         TRISC+0, 3 
;MyProject.c,48 :: 		while(1){
L_main0:
;MyProject.c,51 :: 		moving_robot();
	CALL        _moving_robot+0, 0
;MyProject.c,52 :: 		}
	GOTO        L_main0
;MyProject.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_get_sensor_value:

;MyProject.c,60 :: 		void get_sensor_value(){
;MyProject.c,61 :: 		el= ex_left;
	BTFSC       _ex_left+0, 0 
	GOTO        L__get_sensor_value123
	BCF         PORTC+0, 0 
	GOTO        L__get_sensor_value124
L__get_sensor_value123:
	BSF         PORTC+0, 0 
L__get_sensor_value124:
;MyProject.c,62 :: 		l=  left;
	BTFSC       _left+0, 0 
	GOTO        L__get_sensor_value125
	BCF         PORTC+0, 1 
	GOTO        L__get_sensor_value126
L__get_sensor_value125:
	BSF         PORTC+0, 1 
L__get_sensor_value126:
;MyProject.c,63 :: 		r=  right;
	BTFSC       _right+0, 0 
	GOTO        L__get_sensor_value127
	BCF         PORTC+0, 2 
	GOTO        L__get_sensor_value128
L__get_sensor_value127:
	BSF         PORTC+0, 2 
L__get_sensor_value128:
;MyProject.c,64 :: 		er= ex_right;
	BTFSC       _ex_right+0, 0 
	GOTO        L__get_sensor_value129
	BCF         PORTC+0, 3 
	GOTO        L__get_sensor_value130
L__get_sensor_value129:
	BSF         PORTC+0, 3 
L__get_sensor_value130:
;MyProject.c,67 :: 		}
L_end_get_sensor_value:
	RETURN      0
; end of _get_sensor_value

_moving_exactly_on_track:

;MyProject.c,68 :: 		void moving_exactly_on_track (){
;MyProject.c,69 :: 		if ( left==1 && right==1 && ex_left==1 && ex_right ==1){
	MOVLW       0
	XORWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track132
	MOVLW       1
	XORWF       _left+0, 0 
L__moving_exactly_on_track132:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_exactly_on_track4
	MOVLW       0
	XORWF       _right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track133
	MOVLW       1
	XORWF       _right+0, 0 
L__moving_exactly_on_track133:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_exactly_on_track4
	MOVLW       0
	XORWF       _ex_left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track134
	MOVLW       1
	XORWF       _ex_left+0, 0 
L__moving_exactly_on_track134:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_exactly_on_track4
	MOVLW       0
	XORWF       _ex_right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track135
	MOVLW       1
	XORWF       _ex_right+0, 0 
L__moving_exactly_on_track135:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_exactly_on_track4
L__moving_exactly_on_track112:
;MyProject.c,70 :: 		if(start_flage==0){
	MOVLW       0
	XORWF       _start_flage+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track136
	MOVLW       0
	XORWF       _start_flage+0, 0 
L__moving_exactly_on_track136:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_exactly_on_track5
;MyProject.c,72 :: 		start_flage=1;
	MOVLW       1
	MOVWF       _start_flage+0 
	MOVLW       0
	MOVWF       _start_flage+1 
;MyProject.c,73 :: 		}
L_moving_exactly_on_track5:
;MyProject.c,75 :: 		}
L_moving_exactly_on_track4:
;MyProject.c,76 :: 		if(left==0  && right==1  && ex_left== 1  && ex_right== 1|| left== 1 && right== 1 && left==0&& ex_right==1  ){
	MOVLW       0
	XORWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track137
	MOVLW       0
	XORWF       _left+0, 0 
L__moving_exactly_on_track137:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track111
	MOVLW       0
	XORWF       _right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track138
	MOVLW       1
	XORWF       _right+0, 0 
L__moving_exactly_on_track138:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track111
	MOVLW       0
	XORWF       _ex_left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track139
	MOVLW       1
	XORWF       _ex_left+0, 0 
L__moving_exactly_on_track139:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track111
	MOVLW       0
	XORWF       _ex_right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track140
	MOVLW       1
	XORWF       _ex_right+0, 0 
L__moving_exactly_on_track140:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track111
	GOTO        L__moving_exactly_on_track109
L__moving_exactly_on_track111:
	MOVLW       0
	XORWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track141
	MOVLW       1
	XORWF       _left+0, 0 
L__moving_exactly_on_track141:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track110
	MOVLW       0
	XORWF       _right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track142
	MOVLW       1
	XORWF       _right+0, 0 
L__moving_exactly_on_track142:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track110
	MOVLW       0
	XORWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track143
	MOVLW       0
	XORWF       _left+0, 0 
L__moving_exactly_on_track143:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track110
	MOVLW       0
	XORWF       _ex_right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track144
	MOVLW       1
	XORWF       _ex_right+0, 0 
L__moving_exactly_on_track144:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track110
	GOTO        L__moving_exactly_on_track109
L__moving_exactly_on_track110:
	GOTO        L_moving_exactly_on_track12
L__moving_exactly_on_track109:
;MyProject.c,79 :: 		}
L_moving_exactly_on_track12:
;MyProject.c,80 :: 		if(l==1  && r==0  && el== 1  && er==1 || l== 1 && r==1  && el== 1  && er==0  ){
	BTFSS       PORTC+0, 1 
	GOTO        L__moving_exactly_on_track108
	BTFSC       PORTC+0, 2 
	GOTO        L__moving_exactly_on_track108
	BTFSS       PORTC+0, 0 
	GOTO        L__moving_exactly_on_track108
	BTFSS       PORTC+0, 3 
	GOTO        L__moving_exactly_on_track108
	GOTO        L__moving_exactly_on_track106
L__moving_exactly_on_track108:
	BTFSS       PORTC+0, 1 
	GOTO        L__moving_exactly_on_track107
	BTFSS       PORTC+0, 2 
	GOTO        L__moving_exactly_on_track107
	BTFSS       PORTC+0, 0 
	GOTO        L__moving_exactly_on_track107
	BTFSC       PORTC+0, 3 
	GOTO        L__moving_exactly_on_track107
	GOTO        L__moving_exactly_on_track106
L__moving_exactly_on_track107:
	GOTO        L_moving_exactly_on_track19
L__moving_exactly_on_track106:
;MyProject.c,83 :: 		}
L_moving_exactly_on_track19:
;MyProject.c,84 :: 		if(l==0  && r==0  && el== 0  && er==0 && intersection_flage==0 ){
	BTFSC       PORTC+0, 1 
	GOTO        L_moving_exactly_on_track22
	BTFSC       PORTC+0, 2 
	GOTO        L_moving_exactly_on_track22
	BTFSC       PORTC+0, 0 
	GOTO        L_moving_exactly_on_track22
	BTFSC       PORTC+0, 3 
	GOTO        L_moving_exactly_on_track22
	MOVLW       0
	XORWF       _intersection_flage+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track145
	MOVLW       0
	XORWF       _intersection_flage+0, 0 
L__moving_exactly_on_track145:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_exactly_on_track22
L__moving_exactly_on_track105:
;MyProject.c,86 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_moving_exactly_on_track23:
	DECFSZ      R13, 1, 1
	BRA         L_moving_exactly_on_track23
	DECFSZ      R12, 1, 1
	BRA         L_moving_exactly_on_track23
	DECFSZ      R11, 1, 1
	BRA         L_moving_exactly_on_track23
	NOP
;MyProject.c,87 :: 		intersection_flage=1;
	MOVLW       1
	MOVWF       _intersection_flage+0 
	MOVLW       0
	MOVWF       _intersection_flage+1 
;MyProject.c,88 :: 		if(x>0 && y<0 &&  mark1==1 ||x<0 && y>0 &&  mark1==1 ){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _x+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track146
	MOVF        _x+0, 0 
	SUBLW       0
L__moving_exactly_on_track146:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track104
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track147
	MOVLW       0
	SUBWF       _y+0, 0 
L__moving_exactly_on_track147:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track104
	MOVLW       0
	XORWF       _mark1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track148
	MOVLW       1
	XORWF       _mark1+0, 0 
L__moving_exactly_on_track148:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track104
	GOTO        L__moving_exactly_on_track102
L__moving_exactly_on_track104:
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track149
	MOVLW       0
	SUBWF       _x+0, 0 
L__moving_exactly_on_track149:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track103
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _y+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track150
	MOVF        _y+0, 0 
	SUBLW       0
L__moving_exactly_on_track150:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track103
	MOVLW       0
	XORWF       _mark1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track151
	MOVLW       1
	XORWF       _mark1+0, 0 
L__moving_exactly_on_track151:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track103
	GOTO        L__moving_exactly_on_track102
L__moving_exactly_on_track103:
	GOTO        L_moving_exactly_on_track30
L__moving_exactly_on_track102:
;MyProject.c,89 :: 		poss--;
	MOVLW       1
	SUBWF       _poss+0, 1 
	MOVLW       0
	SUBWFB      _poss+1, 1 
;MyProject.c,90 :: 		}
	GOTO        L_moving_exactly_on_track31
L_moving_exactly_on_track30:
;MyProject.c,91 :: 		else if(x <0 && y<0 && mark2==1 || y<0 && x==0 || x<0 && y==0){
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track152
	MOVLW       0
	SUBWF       _x+0, 0 
L__moving_exactly_on_track152:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track101
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track153
	MOVLW       0
	SUBWF       _y+0, 0 
L__moving_exactly_on_track153:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track101
	MOVLW       0
	XORWF       _mark2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track154
	MOVLW       1
	XORWF       _mark2+0, 0 
L__moving_exactly_on_track154:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track101
	GOTO        L__moving_exactly_on_track98
L__moving_exactly_on_track101:
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track155
	MOVLW       0
	SUBWF       _y+0, 0 
L__moving_exactly_on_track155:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track100
	MOVLW       0
	XORWF       _x+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track156
	MOVLW       0
	XORWF       _x+0, 0 
L__moving_exactly_on_track156:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track100
	GOTO        L__moving_exactly_on_track98
L__moving_exactly_on_track100:
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track157
	MOVLW       0
	SUBWF       _x+0, 0 
L__moving_exactly_on_track157:
	BTFSC       STATUS+0, 0 
	GOTO        L__moving_exactly_on_track99
	MOVLW       0
	XORWF       _y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track158
	MOVLW       0
	XORWF       _y+0, 0 
L__moving_exactly_on_track158:
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_exactly_on_track99
	GOTO        L__moving_exactly_on_track98
L__moving_exactly_on_track99:
	GOTO        L_moving_exactly_on_track40
L__moving_exactly_on_track98:
;MyProject.c,92 :: 		poss--;
	MOVLW       1
	SUBWF       _poss+0, 1 
	MOVLW       0
	SUBWFB      _poss+1, 1 
;MyProject.c,93 :: 		}
	GOTO        L_moving_exactly_on_track41
L_moving_exactly_on_track40:
;MyProject.c,94 :: 		else poss++;
	INFSNZ      _poss+0, 1 
	INCF        _poss+1, 1 
L_moving_exactly_on_track41:
L_moving_exactly_on_track31:
;MyProject.c,96 :: 		}
L_moving_exactly_on_track22:
;MyProject.c,97 :: 		if(el == 0 && er==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_moving_exactly_on_track44
	BTFSC       PORTC+0, 3 
	GOTO        L_moving_exactly_on_track44
L__moving_exactly_on_track97:
;MyProject.c,98 :: 		intersection_flage=0;
	CLRF        _intersection_flage+0 
	CLRF        _intersection_flage+1 
;MyProject.c,99 :: 		}
L_moving_exactly_on_track44:
;MyProject.c,101 :: 		}
L_end_moving_exactly_on_track:
	RETURN      0
; end of _moving_exactly_on_track

_moving_robot:

;MyProject.c,102 :: 		void moving_robot(){
;MyProject.c,103 :: 		x=target_x-ox;
	MOVF        _ox+0, 0 
	SUBWF       _target_x+0, 0 
	MOVWF       R1 
	MOVF        _ox+1, 0 
	SUBWFB      _target_x+1, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       _x+0 
	MOVF        R2, 0 
	MOVWF       _x+1 
;MyProject.c,104 :: 		y=target_y-oy;
	MOVF        _oy+0, 0 
	SUBWF       _target_y+0, 0 
	MOVWF       _y+0 
	MOVF        _oy+1, 0 
	SUBWFB      _target_y+1, 0 
	MOVWF       _y+1 
;MyProject.c,105 :: 		if ( x>0 && y >0 ){            // satate 1
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot160
	MOVF        R1, 0 
	SUBLW       0
L__moving_robot160:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot47
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _y+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot161
	MOVF        _y+0, 0 
	SUBLW       0
L__moving_robot161:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot47
L__moving_robot120:
;MyProject.c,106 :: 		excute_y();
	CALL        _excute_y+0, 0
;MyProject.c,107 :: 		change_orintation();      // right
	CALL        _change_orintation+0, 0
;MyProject.c,108 :: 		excute_x();
	CALL        _excute_x+0, 0
;MyProject.c,109 :: 		change_orintation();   // to be fowward  left
	CALL        _change_orintation+0, 0
;MyProject.c,111 :: 		}
	GOTO        L_moving_robot48
L_moving_robot47:
;MyProject.c,112 :: 		else if( x<0 && y<0 ){         //satate 2
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot162
	MOVLW       0
	SUBWF       _x+0, 0 
L__moving_robot162:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot51
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot163
	MOVLW       0
	SUBWF       _y+0, 0 
L__moving_robot163:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot51
L__moving_robot119:
;MyProject.c,113 :: 		mark2=1;
	MOVLW       1
	MOVWF       _mark2+0 
	MOVLW       0
	MOVWF       _mark2+1 
;MyProject.c,114 :: 		get_sensor_value();
	CALL        _get_sensor_value+0, 0
;MyProject.c,115 :: 		excute_y_negative ();
	CALL        _excute_y_negative+0, 0
;MyProject.c,116 :: 		change_orintation();    // right
	CALL        _change_orintation+0, 0
;MyProject.c,117 :: 		excute_x_negative();
	CALL        _excute_x_negative+0, 0
;MyProject.c,118 :: 		change_orintation();   //right to be forward
	CALL        _change_orintation+0, 0
;MyProject.c,119 :: 		mark2=0 ;
	CLRF        _mark2+0 
	CLRF        _mark2+1 
;MyProject.c,120 :: 		}
	GOTO        L_moving_robot52
L_moving_robot51:
;MyProject.c,121 :: 		else if( x==0 && y>0 ){        //satate 3
	MOVLW       0
	XORWF       _x+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot164
	MOVLW       0
	XORWF       _x+0, 0 
L__moving_robot164:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_robot55
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _y+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot165
	MOVF        _y+0, 0 
	SUBLW       0
L__moving_robot165:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot55
L__moving_robot118:
;MyProject.c,122 :: 		get_sensor_value();
	CALL        _get_sensor_value+0, 0
;MyProject.c,123 :: 		excute_y();
	CALL        _excute_y+0, 0
;MyProject.c,126 :: 		}
	GOTO        L_moving_robot56
L_moving_robot55:
;MyProject.c,127 :: 		else if( x==0 && y<0 ){        //state 4
	MOVLW       0
	XORWF       _x+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot166
	MOVLW       0
	XORWF       _x+0, 0 
L__moving_robot166:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_robot59
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot167
	MOVLW       0
	SUBWF       _y+0, 0 
L__moving_robot167:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot59
L__moving_robot117:
;MyProject.c,128 :: 		get_sensor_value();
	CALL        _get_sensor_value+0, 0
;MyProject.c,129 :: 		excute_y_negative ();
	CALL        _excute_y_negative+0, 0
;MyProject.c,132 :: 		}
	GOTO        L_moving_robot60
L_moving_robot59:
;MyProject.c,133 :: 		else if( x>0 && y==0 ){     // state 5
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _x+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot168
	MOVF        _x+0, 0 
	SUBLW       0
L__moving_robot168:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot63
	MOVLW       0
	XORWF       _y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot169
	MOVLW       0
	XORWF       _y+0, 0 
L__moving_robot169:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_robot63
L__moving_robot116:
;MyProject.c,134 :: 		get_sensor_value();
	CALL        _get_sensor_value+0, 0
;MyProject.c,135 :: 		change_orintation(); // right
	CALL        _change_orintation+0, 0
;MyProject.c,136 :: 		excute_x();
	CALL        _excute_x+0, 0
;MyProject.c,137 :: 		change_orintation(); // left to be forward
	CALL        _change_orintation+0, 0
;MyProject.c,139 :: 		}
	GOTO        L_moving_robot64
L_moving_robot63:
;MyProject.c,140 :: 		else if( x<0 && y==0 ){       // satate 6
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot170
	MOVLW       0
	SUBWF       _x+0, 0 
L__moving_robot170:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot67
	MOVLW       0
	XORWF       _y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot171
	MOVLW       0
	XORWF       _y+0, 0 
L__moving_robot171:
	BTFSS       STATUS+0, 2 
	GOTO        L_moving_robot67
L__moving_robot115:
;MyProject.c,141 :: 		get_sensor_value();
	CALL        _get_sensor_value+0, 0
;MyProject.c,142 :: 		change_orintation(); // left
	CALL        _change_orintation+0, 0
;MyProject.c,143 :: 		excute_x_negative();
	CALL        _excute_x_negative+0, 0
;MyProject.c,144 :: 		change_orintation(); //rigth to e forward
	CALL        _change_orintation+0, 0
;MyProject.c,145 :: 		}
	GOTO        L_moving_robot68
L_moving_robot67:
;MyProject.c,146 :: 		else if( x>0 && y<0 ){      // satate 7
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _x+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot172
	MOVF        _x+0, 0 
	SUBLW       0
L__moving_robot172:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot71
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot173
	MOVLW       0
	SUBWF       _y+0, 0 
L__moving_robot173:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot71
L__moving_robot114:
;MyProject.c,147 :: 		get_sensor_value();
	CALL        _get_sensor_value+0, 0
;MyProject.c,148 :: 		change_orintation(); // right
	CALL        _change_orintation+0, 0
;MyProject.c,149 :: 		excute_x();
	CALL        _excute_x+0, 0
;MyProject.c,150 :: 		mark1=1;
	MOVLW       1
	MOVWF       _mark1+0 
	MOVLW       0
	MOVWF       _mark1+1 
;MyProject.c,151 :: 		change_orintation(); // right
	CALL        _change_orintation+0, 0
;MyProject.c,152 :: 		excute_y_negative ();
	CALL        _excute_y_negative+0, 0
;MyProject.c,153 :: 		change_orintation(); // 180 to be forward
	CALL        _change_orintation+0, 0
;MyProject.c,154 :: 		mark1=0;
	CLRF        _mark1+0 
	CLRF        _mark1+1 
;MyProject.c,157 :: 		}
	GOTO        L_moving_robot72
L_moving_robot71:
;MyProject.c,158 :: 		else if( x<0 && y>0 ){           //satte 8
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot174
	MOVLW       0
	SUBWF       _x+0, 0 
L__moving_robot174:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot75
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _y+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__moving_robot175
	MOVF        _y+0, 0 
	SUBLW       0
L__moving_robot175:
	BTFSC       STATUS+0, 0 
	GOTO        L_moving_robot75
L__moving_robot113:
;MyProject.c,159 :: 		get_sensor_value();
	CALL        _get_sensor_value+0, 0
;MyProject.c,160 :: 		excute_y();
	CALL        _excute_y+0, 0
;MyProject.c,161 :: 		mark1=1;
	MOVLW       1
	MOVWF       _mark1+0 
	MOVLW       0
	MOVWF       _mark1+1 
;MyProject.c,162 :: 		change_orintation(); // right
	CALL        _change_orintation+0, 0
;MyProject.c,163 :: 		excute_x_negative ();
	CALL        _excute_x_negative+0, 0
;MyProject.c,164 :: 		change_orintation(); // right to be forward
	CALL        _change_orintation+0, 0
;MyProject.c,165 :: 		mark1=0;
	CLRF        _mark1+0 
	CLRF        _mark1+1 
;MyProject.c,169 :: 		}
L_moving_robot75:
L_moving_robot72:
L_moving_robot68:
L_moving_robot64:
L_moving_robot60:
L_moving_robot56:
L_moving_robot52:
L_moving_robot48:
;MyProject.c,171 :: 		}
L_end_moving_robot:
	RETURN      0
; end of _moving_robot

_step_foward:

;MyProject.c,172 :: 		void step_foward(){
;MyProject.c,173 :: 		IN1=1;
	BSF         PORTD+0, 1 
;MyProject.c,174 :: 		IN2=0;        //REVERS LOGIC TO BE FORWAED
	BCF         PORTD+0, 2 
;MyProject.c,175 :: 		IN3=0;
	BCF         PORTD+0, 3 
;MyProject.c,176 :: 		IN4=1;
	BSF         PORTD+0, 4 
;MyProject.c,177 :: 		IN5=1;
	BSF         PORTD+0, 5 
;MyProject.c,178 :: 		IN6=0;       /// REVERS LOGIC TO BE FOWARD
	BCF         PORTD+0, 6 
;MyProject.c,179 :: 		IN7=0;
	BCF         PORTD+0, 7 
;MyProject.c,180 :: 		IN8=1;
	BSF         PORTD+0, 0 
;MyProject.c,182 :: 		}
L_end_step_foward:
	RETURN      0
; end of _step_foward

_roboot_forward:

;MyProject.c,185 :: 		void roboot_forward(){
;MyProject.c,186 :: 		IN1=1;
	BSF         PORTD+0, 1 
;MyProject.c,187 :: 		IN2=0;        //REVERS LOGIC TO BE FORWAED
	BCF         PORTD+0, 2 
;MyProject.c,188 :: 		IN3=0;
	BCF         PORTD+0, 3 
;MyProject.c,189 :: 		IN4=1;
	BSF         PORTD+0, 4 
;MyProject.c,190 :: 		IN5=1;
	BSF         PORTD+0, 5 
;MyProject.c,191 :: 		IN6=0;       /// REVERS LOGIC TO BE FOWARD
	BCF         PORTD+0, 6 
;MyProject.c,192 :: 		IN7=0;
	BCF         PORTD+0, 7 
;MyProject.c,193 :: 		IN8=1;
	BSF         PORTD+0, 0 
;MyProject.c,195 :: 		}
L_end_roboot_forward:
	RETURN      0
; end of _roboot_forward

_roboot_right:

;MyProject.c,197 :: 		void roboot_right(){
;MyProject.c,198 :: 		IN1=1;
	BSF         PORTD+0, 1 
;MyProject.c,199 :: 		IN2=0;        //REVERS LOGIC TO BE FORWAED
	BCF         PORTD+0, 2 
;MyProject.c,200 :: 		IN3=1;
	BSF         PORTD+0, 3 
;MyProject.c,201 :: 		IN4=0;
	BCF         PORTD+0, 4 
;MyProject.c,202 :: 		IN5=1;
	BSF         PORTD+0, 5 
;MyProject.c,203 :: 		IN6=0;       /// REVERS LOGIC TO BE FOWARD
	BCF         PORTD+0, 6 
;MyProject.c,204 :: 		IN7=1;
	BSF         PORTD+0, 7 
;MyProject.c,205 :: 		IN8=0;
	BCF         PORTD+0, 0 
;MyProject.c,207 :: 		}
L_end_roboot_right:
	RETURN      0
; end of _roboot_right

_roboot_left:

;MyProject.c,208 :: 		void roboot_left(){
;MyProject.c,209 :: 		IN1=0;
	BCF         PORTD+0, 1 
;MyProject.c,210 :: 		IN2=1;        //REVERS LOGIC TO BE FORWAED
	BSF         PORTD+0, 2 
;MyProject.c,211 :: 		IN3=0;
	BCF         PORTD+0, 3 
;MyProject.c,212 :: 		IN4=1;
	BSF         PORTD+0, 4 
;MyProject.c,213 :: 		IN5=0;
	BCF         PORTD+0, 5 
;MyProject.c,214 :: 		IN6=1;       /// REVERS LOGIC TO BE FOWARD
	BSF         PORTD+0, 6 
;MyProject.c,215 :: 		IN7=0;
	BCF         PORTD+0, 7 
;MyProject.c,216 :: 		IN8=1;
	BSF         PORTD+0, 0 
;MyProject.c,218 :: 		}
L_end_roboot_left:
	RETURN      0
; end of _roboot_left

_roboot_left_90:

;MyProject.c,219 :: 		void roboot_left_90(){
;MyProject.c,220 :: 		IN1=0;
	BCF         PORTD+0, 1 
;MyProject.c,221 :: 		IN2=1;        //REVERS LOGIC TO BE FORWAED
	BSF         PORTD+0, 2 
;MyProject.c,222 :: 		IN3=0;
	BCF         PORTD+0, 3 
;MyProject.c,223 :: 		IN4=1;
	BSF         PORTD+0, 4 
;MyProject.c,224 :: 		IN5=0;
	BCF         PORTD+0, 5 
;MyProject.c,225 :: 		IN6=1;       /// REVERS LOGIC TO BE FOWARD
	BSF         PORTD+0, 6 
;MyProject.c,226 :: 		IN7=0;
	BCF         PORTD+0, 7 
;MyProject.c,227 :: 		IN8=1;
	BSF         PORTD+0, 0 
;MyProject.c,228 :: 		delay_ms(600);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_roboot_left_9076:
	DECFSZ      R13, 1, 1
	BRA         L_roboot_left_9076
	DECFSZ      R12, 1, 1
	BRA         L_roboot_left_9076
	DECFSZ      R11, 1, 1
	BRA         L_roboot_left_9076
	NOP
;MyProject.c,230 :: 		}
L_end_roboot_left_90:
	RETURN      0
; end of _roboot_left_90

_roboot_left_180:

;MyProject.c,231 :: 		void roboot_left_180(){
;MyProject.c,232 :: 		IN1=0;
	BCF         PORTD+0, 1 
;MyProject.c,233 :: 		IN2=1;        //REVERS LOGIC TO BE FORWAED
	BSF         PORTD+0, 2 
;MyProject.c,234 :: 		IN3=0;
	BCF         PORTD+0, 3 
;MyProject.c,235 :: 		IN4=1;
	BSF         PORTD+0, 4 
;MyProject.c,236 :: 		IN5=0;
	BCF         PORTD+0, 5 
;MyProject.c,237 :: 		IN6=1;       /// REVERS LOGIC TO BE FOWARD
	BSF         PORTD+0, 6 
;MyProject.c,238 :: 		IN7=0;
	BCF         PORTD+0, 7 
;MyProject.c,239 :: 		IN8=1;
	BSF         PORTD+0, 0 
;MyProject.c,240 :: 		delay_ms(1200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_roboot_left_18077:
	DECFSZ      R13, 1, 1
	BRA         L_roboot_left_18077
	DECFSZ      R12, 1, 1
	BRA         L_roboot_left_18077
	DECFSZ      R11, 1, 1
	BRA         L_roboot_left_18077
	NOP
	NOP
;MyProject.c,242 :: 		}
L_end_roboot_left_180:
	RETURN      0
; end of _roboot_left_180

_roboot_right_90:

;MyProject.c,243 :: 		void roboot_right_90(){
;MyProject.c,244 :: 		IN1=1;
	BSF         PORTD+0, 1 
;MyProject.c,245 :: 		IN2=0;        //REVERS LOGIC TO BE FORWAED
	BCF         PORTD+0, 2 
;MyProject.c,246 :: 		IN3=1;
	BSF         PORTD+0, 3 
;MyProject.c,247 :: 		IN4=0;
	BCF         PORTD+0, 4 
;MyProject.c,248 :: 		IN5=1;
	BSF         PORTD+0, 5 
;MyProject.c,249 :: 		IN6=0;       /// REVERS LOGIC TO BE FOWARD
	BCF         PORTD+0, 6 
;MyProject.c,250 :: 		IN7=1;
	BSF         PORTD+0, 7 
;MyProject.c,251 :: 		IN8=0;
	BCF         PORTD+0, 0 
;MyProject.c,252 :: 		delay_ms(600);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_roboot_right_9078:
	DECFSZ      R13, 1, 1
	BRA         L_roboot_right_9078
	DECFSZ      R12, 1, 1
	BRA         L_roboot_right_9078
	DECFSZ      R11, 1, 1
	BRA         L_roboot_right_9078
	NOP
;MyProject.c,254 :: 		}
L_end_roboot_right_90:
	RETURN      0
; end of _roboot_right_90

_roboot_right_180:

;MyProject.c,255 :: 		void roboot_right_180(){
;MyProject.c,256 :: 		IN1=1;
	BSF         PORTD+0, 1 
;MyProject.c,257 :: 		IN2=0;        //REVERS LOGIC TO BE FORWAED
	BCF         PORTD+0, 2 
;MyProject.c,258 :: 		IN3=1;
	BSF         PORTD+0, 3 
;MyProject.c,259 :: 		IN4=0;
	BCF         PORTD+0, 4 
;MyProject.c,260 :: 		IN5=1;
	BSF         PORTD+0, 5 
;MyProject.c,261 :: 		IN6=0;       /// REVERS LOGIC TO BE FOWARD
	BCF         PORTD+0, 6 
;MyProject.c,262 :: 		IN7=1;
	BSF         PORTD+0, 7 
;MyProject.c,263 :: 		IN8=0;
	BCF         PORTD+0, 0 
;MyProject.c,264 :: 		delay_ms(1200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_roboot_right_18079:
	DECFSZ      R13, 1, 1
	BRA         L_roboot_right_18079
	DECFSZ      R12, 1, 1
	BRA         L_roboot_right_18079
	DECFSZ      R11, 1, 1
	BRA         L_roboot_right_18079
	NOP
	NOP
;MyProject.c,265 :: 		}
L_end_roboot_right_180:
	RETURN      0
; end of _roboot_right_180

_roboot_off:

;MyProject.c,266 :: 		void roboot_off(){
;MyProject.c,267 :: 		IN1=0;
	BCF         PORTD+0, 1 
;MyProject.c,268 :: 		IN2=0;
	BCF         PORTD+0, 2 
;MyProject.c,269 :: 		IN3=0;
	BCF         PORTD+0, 3 
;MyProject.c,270 :: 		IN4=0;
	BCF         PORTD+0, 4 
;MyProject.c,271 :: 		IN5=0;
	BCF         PORTD+0, 5 
;MyProject.c,272 :: 		IN6=0;
	BCF         PORTD+0, 6 
;MyProject.c,273 :: 		IN7=0;
	BCF         PORTD+0, 7 
;MyProject.c,274 :: 		IN8=0;
	BCF         PORTD+0, 0 
;MyProject.c,276 :: 		}
L_end_roboot_off:
	RETURN      0
; end of _roboot_off

_change_orintation:

;MyProject.c,277 :: 		void  change_orintation(){
;MyProject.c,279 :: 		if(state==2){
	MOVLW       0
	XORWF       _state+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__change_orintation186
	MOVLW       2
	XORWF       _state+0, 0 
L__change_orintation186:
	BTFSS       STATUS+0, 2 
	GOTO        L_change_orintation80
;MyProject.c,280 :: 		roboot_left_180();
	CALL        _roboot_left_180+0, 0
;MyProject.c,281 :: 		roboot_off();
	CALL        _roboot_off+0, 0
;MyProject.c,282 :: 		state=0;
	CLRF        _state+0 
	CLRF        _state+1 
;MyProject.c,283 :: 		}
	GOTO        L_change_orintation81
L_change_orintation80:
;MyProject.c,284 :: 		else if(state==4){
	MOVLW       0
	XORWF       _state+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__change_orintation187
	MOVLW       4
	XORWF       _state+0, 0 
L__change_orintation187:
	BTFSS       STATUS+0, 2 
	GOTO        L_change_orintation82
;MyProject.c,285 :: 		step_foward();
	CALL        _step_foward+0, 0
;MyProject.c,286 :: 		roboot_left_90();
	CALL        _roboot_left_90+0, 0
;MyProject.c,287 :: 		roboot_off();
	CALL        _roboot_off+0, 0
;MyProject.c,288 :: 		state=0;
	CLRF        _state+0 
	CLRF        _state+1 
;MyProject.c,289 :: 		}
	GOTO        L_change_orintation83
L_change_orintation82:
;MyProject.c,290 :: 		else if( state==3){
	MOVLW       0
	XORWF       _state+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__change_orintation188
	MOVLW       3
	XORWF       _state+0, 0 
L__change_orintation188:
	BTFSS       STATUS+0, 2 
	GOTO        L_change_orintation84
;MyProject.c,291 :: 		step_foward();
	CALL        _step_foward+0, 0
;MyProject.c,292 :: 		roboot_right_90();
	CALL        _roboot_right_90+0, 0
;MyProject.c,293 :: 		roboot_off();
	CALL        _roboot_off+0, 0
;MyProject.c,294 :: 		state=0;
	CLRF        _state+0 
	CLRF        _state+1 
;MyProject.c,295 :: 		}
L_change_orintation84:
L_change_orintation83:
L_change_orintation81:
;MyProject.c,297 :: 		}
L_end_change_orintation:
	RETURN      0
; end of _change_orintation

_excute_y:

;MyProject.c,301 :: 		void excute_y(){
;MyProject.c,302 :: 		loop1:
___excute_y_loop1:
;MyProject.c,303 :: 		if(y>poss){
	MOVLW       128
	XORWF       _poss+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _y+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_y190
	MOVF        _y+0, 0 
	SUBWF       _poss+0, 0 
L__excute_y190:
	BTFSC       STATUS+0, 0 
	GOTO        L_excute_y85
;MyProject.c,304 :: 		moving_exactly_on_track ();
	CALL        _moving_exactly_on_track+0, 0
;MyProject.c,306 :: 		}
	GOTO        L_excute_y86
L_excute_y85:
;MyProject.c,307 :: 		else if (y==poss){
	MOVF        _y+1, 0 
	XORWF       _poss+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_y191
	MOVF        _poss+0, 0 
	XORWF       _y+0, 0 
L__excute_y191:
	BTFSS       STATUS+0, 2 
	GOTO        L_excute_y87
;MyProject.c,308 :: 		roboot_off();
	CALL        _roboot_off+0, 0
;MyProject.c,309 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,310 :: 		goto loop2;
	GOTO        ___excute_y_loop2
;MyProject.c,311 :: 		}
L_excute_y87:
L_excute_y86:
;MyProject.c,312 :: 		goto loop1;
	GOTO        ___excute_y_loop1
;MyProject.c,313 :: 		loop2 :
___excute_y_loop2:
;MyProject.c,314 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,316 :: 		}
L_end_excute_y:
	RETURN      0
; end of _excute_y

_excute_x:

;MyProject.c,317 :: 		void excute_x(){
;MyProject.c,318 :: 		loop1:
___excute_x_loop1:
;MyProject.c,319 :: 		if(x>poss){
	MOVLW       128
	XORWF       _poss+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _x+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_x193
	MOVF        _x+0, 0 
	SUBWF       _poss+0, 0 
L__excute_x193:
	BTFSC       STATUS+0, 0 
	GOTO        L_excute_x88
;MyProject.c,320 :: 		moving_exactly_on_track ();
	CALL        _moving_exactly_on_track+0, 0
;MyProject.c,321 :: 		}
	GOTO        L_excute_x89
L_excute_x88:
;MyProject.c,322 :: 		else if(  x==poss){
	MOVF        _x+1, 0 
	XORWF       _poss+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_x194
	MOVF        _poss+0, 0 
	XORWF       _x+0, 0 
L__excute_x194:
	BTFSS       STATUS+0, 2 
	GOTO        L_excute_x90
;MyProject.c,323 :: 		roboot_off();
	CALL        _roboot_off+0, 0
;MyProject.c,324 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,325 :: 		goto loop2;
	GOTO        ___excute_x_loop2
;MyProject.c,327 :: 		}
L_excute_x90:
L_excute_x89:
;MyProject.c,328 :: 		goto loop1;
	GOTO        ___excute_x_loop1
;MyProject.c,329 :: 		loop2:
___excute_x_loop2:
;MyProject.c,330 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,331 :: 		}
L_end_excute_x:
	RETURN      0
; end of _excute_x

_excute_y_negative:

;MyProject.c,332 :: 		void excute_y_negative (){
;MyProject.c,333 :: 		loop1:
___excute_y_negative_loop1:
;MyProject.c,334 :: 		if(y<poss){
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _poss+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_y_negative196
	MOVF        _poss+0, 0 
	SUBWF       _y+0, 0 
L__excute_y_negative196:
	BTFSC       STATUS+0, 0 
	GOTO        L_excute_y_negative91
;MyProject.c,335 :: 		moving_exactly_on_track ();
	CALL        _moving_exactly_on_track+0, 0
;MyProject.c,337 :: 		}
	GOTO        L_excute_y_negative92
L_excute_y_negative91:
;MyProject.c,338 :: 		else if (y==poss){
	MOVF        _y+1, 0 
	XORWF       _poss+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_y_negative197
	MOVF        _poss+0, 0 
	XORWF       _y+0, 0 
L__excute_y_negative197:
	BTFSS       STATUS+0, 2 
	GOTO        L_excute_y_negative93
;MyProject.c,339 :: 		roboot_off();
	CALL        _roboot_off+0, 0
;MyProject.c,340 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,341 :: 		goto loop2;
	GOTO        ___excute_y_negative_loop2
;MyProject.c,342 :: 		}
L_excute_y_negative93:
L_excute_y_negative92:
;MyProject.c,343 :: 		goto loop1;
	GOTO        ___excute_y_negative_loop1
;MyProject.c,344 :: 		loop2:
___excute_y_negative_loop2:
;MyProject.c,345 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,346 :: 		}
L_end_excute_y_negative:
	RETURN      0
; end of _excute_y_negative

_excute_x_negative:

;MyProject.c,347 :: 		void excute_x_negative (){
;MyProject.c,348 :: 		loop1:
___excute_x_negative_loop1:
;MyProject.c,349 :: 		if(x<poss){
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _poss+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_x_negative199
	MOVF        _poss+0, 0 
	SUBWF       _x+0, 0 
L__excute_x_negative199:
	BTFSC       STATUS+0, 0 
	GOTO        L_excute_x_negative94
;MyProject.c,350 :: 		moving_exactly_on_track ();
	CALL        _moving_exactly_on_track+0, 0
;MyProject.c,352 :: 		}
	GOTO        L_excute_x_negative95
L_excute_x_negative94:
;MyProject.c,353 :: 		else if (x==poss){
	MOVF        _x+1, 0 
	XORWF       _poss+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__excute_x_negative200
	MOVF        _poss+0, 0 
	XORWF       _x+0, 0 
L__excute_x_negative200:
	BTFSS       STATUS+0, 2 
	GOTO        L_excute_x_negative96
;MyProject.c,354 :: 		roboot_off();
	CALL        _roboot_off+0, 0
;MyProject.c,355 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,356 :: 		goto loop2;
	GOTO        ___excute_x_negative_loop2
;MyProject.c,357 :: 		}
L_excute_x_negative96:
L_excute_x_negative95:
;MyProject.c,358 :: 		goto loop1;
	GOTO        ___excute_x_negative_loop1
;MyProject.c,359 :: 		loop2:
___excute_x_negative_loop2:
;MyProject.c,360 :: 		poss=0;
	CLRF        _poss+0 
	CLRF        _poss+1 
;MyProject.c,361 :: 		}
L_end_excute_x_negative:
	RETURN      0
; end of _excute_x_negative
