
_separateunits:

;DisplayTemp.c,6 :: 		void separateunits()
;DisplayTemp.c,8 :: 		dec=tempchar/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _tempchar+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _dec+0
	CLRF       _dec+1
;DisplayTemp.c,9 :: 		uni=tempchar-(dec*10);
	MOVF       _dec+0, 0
	MOVWF      R0+0
	MOVF       _dec+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	SUBWF      _tempchar+0, 0
	MOVWF      _uni+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _uni+1
	SUBWF      _uni+1, 1
;DisplayTemp.c,10 :: 		}
L_end_separateunits:
	RETURN
; end of _separateunits

_main:

;DisplayTemp.c,12 :: 		void main() {
;DisplayTemp.c,13 :: 		TRISA=0b00011100;
	MOVLW      28
	MOVWF      TRISA+0
;DisplayTemp.c,14 :: 		TRISB=0x00;
	CLRF       TRISB+0
;DisplayTemp.c,15 :: 		RA0_bit=1;
	BSF        RA0_bit+0, 0
;DisplayTemp.c,16 :: 		RA1_bit=0;
	BCF        RA1_bit+0, 1
;DisplayTemp.c,17 :: 		PORTB=Segments[4];
	MOVLW      92
	MOVWF      PORTB+0
;DisplayTemp.c,18 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;DisplayTemp.c,19 :: 		PORTB=Segments[2];
	MOVLW      107
	MOVWF      PORTB+0
;DisplayTemp.c,20 :: 		delay_ms(450);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      73
	MOVWF      R12+0
	MOVLW      102
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;DisplayTemp.c,21 :: 		while(1)
L_main2:
;DisplayTemp.c,23 :: 		separateunits();
	CALL       _separateunits+0
;DisplayTemp.c,24 :: 		for(j=0;j<45;j++)
	CLRF       _j+0
L_main4:
	MOVLW      45
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;DisplayTemp.c,26 :: 		PORTB=Segments[dec];
	MOVF       _dec+0, 0
	ADDLW      _Segments+0
	MOVWF      R0+0
	MOVLW      hi_addr(_Segments+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _dec+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;DisplayTemp.c,27 :: 		RA0_bit=1;
	BSF        RA0_bit+0, 0
;DisplayTemp.c,28 :: 		RA1_bit=0;
	BCF        RA1_bit+0, 1
;DisplayTemp.c,29 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
;DisplayTemp.c,30 :: 		PORTB=Segments[uni];
	MOVF       _uni+0, 0
	ADDLW      _Segments+0
	MOVWF      R0+0
	MOVLW      hi_addr(_Segments+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _uni+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;DisplayTemp.c,31 :: 		RA0_bit=0;
	BCF        RA0_bit+0, 0
;DisplayTemp.c,32 :: 		RA1_bit=1;
	BSF        RA1_bit+0, 1
;DisplayTemp.c,33 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
;DisplayTemp.c,24 :: 		for(j=0;j<45;j++)
	INCF       _j+0, 1
;DisplayTemp.c,34 :: 		}
	GOTO       L_main4
L_main5:
;DisplayTemp.c,35 :: 		for(j=0;j<8;j++){
	CLRF       _j+0
L_main9:
	MOVLW      8
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;DisplayTemp.c,36 :: 		while(RA2_bit==0);
L_main12:
	BTFSC      RA2_bit+0, 2
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;DisplayTemp.c,37 :: 		if(RA3_bit==0x01)tempchar2=BITS[j];
	BTFSS      RA3_bit+0, 3
	GOTO       L_main14
	MOVF       _j+0, 0
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
	MOVWF      _tempchar2+0
	GOTO       L_main15
L_main14:
;DisplayTemp.c,38 :: 		else tempchar2=0x00;
	CLRF       _tempchar2+0
L_main15:
;DisplayTemp.c,40 :: 		tempchar|=tempchar2;
	MOVF       _tempchar2+0, 0
	IORWF      _tempchar+0, 1
;DisplayTemp.c,41 :: 		while(RA2_bit==1);
L_main16:
	BTFSS      RA2_bit+0, 2
	GOTO       L_main17
	GOTO       L_main16
L_main17:
;DisplayTemp.c,35 :: 		for(j=0;j<8;j++){
	INCF       _j+0, 1
;DisplayTemp.c,42 :: 		}
	GOTO       L_main9
L_main10:
;DisplayTemp.c,43 :: 		}
	GOTO       L_main2
;DisplayTemp.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
