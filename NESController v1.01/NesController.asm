
_main:

;NesController.c,4 :: 		void main() {
;NesController.c,5 :: 		TRISA=0x01;
	MOVLW      1
	MOVWF      TRISA+0
;NesController.c,6 :: 		TRISB=0x00;
	CLRF       TRISB+0
;NesController.c,7 :: 		Start:
___main_Start:
;NesController.c,8 :: 		PORTA=0x00;
	CLRF       PORTA+0
;NesController.c,9 :: 		Data=0x00;
	CLRF       _Data+0
;NesController.c,11 :: 		PORTA=0x02; //Set Latch HIGH
	MOVLW      2
	MOVWF      PORTA+0
;NesController.c,12 :: 		Delay_us(12);
	MOVLW      3
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	NOP
	NOP
;NesController.c,13 :: 		PORTA=0x00;
	CLRF       PORTA+0
;NesController.c,15 :: 		if (Button(&PORTA, 0, 1, 1))temp1=0;
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
;NesController.c,16 :: 		else temp1=1;
	MOVLW      1
	MOVWF      _temp1+0
L_main2:
;NesController.c,17 :: 		Data|=temp1;
	MOVF       _temp1+0, 0
	IORWF      _Data+0, 1
;NesController.c,18 :: 		for(i=1;i<8;i++){//Read();
	MOVLW      1
	MOVWF      _i+0
L_main3:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;NesController.c,19 :: 		Delay_us(6);
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
;NesController.c,20 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;NesController.c,21 :: 		temp1=0;
	CLRF       _temp1+0
;NesController.c,22 :: 		if (Button(&PORTA, 0, 1, 1))temp1=0;
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
	GOTO       L_main6
	CLRF       _temp1+0
	GOTO       L_main7
L_main6:
;NesController.c,23 :: 		else temp1=BITS[i];
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
;NesController.c,24 :: 		Data|=temp1;
	MOVF       _temp1+0, 0
	IORWF      _Data+0, 1
;NesController.c,25 :: 		Delay_us(6);
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
;NesController.c,26 :: 		PORTA=0x00;
	CLRF       PORTA+0
;NesController.c,18 :: 		for(i=1;i<8;i++){//Read();
	INCF       _i+0, 1
;NesController.c,27 :: 		}
	GOTO       L_main3
L_main4:
;NesController.c,28 :: 		PORTB=Data;
	MOVF       _Data+0, 0
	MOVWF      PORTB+0
;NesController.c,29 :: 		goto Start;
	GOTO       ___main_Start
;NesController.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
