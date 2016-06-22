
_portstate:

;ReceptorDigital.c,7 :: 		void portstate()
;ReceptorDigital.c,9 :: 		if(temp1>=MINTEMP)PORTA=temp3|0x04;
	MOVLW      10
	SUBWF      _temp1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_portstate0
	MOVLW      4
	IORWF      _temp3+0, 0
	MOVWF      PORTA+0
	GOTO       L_portstate1
L_portstate0:
;ReceptorDigital.c,10 :: 		else PORTA=temp3;
	MOVF       _temp3+0, 0
	MOVWF      PORTA+0
L_portstate1:
;ReceptorDigital.c,12 :: 		}
L_end_portstate:
	RETURN
; end of _portstate

_main:

;ReceptorDigital.c,14 :: 		void main() {
;ReceptorDigital.c,15 :: 		TRISA=0x00;
	CLRF       TRISA+0
;ReceptorDigital.c,16 :: 		TRISB=0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;ReceptorDigital.c,17 :: 		PORTA=0x00;
	CLRF       PORTA+0
;ReceptorDigital.c,18 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;ReceptorDigital.c,19 :: 		for(;;)
L_main3:
;ReceptorDigital.c,21 :: 		temp1=PORTB;
	MOVF       PORTB+0, 0
	MOVWF      _temp1+0
;ReceptorDigital.c,22 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;ReceptorDigital.c,23 :: 		for(i=0;i<8;i++)
	CLRF       _i+0
L_main7:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;ReceptorDigital.c,25 :: 		temp2=temp1>>i;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _temp1+0, 0
	MOVWF      R1+0
	MOVF       R0+0, 0
L__main16:
	BTFSC      STATUS+0, 2
	GOTO       L__main17
	RRF        R1+0, 1
	BCF        R1+0, 7
	ADDLW      255
	GOTO       L__main16
L__main17:
	MOVF       R1+0, 0
	MOVWF      _temp2+0
;ReceptorDigital.c,26 :: 		if(temp2&0x01==0x01)temp3=0x03;
	BTFSS      R1+0, 0
	GOTO       L_main10
	MOVLW      3
	MOVWF      _temp3+0
	GOTO       L_main11
L_main10:
;ReceptorDigital.c,27 :: 		else temp3=0x01;
	MOVLW      1
	MOVWF      _temp3+0
L_main11:
;ReceptorDigital.c,28 :: 		portstate();
	CALL       _portstate+0
;ReceptorDigital.c,29 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
;ReceptorDigital.c,30 :: 		temp3=0x00;
	CLRF       _temp3+0
;ReceptorDigital.c,31 :: 		portstate();
	CALL       _portstate+0
;ReceptorDigital.c,32 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
;ReceptorDigital.c,23 :: 		for(i=0;i<8;i++)
	INCF       _i+0, 1
;ReceptorDigital.c,42 :: 		}
	GOTO       L_main7
L_main8:
;ReceptorDigital.c,43 :: 		}
	GOTO       L_main3
;ReceptorDigital.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
