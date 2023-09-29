
_interrupt:

;MyProject.c,70 :: 		void interrupt(){
;MyProject.c,71 :: 		INTCON.GIE=0;
	BCF         INTCON+0, 7 
;MyProject.c,72 :: 		if( PIR1.RCIF==1){
	BTFSS       PIR1+0, 5 
	GOTO        L_interrupt0
;MyProject.c,73 :: 		temp= UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
;MyProject.c,74 :: 		switch(temp){
	GOTO        L_interrupt1
;MyProject.c,75 :: 		case LF:
L_interrupt3:
;MyProject.c,76 :: 		if(data_len >1){
	MOVLW       0
	MOVWF       R0 
	MOVF        _data_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt66
	MOVF        _data_len+0, 0 
	SUBLW       1
L__interrupt66:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt4
;MyProject.c,77 :: 		data ready=1;
;MyProject.c,78 :: 		}
L_interrupt4:
;MyProject.c,79 :: 		break;
	GOTO        L_interrupt2
;MyProject.c,80 :: 		case CR:
L_interrupt5:
;MyProject.c,81 :: 		buff[data_len]=0;
	MOVLW       _buff+0
	ADDWF       _data_len+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_buff+0)
	ADDWFC      _data_len+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;MyProject.c,82 :: 		break;
	GOTO        L_interrupt2
;MyProject.c,83 :: 		default:
L_interrupt6:
;MyProject.c,84 :: 		buff[data_len]=temp ;
	MOVLW       _buff+0
	ADDWF       _data_len+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_buff+0)
	ADDWFC      _data_len+1, 0 
	MOVWF       FSR1L+1 
	MOVF        _temp+0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,85 :: 		data_len++;
	INFSNZ      _data_len+0, 1 
	INCF        _data_len+1, 1 
;MyProject.c,86 :: 		}
	GOTO        L_interrupt2
L_interrupt1:
	MOVF        _temp+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt3
	MOVF        _temp+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt5
	GOTO        L_interrupt6
L_interrupt2:
;MyProject.c,87 :: 		PIR1.RCIF=0;
	BCF         PIR1+0, 5 
