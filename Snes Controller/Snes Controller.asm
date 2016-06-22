
_main:

;Snes Controller.c,3 :: 		void main() {
;Snes Controller.c,4 :: 		ADCON1=0x06;
	MOVLW      6
	MOVWF      ADCON1+0
;Snes Controller.c,6 :: 		TRISA=0x01;
	MOVLW      1
	MOVWF      TRISA+0
;Snes Controller.c,7 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Snes Controller.c,8 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Snes Controller.c,9 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Snes Controller.c,10 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Snes Controller.c,11 :: 		Start:
___main_Start:
;Snes Controller.c,12 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Snes Controller.c,14 :: 		Data=0x00;
	CLRF       _Data+0
;Snes Controller.c,15 :: 		Data2=0x00;
	CLRF       _Data2+0
;Snes Controller.c,17 :: 		PORTA=0x02; //Set Latch HIGH
	MOVLW      2
	MOVWF      PORTA+0
;Snes Controller.c,18 :: 		Delay_us(12);
	MOVLW      3
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	NOP
	NOP
;Snes Controller.c,19 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Snes Controller.c,21 :: 		if (Button(&PORTA, 0, 1, 1))temp1=0;
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main1
	CLRF       _temp1+0
	GOTO       L_main2
L_main1:
;Snes Controller.c,22 :: 		else temp1=1;
	MOVLW      1
	MOVWF      _temp1+0
L_main2:
;Snes Controller.c,23 :: 		Data|=temp1;
	MOVF       _temp1+0, 0
	IORWF      _Data+0, 1
;Snes Controller.c,25 :: 		for(i=1;i<8;i++){//Read();
	MOVLW      1
	MOVWF      _i+0
L_main3:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Snes Controller.c,26 :: 		Delay_us(6);
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
;Snes Controller.c,27 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;Snes Controller.c,28 :: 		temp1=0;
	CLRF       _temp1+0
;Snes Controller.c,29 :: 		if (RA0_bit)temp1=0;
	BTFSS      RA0_bit+0, 0
	GOTO       L_main6
	CLRF       _temp1+0
	GOTO       L_main7
L_main6:
;Snes Controller.c,30 :: 		else temp1=BITS[i];
	MOVF       _i+0, 0
	ADDLW      _BITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_BITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      _temp1+0
L_main7:
;Snes Controller.c,31 :: 		Data|=temp1;
	MOVF       _temp1+0, 0
	IORWF      _Data+0, 1
;Snes Controller.c,32 :: 		Delay_us(6);
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
;Snes Controller.c,33 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Snes Controller.c,25 :: 		for(i=1;i<8;i++){//Read();
	INCF       _i+0, 1
;Snes Controller.c,34 :: 		}
	GOTO       L_main3
L_main4:
;Snes Controller.c,35 :: 		temp1=0x00;
	CLRF       _temp1+0
;Snes Controller.c,36 :: 		for(i=0;i<8;i++){//Read();
	CLRF       _i+0
L_main8:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Snes Controller.c,37 :: 		Delay_us(6);
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
;Snes Controller.c,38 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;Snes Controller.c,39 :: 		temp1=0;
	CLRF       _temp1+0
;Snes Controller.c,40 :: 		if (RA0_bit)temp1=0;
	BTFSS      RA0_bit+0, 0
	GOTO       L_main11
	CLRF       _temp1+0
	GOTO       L_main12
L_main11:
;Snes Controller.c,41 :: 		else temp1=BITS[i];
	MOVF       _i+0, 0
	ADDLW      _BITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_BITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      _temp1+0
L_main12:
;Snes Controller.c,42 :: 		Data2|=temp1;
	MOVF       _temp1+0, 0
	IORWF      _Data2+0, 1
;Snes Controller.c,43 :: 		Delay_us(6);
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
;Snes Controller.c,44 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Snes Controller.c,36 :: 		for(i=0;i<8;i++){//Read();
	INCF       _i+0, 1
;Snes Controller.c,45 :: 		}
	GOTO       L_main8
L_main9:
;Snes Controller.c,46 :: 		PORTB=Data2;
	MOVF       _Data2+0, 0
	MOVWF      PORTB+0
;Snes Controller.c,47 :: 		PORTC=Data;
	MOVF       _Data+0, 0
	MOVWF      PORTC+0
;Snes Controller.c,48 :: 		goto Start;
	GOTO       ___main_Start
;Snes Controller.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
