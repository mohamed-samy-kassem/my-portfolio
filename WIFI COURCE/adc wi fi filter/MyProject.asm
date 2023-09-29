
_main:

;MyProject.c,23 :: 		void main() {
;MyProject.c,24 :: 		config();
	CALL        _config+0, 0
;MyProject.c,25 :: 		while(1){
L_main0:
;MyProject.c,26 :: 		val=  ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _val+0 
	MOVF        R1, 0 
	MOVWF       _val+1 
;MyProject.c,27 :: 		val2= ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _val2+0 
	MOVF        R1, 0 
	MOVWF       _val2+1 
;MyProject.c,28 :: 		send_data(val,val2,adc);
	MOVF        _val+0, 0 
	MOVWF       FARG_send_data_val+0 
	MOVF        _val+1, 0 
	MOVWF       FARG_send_data_val+1 
	MOVF        R0, 0 
	MOVWF       FARG_send_data_val2+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_val2+1 
	MOVLW       _adc+0
	MOVWF       FARG_send_data_adc+0 
	MOVLW       hi_addr(_adc+0)
	MOVWF       FARG_send_data_adc+1 
	CALL        _send_data+0, 0
;MyProject.c,30 :: 		}
	GOTO        L_main0
;MyProject.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_config:

;MyProject.c,32 :: 		void config(){
;MyProject.c,33 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,34 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,35 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,36 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,37 :: 		lcd_out(1,1,"hi mohamed");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,38 :: 		delay_ms(1000);
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
;MyProject.c,39 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,40 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,43 :: 		}
L_end_config:
	RETURN      0
; end of _config

_send_data:

;MyProject.c,44 :: 		void send_data(int val ,int val2,char *adc){
;MyProject.c,45 :: 		adc[0]  ='A';
	MOVFF       FARG_send_data_adc+0, FSR1
	MOVFF       FARG_send_data_adc+1, FSR1H
	MOVLW       65
	MOVWF       POSTINC1+0 
;MyProject.c,46 :: 		adc[1]  =(val/1000)+'0';
	MOVLW       1
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_send_data_val+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,47 :: 		adc[2] =(val/100)%10+'0';
	MOVLW       2
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_send_data_val+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,48 :: 		adc[3] =(val/10)%10+'0';
	MOVLW       3
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_send_data_val+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,49 :: 		adc[4] =(val%10)+'0';
	MOVLW       4
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_send_data_val+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,50 :: 		adc[5] ='B';
	MOVLW       5
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FSR1H 
	MOVLW       66
	MOVWF       POSTINC1+0 
;MyProject.c,51 :: 		adc[6]  ='C';
	MOVLW       6
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FSR1H 
	MOVLW       67
	MOVWF       POSTINC1+0 
;MyProject.c,52 :: 		adc[7]   = (val2/1000)+'0';
	MOVLW       7
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_send_data_val2+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val2+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,53 :: 		adc[8]  = (val2/100)%10+'0';
	MOVLW       8
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_send_data_val2+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val2+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,54 :: 		adc[9]  = (val2/10)%10+'0';
	MOVLW       9
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_send_data_val2+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val2+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,55 :: 		adc[10] = (val2%10)+'0';
	MOVLW       10
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FLOC__send_data+0 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FLOC__send_data+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_send_data_val2+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_val2+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__send_data+0, FSR1
	MOVFF       FLOC__send_data+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,56 :: 		adc[11]='D';
	MOVLW       11
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FSR1H 
	MOVLW       68
	MOVWF       POSTINC1+0 
;MyProject.c,57 :: 		adc[12]='O';
	MOVLW       12
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FSR1H 
	MOVLW       79
	MOVWF       POSTINC1+0 
;MyProject.c,58 :: 		adc[13]='K';
	MOVLW       13
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FSR1H 
	MOVLW       75
	MOVWF       POSTINC1+0 
;MyProject.c,59 :: 		adc[14]='\0';
	MOVLW       14
	ADDWF       FARG_send_data_adc+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_send_data_adc+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;MyProject.c,60 :: 		UART1_Write_Text(adc);
	MOVF        FARG_send_data_adc+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_send_data_adc+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,61 :: 		lcd_out(1,1,adc);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_send_data_adc+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_send_data_adc+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,62 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_send_data3:
	DECFSZ      R13, 1, 1
	BRA         L_send_data3
	DECFSZ      R12, 1, 1
	BRA         L_send_data3
	DECFSZ      R11, 1, 1
	BRA         L_send_data3
	NOP
;MyProject.c,65 :: 		}
L_end_send_data:
	RETURN      0
; end of _send_data
