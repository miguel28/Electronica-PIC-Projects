
_main:

;DisplayTemp3.c,10 :: 		void main() {
;DisplayTemp3.c,11 :: 		TRISA=0b00011100;
	MOVLW      28
	MOVWF      TRISA+0
;DisplayTemp3.c,12 :: 		TRISB=0x00;
	CLRF       TRISB+0
;DisplayTemp3.c,13 :: 		RA0_bit=1;
	BSF        RA0_bit+0, 0
;DisplayTemp3.c,14 :: 		PORTB=Segments[1];
	MOVLW      17
	MOVWF      PORTB+0
;DisplayTemp3.c,15 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;DisplayTemp3.c,16 :: 		PORTB=Segments[2];
	MOVLW      107
	MOVWF      PORTB+0
;DisplayTemp3.c,17 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;DisplayTemp3.c,18 :: 		PORTB=Segments[3];
	MOVLW      110
	MOVWF      PORTB+0
;DisplayTemp3.c,19 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;DisplayTemp3.c,20 :: 		PORTB=Segments[4];
	MOVLW      92
	MOVWF      PORTB+0
;DisplayTemp3.c,21 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;DisplayTemp3.c,22 :: 		PORTB=Segments[5];
	MOVLW      62
	MOVWF      PORTB+0
;DisplayTemp3.c,23 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;DisplayTemp3.c,26 :: 		while(1)
L_main5:
;DisplayTemp3.c,29 :: 		separateunits();
	CALL       _separateunits+0
;DisplayTemp3.c,30 :: 		for(i=0;i<45;i++)
	CLRF       _i+0
L_main7:
	MOVLW      45
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;DisplayTemp3.c,32 :: 		PORTB=Segments[dec];
	MOVF       _dec+0, 0
	ADDLW      _Segments+0
	MOVWF      R0+0
	MOVLW      hi_addr(_Segments+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;DisplayTemp3.c,33 :: 		RA0_bit=1;
	BSF        RA0_bit+0, 0
;DisplayTemp3.c,34 :: 		RA1_bit=0;
	BCF        RA1_bit+0, 1
;DisplayTemp3.c,35 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
;DisplayTemp3.c,36 :: 		PORTB=Segments[uni];
	MOVF       _uni+0, 0
	ADDLW      _Segments+0
	MOVWF      R0+0
	MOVLW      hi_addr(_Segments+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;DisplayTemp3.c,37 :: 		RA0_bit=0;
	BCF        RA0_bit+0, 0
;DisplayTemp3.c,38 :: 		RA1_bit=1;
	BSF        RA1_bit+0, 1
;DisplayTemp3.c,39 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
;DisplayTemp3.c,30 :: 		for(i=0;i<45;i++)
	INCF       _i+0, 1
;DisplayTemp3.c,40 :: 		}
	GOTO       L_main7
L_main8:
;DisplayTemp3.c,41 :: 		tempchar=0;
	CLRF       _tempchar+0
;DisplayTemp3.c,42 :: 		for(i=0;i<8;i++){
	CLRF       _i+0
L_main12:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;DisplayTemp3.c,43 :: 		while(RA2_bit==0);
L_main15:
	BTFSC      RA2_bit+0, 2
	GOTO       L_main16
	GOTO       L_main15
L_main16:
;DisplayTemp3.c,44 :: 		if(RA3_bit==0x01)tempchar2=BITS[i];
	BTFSS      RA3_bit+0, 3
	GOTO       L_main17
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
	MOVWF      _tempchar2+0
	GOTO       L_main18
L_main17:
;DisplayTemp3.c,45 :: 		else tempchar2=0x00;
	CLRF       _tempchar2+0
L_main18:
;DisplayTemp3.c,47 :: 		tempchar|=tempchar2;
	MOVF       _tempchar2+0, 0
	IORWF      _tempchar+0, 1
;DisplayTemp3.c,48 :: 		while(RA2_bit==1);
L_main19:
	BTFSS      RA2_bit+0, 2
	GOTO       L_main20
	GOTO       L_main19
L_main20:
;DisplayTemp3.c,42 :: 		for(i=0;i<8;i++){
	INCF       _i+0, 1
;DisplayTemp3.c,49 :: 		}
	GOTO       L_main12
L_main13:
;DisplayTemp3.c,52 :: 		}
	GOTO       L_main5
;DisplayTemp3.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_separateunits:

;DisplayTemp3.c,57 :: 		void separateunits()
;DisplayTemp3.c,59 :: 		dec=tempchar/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _tempchar+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _dec+0
;DisplayTemp3.c,60 :: 		uni=tempchar-(dec*10);
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	SUBWF      _tempchar+0, 0
	MOVWF      _uni+0
;DisplayTemp3.c,61 :: 		}
L_end_separateunits:
	RETURN
; end of _separateunits