;MyProject.c,88 :: 		}
L_interrupt0:
;MyProject.c,89 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;MyProject.c,91 :: 		}
L_end_interrupt:
L__interrupt65:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,92 :: 		void main() {
;MyProject.c,93 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,94 :: 		while(1){
L_main7:
;MyProject.c,97 :: 		UART1_write_text_const(AT_CIPSTART);
	MOVLW       _AT_CIPSTART+0
	MOVWF       FARG_UART1_write_text_const__data+0 
	MOVLW       hi_addr(_AT_CIPSTART+0)
	MOVWF       FARG_UART1_write_text_const__data+1 
	MOVLW       higher_addr(_AT_CIPSTART+0)
	MOVWF       FARG_UART1_write_text_const__data+2 
	CALL        _UART1_write_text_const+0, 0
;MyProject.c,98 :: 		new_line();
	CALL        _new_line+0, 0
;MyProject.c,122 :: 		delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;MyProject.c,125 :: 		}
	GOTO        L_main7
;MyProject.c,126 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_config:

;MyProject.c,127 :: 		void config(){
;MyProject.c,128 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,129 :: 		interrupt_config();
	CALL        _interrupt_config+0, 0
;MyProject.c,135 :: 		trisd.B0=0;    // tihs pin is an output pin for reset wifi
	BCF         TRISD+0, 0 
;MyProject.c,137 :: 		}
L_end_config:
	RETURN      0
; end of _config

_uart1_write_at:

;MyProject.c,138 :: 		void uart1_write_at(char *_data){
;MyProject.c,139 :: 		UART1_write_Text(_data);
	MOVF        FARG_uart1_write_at__data+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_uart1_write_at__data+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,140 :: 		UART1_write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,141 :: 		UART1_write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,142 :: 		}
L_end_uart1_write_at:
	RETURN      0
; end of _uart1_write_at

_UART1_write_text_const:

;MyProject.c,144 :: 		void UART1_write_text_const(const char *_data){
;MyProject.c,145 :: 		while(*_data){
L_UART1_write_text_const10:
	MOVF        FARG_UART1_write_text_const__data+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_UART1_write_text_const__data+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_UART1_write_text_const__data+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UART1_write_text_const11
;MyProject.c,146 :: 		UART1_write(*_data++);
	MOVF        FARG_UART1_write_text_const__data+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_UART1_write_text_const__data+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_UART1_write_text_const__data+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_UART1_Write_data_+0
	CALL        _UART1_Write+0, 0
	MOVLW       1
	ADDWF       FARG_UART1_write_text_const__data+0, 1 
	MOVLW       0
	ADDWFC      FARG_UART1_write_text_const__data+1, 1 
	ADDWFC      FARG_UART1_write_text_const__data+2, 1 
;MyProject.c,147 :: 		}
	GOTO        L_UART1_write_text_const10
L_UART1_write_text_const11:
;MyProject.c,149 :: 		}
L_end_UART1_write_text_const:
	RETURN      0
; end of _UART1_write_text_const

_UART1_write_data:

;MyProject.c,150 :: 		void UART1_write_data(char *_data){
;MyProject.c,151 :: 		while(*_data){
L_UART1_write_data12:
	MOVFF       FARG_UART1_write_data__data+0, FSR0L+0
	MOVFF       FARG_UART1_write_data__data+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UART1_write_data13
;MyProject.c,152 :: 		UART1_write(*_data++);
	MOVFF       FARG_UART1_write_data__data+0, FSR0L+0
	MOVFF       FARG_UART1_write_data__data+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	INFSNZ      FARG_UART1_write_data__data+0, 1 
	INCF        FARG_UART1_write_data__data+1, 1 
;MyProject.c,154 :: 		}
	GOTO        L_UART1_write_data12
L_UART1_write_data13:
;MyProject.c,156 :: 		}
L_end_UART1_write_data:
	RETURN      0
; end of _UART1_write_data

_new_line:

;MyProject.c,157 :: 		void new_line(){
;MyProject.c,158 :: 		UART1_write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,159 :: 		UART1_write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,161 :: 		}
L_end_new_line:
	RETURN      0
; end of _new_line

_reset_buff:

;MyProject.c,162 :: 		void reset_buff(){
;MyProject.c,163 :: 		memset(buff,0,data_len);
	MOVLW       _buff+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVF        _data_len+0, 0 
	MOVWF       FARG_memset_n+0 
	MOVF        _data_len+1, 0 
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;MyProject.c,164 :: 		data_ready=0;
	CLRF        _data_ready+0 
;MyProject.c,165 :: 		data_len=0;
	CLRF        _data_len+0 
	CLRF        _data_len+1 
;MyProject.c,166 :: 		}
L_end_reset_buff:
	RETURN      0
; end of _reset_buff

_reset_wifi:

;MyProject.c,167 :: 		void reset_wifi(){
;MyProject.c,169 :: 		portd.b0=1;
	BSF         PORTD+0, 0 
;MyProject.c,171 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_reset_wifi14:
	DECFSZ      R13, 1, 1
	BRA         L_reset_wifi14
	DECFSZ      R12, 1, 1
	BRA         L_reset_wifi14
	DECFSZ      R11, 1, 1
	BRA         L_reset_wifi14
	NOP
	NOP
;MyProject.c,173 :: 		portd.b0=0;
	BCF         PORTD+0, 0 
;MyProject.c,174 :: 		}
L_end_reset_wifi:
	RETURN      0
; end of _reset_wifi

_find_text:

;MyProject.c,186 :: 		int find_text ( char *string ,char *string_find ){
;MyProject.c,187 :: 		unsigned int matched =0;
	CLRF        find_text_matched_L0+0 
	CLRF        find_text_matched_L0+1 
	CLRF        find_text_index_string_L0+0 
	CLRF        find_text_index_string_L0+1 
	CLRF        find_text_length_string_find_L0+0 
	CLRF        find_text_length_string_find_L0+1 
	CLRF        find_text_length_string_L0+0 
	CLRF        find_text_length_string_L0+1 
;MyProject.c,193 :: 		length_string_find = strlen(string_find );
	MOVF        FARG_find_text_string_find+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_find_text_string_find+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       find_text_length_string_find_L0+0 
	MOVF        R1, 0 
	MOVWF       find_text_length_string_find_L0+1 
;MyProject.c,194 :: 		length_string = strlen( string);
	MOVF        FARG_find_text_string+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_find_text_string+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       find_text_length_string_L0+0 
	MOVF        R1, 0 
	MOVWF       find_text_length_string_L0+1 
;MyProject.c,195 :: 		if(   length_string_find> length_string){
	MOVF        find_text_length_string_find_L0+1, 0 
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__find_text76
	MOVF        find_text_length_string_find_L0+0, 0 
	SUBWF       R0, 0 
L__find_text76:
	BTFSC       STATUS+0, 0 
	GOTO        L_find_text15
;MyProject.c,196 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_find_text
;MyProject.c,197 :: 		}
L_find_text15:
;MyProject.c,198 :: 		for (index_string;index_string <length_string; index_string++){
L_find_text16:
	MOVF        find_text_length_string_L0+1, 0 
	SUBWF       find_text_index_string_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__find_text77
	MOVF        find_text_length_string_L0+0, 0 
	SUBWF       find_text_index_string_L0+0, 0 
L__find_text77:
	BTFSC       STATUS+0, 0 
	GOTO        L_find_text17
;MyProject.c,199 :: 		if(string[index_string]==string_find[matched]){
	MOVF        find_text_index_string_L0+0, 0 
	ADDWF       FARG_find_text_string+0, 0 
	MOVWF       FSR0L+0 
	MOVF        find_text_index_string_L0+1, 0 
	ADDWFC      FARG_find_text_string+1, 0 
	MOVWF       FSR0L+1 
	MOVF        find_text_matched_L0+0, 0 
	ADDWF       FARG_find_text_string_find+0, 0 
	MOVWF       FSR2L+0 
	MOVF        find_text_matched_L0+1, 0 
	ADDWFC      FARG_find_text_string_find+1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_find_text19
;MyProject.c,200 :: 		matched++ ;
	INFSNZ      find_text_matched_L0+0, 1 
	INCF        find_text_matched_L0+1, 1 
;MyProject.c,201 :: 		if(length_string_find==matched ){
	MOVF        find_text_length_string_find_L0+1, 0 
	XORWF       find_text_matched_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__find_text78
	MOVF        find_text_matched_L0+0, 0 
	XORWF       find_text_length_string_find_L0+0, 0 
L__find_text78:
	BTFSS       STATUS+0, 2 
	GOTO        L_find_text20
;MyProject.c,202 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_find_text
;MyProject.c,203 :: 		}
L_find_text20:
;MyProject.c,204 :: 		}
	GOTO        L_find_text21
L_find_text19:
;MyProject.c,206 :: 		matched=0;
	CLRF        find_text_matched_L0+0 
	CLRF        find_text_matched_L0+1 
;MyProject.c,207 :: 		}
L_find_text21:
;MyProject.c,198 :: 		for (index_string;index_string <length_string; index_string++){
	INFSNZ      find_text_index_string_L0+0, 1 
	INCF        find_text_index_string_L0+1, 1 
;MyProject.c,209 :: 		}
	GOTO        L_find_text16
L_find_text17:
;MyProject.c,210 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;MyProject.c,212 :: 		}
L_end_find_text:
	RETURN      0
; end of _find_text

_respons_success:

;MyProject.c,213 :: 		int respons_success(){
;MyProject.c,215 :: 		while(!data_ready);
L_respons_success22:
	MOVF        _data_ready+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_respons_success23
	GOTO        L_respons_success22
L_respons_success23:
;MyProject.c,216 :: 		if( find_text(buff,"OK")==1){result=1;}
	MOVLW       _buff+0
	MOVWF       FARG_find_text_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_find_text_string+1 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_find_text_string_find+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_find_text_string_find+1 
	CALL        _find_text+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__respons_success80
	MOVLW       1
	XORWF       R0, 0 
L__respons_success80:
	BTFSS       STATUS+0, 2 
	GOTO        L_respons_success24
	MOVLW       1
	MOVWF       respons_success_result_L0+0 
	MOVLW       0
	MOVWF       respons_success_result_L0+1 
	GOTO        L_respons_success25
L_respons_success24:
;MyProject.c,217 :: 		else if(find_text (buff,"no change")==1){result=no_change;}
	MOVLW       _buff+0
	MOVWF       FARG_find_text_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_find_text_string+1 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_find_text_string_find+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_find_text_string_find+1 
	CALL        _find_text+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__respons_success81
	MOVLW       1
	XORWF       R0, 0 
L__respons_success81:
	BTFSS       STATUS+0, 2 
	GOTO        L_respons_success26
	MOVLW       1
	MOVWF       respons_success_result_L0+0 
	MOVLW       0
	MOVWF       respons_success_result_L0+1 
	GOTO        L_respons_success27
L_respons_success26:
;MyProject.c,218 :: 		else if(find_text (buff,">")==1){result=send_ready;}
	MOVLW       _buff+0
	MOVWF       FARG_find_text_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_find_text_string+1 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_find_text_string_find+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_find_text_string_find+1 
	CALL        _find_text+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__respons_success82
	MOVLW       1
	XORWF       R0, 0 
L__respons_success82:
	BTFSS       STATUS+0, 2 
	GOTO        L_respons_success28
	MOVLW       1
	MOVWF       respons_success_result_L0+0 
	MOVLW       0
	MOVWF       respons_success_result_L0+1 
	GOTO        L_respons_success29
L_respons_success28:
;MyProject.c,219 :: 		else result=0;
	CLRF        respons_success_result_L0+0 
	CLRF        respons_success_result_L0+1 
L_respons_success29:
L_respons_success27:
L_respons_success25:
;MyProject.c,220 :: 		reset_buff();
	CALL        _reset_buff+0, 0
;MyProject.c,221 :: 		return result;
	MOVF        respons_success_result_L0+0, 0 
	MOVWF       R0 
	MOVF        respons_success_result_L0+1, 0 
	MOVWF       R1 
;MyProject.c,222 :: 		}
L_end_respons_success:
	RETURN      0
; end of _respons_success

_get_ip_mac:

;MyProject.c,223 :: 		void get_ip_mac(){
;MyProject.c,224 :: 		while(!data_ready);
L_get_ip_mac30:
	MOVF        _data_ready+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_get_ip_mac31
	GOTO        L_get_ip_mac30
L_get_ip_mac31:
;MyProject.c,225 :: 		reset_buff();
	CALL        _reset_buff+0, 0
;MyProject.c,226 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,227 :: 		while(!data_ready);
L_get_ip_mac32:
	MOVF        _data_ready+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_get_ip_mac33
	GOTO        L_get_ip_mac32
L_get_ip_mac33:
;MyProject.c,228 :: 		get_string(buff, "APIP,\"",6,"\"",0,APIP);
	MOVLW       _buff+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       6
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _APIP+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_APIP+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,229 :: 		LCD_OUT(1,1,APIP);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _APIP+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_APIP+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,231 :: 		get_string(buff, "APMAC,\"",7,"\"",0,APMAC);
	MOVLW       _buff+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr6_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr6_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       7
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr7_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr7_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _APMAC+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_APMAC+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,232 :: 		LCD_OUT(1,2,APIP);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _APIP+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_APIP+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,234 :: 		get_string(buff, "STAIP,\"",7,"\"",0,STAIP);
	MOVLW       _buff+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr8_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr8_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       7
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr9_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr9_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _STAIP+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_STAIP+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,235 :: 		LCD_OUT(1,3,APIP);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _APIP+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_APIP+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,237 :: 		get_string(buff, "STAMAC,\"",8,"\"",0,STAMAC);
	MOVLW       _buff+0
	MOVWF       FARG_get_string_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_get_string_string+1 
	MOVLW       ?lstr10_MyProject+0
	MOVWF       FARG_get_string_from+0 
	MOVLW       hi_addr(?lstr10_MyProject+0)
	MOVWF       FARG_get_string_from+1 
	MOVLW       8
	MOVWF       FARG_get_string__from+0 
	MOVLW       ?lstr11_MyProject+0
	MOVWF       FARG_get_string_to+0 
	MOVLW       hi_addr(?lstr11_MyProject+0)
	MOVWF       FARG_get_string_to+1 
	CLRF        FARG_get_string__to+0 
	MOVLW       _STAMAC+0
	MOVWF       FARG_get_string_get+0 
	MOVLW       hi_addr(_STAMAC+0)
	MOVWF       FARG_get_string_get+1 
	CALL        _get_string+0, 0
;MyProject.c,238 :: 		LCD_OUT(1,4,APIP);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _APIP+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_APIP+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,240 :: 		reset_buff();
	CALL        _reset_buff+0, 0
;MyProject.c,242 :: 		}
L_end_get_ip_mac:
	RETURN      0
; end of _get_ip_mac

_wifi_config:

;MyProject.c,243 :: 		void wifi_config (){
;MyProject.c,244 :: 		data_ready=0;
	CLRF        _data_ready+0 
;MyProject.c,245 :: 		data_len=0;
	CLRF        _data_len+0 
	CLRF        _data_len+1 
;MyProject.c,246 :: 		memset(buff,0,500);
	MOVLW       _buff+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       244
	MOVWF       FARG_memset_n+0 
	MOVLW       1
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;MyProject.c,247 :: 		lcd_out(1,1,"restarting wifi");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,248 :: 		lcd_out(1,2,"please wait.....");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,250 :: 		uart1_write_at("AT");
	MOVLW       ?lstr14_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr14_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,251 :: 		while( respons_success() !=OK);    //READY
L_wifi_config34:
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config85
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config85:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config35
	GOTO        L_wifi_config34
L_wifi_config35:
;MyProject.c,252 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wifi_config36:
	DECFSZ      R13, 1, 1
	BRA         L_wifi_config36
	DECFSZ      R12, 1, 1
	BRA         L_wifi_config36
	DECFSZ      R11, 1, 1
	BRA         L_wifi_config36
	NOP
	NOP
;MyProject.c,253 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,254 :: 		lcd_out(1,1,"sending AT ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,255 :: 		lcd_out(1,2,"please wait .....");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,256 :: 		uart1_write_at("AT");
	MOVLW       ?lstr17_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr17_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,257 :: 		while( respons_success()!=OK);
L_wifi_config37:
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config86
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config86:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config38
	GOTO        L_wifi_config37
L_wifi_config38:
;MyProject.c,258 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wifi_config39:
	DECFSZ      R13, 1, 1
	BRA         L_wifi_config39
	DECFSZ      R12, 1, 1
	BRA         L_wifi_config39
	DECFSZ      R11, 1, 1
	BRA         L_wifi_config39
	NOP
	NOP
;MyProject.c,260 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,263 :: 		lcd_out(1,1,"DISCONNECTING WIFI");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,264 :: 		lcd_out(1,2,"please wait .....");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,265 :: 		uart1_write_at("AT+CWQAP");
	MOVLW       ?lstr20_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr20_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,266 :: 		while( respons_success()!=OK);
L_wifi_config40:
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config87
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config87:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config41
	GOTO        L_wifi_config40
L_wifi_config41:
;MyProject.c,267 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wifi_config42:
	DECFSZ      R13, 1, 1
	BRA         L_wifi_config42
	DECFSZ      R12, 1, 1
	BRA         L_wifi_config42
	DECFSZ      R11, 1, 1
	BRA         L_wifi_config42
	NOP
	NOP
;MyProject.c,269 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,271 :: 		lcd_out(1,1,"SETTING MODE");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,272 :: 		lcd_out(1,2,"please wait .....");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,273 :: 		uart1_write_at("AT+CWMODE=3");
	MOVLW       ?lstr23_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr23_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,274 :: 		while( respons_success()!=OK);
L_wifi_config43:
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config88
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config88:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config44
	GOTO        L_wifi_config43
L_wifi_config44:
;MyProject.c,275 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wifi_config45:
	DECFSZ      R13, 1, 1
	BRA         L_wifi_config45
	DECFSZ      R12, 1, 1
	BRA         L_wifi_config45
	DECFSZ      R11, 1, 1
	BRA         L_wifi_config45
	NOP
	NOP
;MyProject.c,277 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,278 :: 		lcd_out(1,1,"SETTING CONNECTION ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr24_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,279 :: 		lcd_out(1,2,"please wait .....");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr25_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr25_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,280 :: 		uart1_write_at("AT+CIPMUX=1");
	MOVLW       ?lstr26_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr26_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,281 :: 		while( respons_success()!=OK);
L_wifi_config46:
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config89
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config89:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config47
	GOTO        L_wifi_config46
L_wifi_config47:
;MyProject.c,282 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wifi_config48:
	DECFSZ      R13, 1, 1
	BRA         L_wifi_config48
	DECFSZ      R12, 1, 1
	BRA         L_wifi_config48
	DECFSZ      R11, 1, 1
	BRA         L_wifi_config48
	NOP
	NOP
;MyProject.c,284 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,286 :: 		while(1){
L_wifi_config49:
;MyProject.c,287 :: 		lcd_out(1,1,"connecting to AP");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr27_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr27_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,288 :: 		UART1_Write_Text("AT+CWJAP");
	MOVLW       ?lstr28_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr28_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,289 :: 		UART1_Write('"');
	MOVLW       34
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,290 :: 		UART1_Write_Text(SSID);
	MOVLW       _SSID+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_SSID+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,291 :: 		UART1_Write('"');
	MOVLW       34
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,292 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,293 :: 		UART1_Write_Text(password);
	MOVLW       _password+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_password+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,294 :: 		UART1_Write('"');
	MOVLW       34
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,295 :: 		new_line();
	CALL        _new_line+0, 0
;MyProject.c,296 :: 		if( respons_success()!=OK){
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config90
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config90:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config51
;MyProject.c,297 :: 		lcd_out(1,2,"success");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,298 :: 		break;
	GOTO        L_wifi_config50
;MyProject.c,300 :: 		}
L_wifi_config51:
;MyProject.c,302 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,303 :: 		lcd_out(1,1,"try agine");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr30_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr30_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,304 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wifi_config53:
	DECFSZ      R13, 1, 1
	BRA         L_wifi_config53
	DECFSZ      R12, 1, 1
	BRA         L_wifi_config53
	DECFSZ      R11, 1, 1
	BRA         L_wifi_config53
	NOP
	NOP
;MyProject.c,308 :: 		}
	GOTO        L_wifi_config49
L_wifi_config50:
;MyProject.c,309 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,310 :: 		lcd_out(1,1,"check connection ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr31_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr31_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,311 :: 		UART1_Write_Text("AT+CWJAP=?");
	MOVLW       ?lstr32_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr32_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,312 :: 		while( respons_success()!=OK);
L_wifi_config54:
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config91
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config91:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config55
	GOTO        L_wifi_config54
L_wifi_config55:
;MyProject.c,313 :: 		LCD_OUT(1,2,"WIFI CONNECTED");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr33_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr33_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,314 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wifi_config56:
	DECFSZ      R13, 1, 1
	BRA         L_wifi_config56
	DECFSZ      R12, 1, 1
	BRA         L_wifi_config56
	DECFSZ      R11, 1, 1
	BRA         L_wifi_config56
	NOP
	NOP
;MyProject.c,317 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,318 :: 		lcd_out(1,1,"configure tcp server");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr34_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr34_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,319 :: 		UART1_Write_Text("AT+CIPSEVER=1");
	MOVLW       ?lstr35_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr35_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,320 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,321 :: 		UART1_Write_Text(port);
	MOVLW       _port+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_port+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,322 :: 		new_line();
	CALL        _new_line+0, 0
;MyProject.c,323 :: 		while( respons_success()!=OK);
L_wifi_config57:
	CALL        _respons_success+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wifi_config92
	MOVLW       1
	XORWF       R0, 0 
L__wifi_config92:
	BTFSC       STATUS+0, 2 
	GOTO        L_wifi_config58
	GOTO        L_wifi_config57
L_wifi_config58:
;MyProject.c,324 :: 		reset_buff();
	CALL        _reset_buff+0, 0
;MyProject.c,325 :: 		get_ip_mac();
	CALL        _get_ip_mac+0, 0
;MyProject.c,327 :: 		}
L_end_wifi_config:
	RETURN      0
; end of _wifi_config

_interrupt_config:

;MyProject.c,329 :: 		void interrupt_config(){
;MyProject.c,330 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;MyProject.c,331 :: 		INTCON.PEIE=1;
	BSF         INTCON+0, 6 
;MyProject.c,332 :: 		PIE1.RCIE=1;
	BSF         PIE1+0, 5 
;MyProject.c,333 :: 		}
L_end_interrupt_config:
	RETURN      0
; end of _interrupt_config

_check_connection:

;MyProject.c,334 :: 		void check_connection (){
;MyProject.c,335 :: 		if (data_ready ==1){
	MOVF        _data_ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_check_connection59
;MyProject.c,336 :: 		if ( find_text( buff ,"+IPD") ==1){
	MOVLW       _buff+0
	MOVWF       FARG_find_text_string+0 
	MOVLW       hi_addr(_buff+0)
	MOVWF       FARG_find_text_string+1 
	MOVLW       ?lstr36_MyProject+0
	MOVWF       FARG_find_text_string_find+0 
	MOVLW       hi_addr(?lstr36_MyProject+0)
	MOVWF       FARG_find_text_string_find+1 
	CALL        _find_text+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__check_connection95
	MOVLW       1
	XORWF       R0, 0 
L__check_connection95:
	BTFSS       STATUS+0, 2 
	GOTO        L_check_connection60
;MyProject.c,337 :: 		uart1_write_at("AT+SIPSEND=0,29");
	MOVLW       ?lstr37_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr37_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,338 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_check_connection61:
	DECFSZ      R13, 1, 1
	BRA         L_check_connection61
	DECFSZ      R12, 1, 1
	BRA         L_check_connection61
	DECFSZ      R11, 1, 1
	BRA         L_check_connection61
	NOP
	NOP
;MyProject.c,339 :: 		reset_buff();
	CALL        _reset_buff+0, 0
;MyProject.c,340 :: 		uart1_write_at("<h1>MOHAMED SAMY KASSEM</h1>");
	MOVLW       ?lstr38_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr38_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,341 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_check_connection62:
	DECFSZ      R13, 1, 1
	BRA         L_check_connection62
	DECFSZ      R12, 1, 1
	BRA         L_check_connection62
	DECFSZ      R11, 1, 1
	BRA         L_check_connection62
	NOP
	NOP
;MyProject.c,342 :: 		reset_buff();
	CALL        _reset_buff+0, 0
;MyProject.c,343 :: 		uart1_write_at("AT+CIPCLOSE=0");
	MOVLW       ?lstr39_MyProject+0
	MOVWF       FARG_uart1_write_at__data+0 
	MOVLW       hi_addr(?lstr39_MyProject+0)
	MOVWF       FARG_uart1_write_at__data+1 
	CALL        _uart1_write_at+0, 0
;MyProject.c,344 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_check_connection63:
	DECFSZ      R13, 1, 1
	BRA         L_check_connection63
	DECFSZ      R12, 1, 1
	BRA         L_check_connection63
	DECFSZ      R11, 1, 1
	BRA         L_check_connection63
	NOP
	NOP
;MyProject.c,345 :: 		reset_buff();
	CALL        _reset_buff+0, 0
;MyProject.c,346 :: 		}
L_check_connection60:
;MyProject.c,349 :: 		}
L_check_connection59:
;MyProject.c,350 :: 		}
L_end_check_connection:
	RETURN      0
; end of _check_connection
