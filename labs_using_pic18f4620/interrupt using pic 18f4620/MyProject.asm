
_interrupt:

;MyProject.c,10 :: 		void interrupt(){
;MyProject.c,11 :: 		if(INTCON.B1){
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;MyProject.c,12 :: 		portc.b0 =~ portc.b0 ;
	BTG         PORTC+0, 0 
;MyProject.c,13 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;MyProject.c,14 :: 		INTCON.B1=0;
	BCF         INTCON+0, 1 
;MyProject.c,15 :: 		}
L_interrupt0:
;MyProject.c,16 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,20 :: 		void main() {
;MyProject.c,21 :: 		setup_pin();
	CALL        _setup_pin+0, 0
;MyProject.c,22 :: 		interrupt_init();
	CALL        _interrupt_init+0, 0
;MyProject.c,23 :: 		while(1){
L_main2:
;MyProject.c,24 :: 		portc.b1 =~ portc.b1;
	BTG         PORTC+0, 1 
;MyProject.c,25 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;MyProject.c,26 :: 		}
	GOTO        L_main2
;MyProject.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setup_pin:

;MyProject.c,31 :: 		void setup_pin(){
;MyProject.c,32 :: 		trisc.b0= 0 ;
	BCF         TRISC+0, 0 
;MyProject.c,33 :: 		portc.b0= 0;
	BCF         PORTC+0, 0 
;MyProject.c,35 :: 		trisc.b1= 0 ;
	BCF         TRISC+0, 1 
;MyProject.c,36 :: 		portc.b1= 0;
	BCF         PORTC+0, 1 
;MyProject.c,37 :: 		}
L_end_setup_pin:
	RETURN      0
; end of _setup_pin

_interrupt_init:

;MyProject.c,41 :: 		void interrupt_init(){
;MyProject.c,42 :: 		ADCON1=0b00001111;
	MOVLW       15
	MOVWF       ADCON1+0 
;MyProject.c,43 :: 		trisb.b0=1 ;
	BSF         TRISB+0, 0 
;MyProject.c,45 :: 		INTCON.B7=1;   // glopal interrupt
	BSF         INTCON+0, 7 
;MyProject.c,46 :: 		INTCON.B6=1;
	BSF         INTCON+0, 6 
;MyProject.c,48 :: 		INTCON2.B6=1;      //RISIG EDG
	BSF         INTCON2+0, 6 
;MyProject.c,49 :: 		INTCON2.B7=1;
	BSF         INTCON2+0, 7 
;MyProject.c,50 :: 		INTCON.B4=1;          //ENABLE
	BSF         INTCON+0, 4 
;MyProject.c,52 :: 		}
L_end_interrupt_init:
	RETURN      0
; end of _interrupt_init
