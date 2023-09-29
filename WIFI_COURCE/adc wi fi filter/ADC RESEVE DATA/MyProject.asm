
_main:

;MyProject.c,20 :: 		void main() {
;MyProject.c,21 :: 		config();
	CALL        _config+0, 0
;MyProject.c,22 :: 		while(1){
L_main0:
;MyProject.c,23 :: 		if (UART1_Data_Ready() == 1) {          // if data is received
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;MyProject.c,24 :: 		UART1_Read_Text(val, "OK", 14);    // reads text until 'OK' is found
	MOVLW       _val+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_val+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       14
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;MyProject.c,25 :: 		get_string(val,"A",1,"B",0,adc1);
	MOVLW       _val+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_val+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       1
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _adc1+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_adc1+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,26 :: 		lcd_out(1,1,adc1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _adc1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_adc1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,27 :: 		get_string(val,"C",1,"D",0,adc2);
	MOVLW       _val+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_val+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       1
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _adc2+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_adc2+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,28 :: 		lcd_out(1,7,adc2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _adc2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_adc2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,30 :: 		}
L_main2:
;MyProject.c,32 :: 		}
	GOTO        L_main0
;MyProject.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_config:

;MyProject.c,34 :: 		void config(){
;MyProject.c,35 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,36 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,37 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,38 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,39 :: 		lcd_out(1,1,"wifi");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,40 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config3:
	DECFSZ      R13, 1, 1
	BRA         L_config3
	DECFSZ      R12, 1, 1
	BRA         L_config3
	DECFSZ      R11, 1, 1
	BRA         L_config3
	NOP
	NOP
;MyProject.c,41 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,42 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,43 :: 		}
L_end_config:
	RETURN      0
; end of _config

_get_string:

;MyProject.c,44 :: 		char get_string(char *string,char *from, char _from,char *to,char _to,char *get){
;MyProject.c,47 :: 		char lenght=0;
	CLRF        get_string_lenght_L0+0 
;MyProject.c,48 :: 		p1 = strstr(string,from)+ _from ;
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
;MyProject.c,50 :: 		p2= strstr(p1,to ) + _to;
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
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
;MyProject.c,51 :: 		lenght=p2-p1;
	MOVF        get_string_p1_L0+0, 0 
	SUBWF       R0, 1 
	MOVF        get_string_p1_L0+1, 0 
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	MOVWF       get_string_lenght_L0+0 
;MyProject.c,52 :: 		strncpy(get,p1,lenght);
	MOVF        FARG_get_string_get+0, 0 
	MOVWF       FARG_strncpy_to+0 
	MOVF        FARG_get_string_get+1, 0 
	MOVWF       FARG_strncpy_to+1 
	MOVF        get_string_p1_L0+0, 0 
	MOVWF       FARG_strncpy_from+0 
	MOVF        get_string_p1_L0+1, 0 
	MOVWF       FARG_strncpy_from+1 
	MOVF        R0, 0 
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;MyProject.c,53 :: 		get[lenght]='\0';
	MOVF        get_string_lenght_L0+0, 0 
	ADDWF       FARG_get_string_get+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_get_string_get+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;MyProject.c,54 :: 		}
L_end_get_string:
	RETURN      0
; end of _get_string
