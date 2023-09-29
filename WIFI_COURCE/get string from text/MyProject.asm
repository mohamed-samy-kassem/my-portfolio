
_main:

;MyProject.c,22 :: 		void main() {
;MyProject.c,23 :: 		config();
	CALL        _config+0, 0
;MyProject.c,24 :: 		while(1){
L_main0:
;MyProject.c,25 :: 		get_string( string,"FLOOR=",6,"&",0,get);
	MOVLW       _string+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_string+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       6
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _get+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_get+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,26 :: 		lcd_out(1,1,get);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _get+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_get+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,27 :: 		get_string( string,"ROOM=",5,"en",0,get);
	MOVLW       _string+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_string+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       5
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _get+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_get+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,28 :: 		lcd_out(2,1,get);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _get+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_get+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,30 :: 		}
	GOTO        L_main0
;MyProject.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_config:

;MyProject.c,32 :: 		void config(){
;MyProject.c,33 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,34 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,35 :: 		LCD_OUT(1,1,"WIFI GET TEXT ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,36 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config2:
	DECFSZ      R13, 1, 1
	BRA         L_config2
	DECFSZ      R12, 1, 1
	BRA         L_config2
	DECFSZ      R11, 1, 1
	BRA         L_config2
	NOP
	NOP
;MyProject.c,37 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,38 :: 		}
L_end_config:
	RETURN      0
; end of _config

_get_string:

;MyProject.c,39 :: 		char get_string(char *string,char *from, char _from,char *to,char _to,char *get){
;MyProject.c,42 :: 		char lenght=0;
;MyProject.c,43 :: 		p1 = strstr(string,from)+ _from ;
	MOVF        FARG_get_string_string+0, 0 
	MOVWF       FARG_strstr_s1+0 
	MOVF        FARG_get_string_string+1, 0 
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_get_string_from+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_get_string_from+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        FARG_get_string__from+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       get_string_p1_L0+0 
	MOVF        R1, 0 
	MOVWF       get_string_p1_L0+1 
;MyProject.c,45 :: 		p2= strstr(p1,to ) + _to;
	MOVF        R0, 0 
	MOVWF       FARG_strstr_s1+0 
	MOVF        R1, 0 
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_get_string_to+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_get_string_to+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        FARG_get_string__to+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_strncpy_size+1 
;MyProject.c,46 :: 		lenght=p2-p1;
	MOVF        get_string_p1_L0+0, 0 
	SUBWF       FARG_strncpy_size+0, 1 
	MOVF        get_string_p1_L0+1, 0 
	SUBWFB      FARG_strncpy_size+1, 1 
;MyProject.c,48 :: 		strncpy(get,p1,lenght);
	MOVF        FARG_get_string_get+0, 0 
	MOVWF       FARG_strncpy_to+0 
	MOVF        FARG_get_string_get+1, 0 
	MOVWF       FARG_strncpy_to+1 
	MOVF        get_string_p1_L0+0, 0 
	MOVWF       FARG_strncpy_from+0 
	MOVF        get_string_p1_L0+1, 0 
	MOVWF       FARG_strncpy_from+1 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;MyProject.c,50 :: 		}
L_end_get_string:
	RETURN      0
; end of _get_string
