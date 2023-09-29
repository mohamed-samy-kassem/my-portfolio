
_main:

;MyProject.c,6 :: 		void main() {
;MyProject.c,7 :: 		config();
	CALL        _config+0, 0
;MyProject.c,8 :: 		while(1){
L_main0:
;MyProject.c,9 :: 		if (find_text ( response_mse ,"sam" )==1){
	MOVLW       _response_mse+0
	MOVWF       FARG_find_text_string+0 
	MOVLW       hi_addr(_response_mse+0)
	MOVWF       FARG_find_text_string+1 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_find_text_string_find+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_find_text_string_find+1 
	CALL        _find_text+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       1
	XORWF       R0, 0 
L__main12:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;MyProject.c,10 :: 		portc.b0=1 ;
	BSF         PORTC+0, 0 
;MyProject.c,11 :: 		}
	GOTO        L_main3
L_main2:
;MyProject.c,13 :: 		portc.b0=0;
	BCF         PORTC+0, 0 
;MyProject.c,14 :: 		}
L_main3:
;MyProject.c,16 :: 		}
	GOTO        L_main0
;MyProject.c,18 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_config:

;MyProject.c,19 :: 		void config (){
;MyProject.c,21 :: 		trisc.b0=0;
	BCF         TRISC+0, 0 
;MyProject.c,22 :: 		portc.b0=0;
	BCF         PORTC+0, 0 
;MyProject.c,24 :: 		}
L_end_config:
	RETURN      0
; end of _config

_find_text:

;MyProject.c,25 :: 		int find_text ( char *string ,char *string_find ){
;MyProject.c,26 :: 		unsigned int matched =0;
	CLRF        find_text_matched_L0+0 
	CLRF        find_text_matched_L0+1 
	CLRF        find_text_index_string_L0+0 
	CLRF        find_text_index_string_L0+1 
	CLRF        find_text_length_string_find_L0+0 
	CLRF        find_text_length_string_find_L0+1 
	CLRF        find_text_length_string_L0+0 
	CLRF        find_text_length_string_L0+1 
;MyProject.c,32 :: 		length_string_find = strlen(string_find );
	MOVF        FARG_find_text_string_find+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_find_text_string_find+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       find_text_length_string_find_L0+0 
	MOVF        R1, 0 
	MOVWF       find_text_length_string_find_L0+1 
;MyProject.c,33 :: 		length_string = strlen( string);
	MOVF        FARG_find_text_string+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_find_text_string+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       find_text_length_string_L0+0 
	MOVF        R1, 0 
	MOVWF       find_text_length_string_L0+1 
;MyProject.c,34 :: 		if(   length_string_find> length_string){
	MOVF        find_text_length_string_find_L0+1, 0 
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__find_text15
	MOVF        find_text_length_string_find_L0+0, 0 
	SUBWF       R0, 0 
L__find_text15:
	BTFSC       STATUS+0, 0 
	GOTO        L_find_text4
;MyProject.c,35 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_find_text
;MyProject.c,36 :: 		}
L_find_text4:
;MyProject.c,37 :: 		for (index_string;index_string <length_string; index_string++){
L_find_text5:
	MOVF        find_text_length_string_L0+1, 0 
	SUBWF       find_text_index_string_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__find_text16
	MOVF        find_text_length_string_L0+0, 0 
	SUBWF       find_text_index_string_L0+0, 0 
L__find_text16:
	BTFSC       STATUS+0, 0 
	GOTO        L_find_text6
;MyProject.c,38 :: 		if(string[index_string]==string_find[matched]){
	MOVF        find_text_index_string_L0+0, 0 
	ADDWF       FARG_find_text_string+0, 0 
	MOVWF       FSR0 
	MOVF        find_text_index_string_L0+1, 0 
	ADDWFC      FARG_find_text_string+1, 0 
	MOVWF       FSR0H 
	MOVF        find_text_matched_L0+0, 0 
	ADDWF       FARG_find_text_string_find+0, 0 
	MOVWF       FSR2 
	MOVF        find_text_matched_L0+1, 0 
	ADDWFC      FARG_find_text_string_find+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_find_text8
;MyProject.c,39 :: 		matched++ ;
	INFSNZ      find_text_matched_L0+0, 1 
	INCF        find_text_matched_L0+1, 1 
;MyProject.c,40 :: 		if(length_string_find==matched ){
	MOVF        find_text_length_string_find_L0+1, 0 
	XORWF       find_text_matched_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__find_text17
	MOVF        find_text_matched_L0+0, 0 
	XORWF       find_text_length_string_find_L0+0, 0 
L__find_text17:
	BTFSS       STATUS+0, 2 
	GOTO        L_find_text9
;MyProject.c,41 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_find_text
;MyProject.c,42 :: 		}
L_find_text9:
;MyProject.c,43 :: 		}
	GOTO        L_find_text10
L_find_text8:
;MyProject.c,45 :: 		matched=0;
	CLRF        find_text_matched_L0+0 
	CLRF        find_text_matched_L0+1 
;MyProject.c,46 :: 		}
L_find_text10:
;MyProject.c,37 :: 		for (index_string;index_string <length_string; index_string++){
	INFSNZ      find_text_index_string_L0+0, 1 
	INCF        find_text_index_string_L0+1, 1 
;MyProject.c,47 :: 		}
	GOTO        L_find_text5
L_find_text6:
;MyProject.c,48 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;MyProject.c,52 :: 		}
L_end_find_text:
	RETURN      0
; end of _find_text
