
_main:

;my_project.c,5 :: 		void main() {
;my_project.c,6 :: 		int_pin();
	CALL        _int_pin+0, 0
;my_project.c,7 :: 		while(1){
L_main0:
;my_project.c,10 :: 		for(i=1 ; i < 10 ; i++){
	MOVLW       1
	MOVWF       main_i_L1+0 
	MOVLW       0
	MOVWF       main_i_L1+1 
L_main2:
	MOVLW       128
	XORWF       main_i_L1+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       10
	SUBWF       main_i_L1+0, 0 
L__main10:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;my_project.c,11 :: 		for( j=0 ; j<10 ;j++){
	CLRF        main_j_L1+0 
	CLRF        main_j_L1+1 
L_main5:
	MOVLW       128
	XORWF       main_j_L1+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       10
	SUBWF       main_j_L1+0, 0 
L__main11:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;my_project.c,12 :: 		portc=(j<<0);
	MOVF        main_j_L1+0, 0 
	MOVWF       PORTC+0 
;my_project.c,13 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;my_project.c,11 :: 		for( j=0 ; j<10 ;j++){
	INFSNZ      main_j_L1+0, 1 
	INCF        main_j_L1+1, 1 
;my_project.c,14 :: 		}
	GOTO        L_main5
L_main6:
;my_project.c,15 :: 		portd=(i<<0);
	MOVF        main_i_L1+0, 0 
	MOVWF       PORTD+0 
;my_project.c,10 :: 		for(i=1 ; i < 10 ; i++){
	INFSNZ      main_i_L1+0, 1 
	INCF        main_i_L1+1, 1 
;my_project.c,17 :: 		}
	GOTO        L_main2
L_main3:
;my_project.c,20 :: 		}
	GOTO        L_main0
;my_project.c,21 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_int_pin:

;my_project.c,23 :: 		void int_pin(){
;my_project.c,24 :: 		portc=0;
	CLRF        PORTC+0 
;my_project.c,25 :: 		trisc=0;
	CLRF        TRISC+0 
;my_project.c,26 :: 		portd= 0;
	CLRF        PORTD+0 
;my_project.c,27 :: 		trisd=0;
	CLRF        TRISD+0 
;my_project.c,29 :: 		}
L_end_int_pin:
	RETURN      0
; end of _int_pin
