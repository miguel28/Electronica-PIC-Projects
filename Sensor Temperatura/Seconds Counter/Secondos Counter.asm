
_separateunits:

;Secondos Counter.c,6 :: 		void separateunits()
;Secondos Counter.c,8 :: 		dec=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _dec+0
;Secondos Counter.c,9 :: 		uni=i-(dec*10);
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	SUBWF      _i+0, 0
	MOVWF      _uni+0
;Secondos Counter.c,10 :: 		}
L_end_separateunits:
	RETURN
; end of _separateunits

_main:

;Secondos Counter.c,12 :: 		void main() {
;Secondos Counter.c,13 :: 		TRISA=0x0C;
	MOVLW      12
	MOVWF      TRISA+0
;Secondos Counter.c,14 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Secondos Counter.c,16 :: 		for(;;)
L_main0:
;Secondos Counter.c,18 :: 		for(i=0;i<99;i++)
	CLRF       _i+0
L_main3:
	MOVLW      99
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Secondos Counter.c,20 :: 		separateunits();
	CALL       _separateunits+0
;Secondos Counter.c,21 :: 		for(j=0;j<100;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main6:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      100
	SUBWF      _j+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Secondos Counter.c,22 :: 		PORTB=Segments[dec];
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
;Secondos Counter.c,23 :: 		RA0_bit=1;
	BSF        RA0_bit+0, 0
;Secondos Counter.c,24 :: 		RA1_bit=0;
	BCF        RA1_bit+0, 1
;Secondos Counter.c,25 :: 		delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
;Secondos Counter.c,26 :: 		PORTB=Segments[uni];
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
;Secondos Counter.c,27 :: 		RA0_bit=0;
	BCF        RA0_bit+0, 0
;Secondos Counter.c,28 :: 		RA1_bit=1;
	BSF        RA1_bit+0, 1
;Secondos Counter.c,29 :: 		delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
;Secondos Counter.c,21 :: 		for(j=0;j<100;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Secondos Counter.c,30 :: 		}
	GOTO       L_main6
L_main7:
;Secondos Counter.c,18 :: 		for(i=0;i<99;i++)
	INCF       _i+0, 1
;Secondos Counter.c,32 :: 		}
	GOTO       L_main3
L_main4:
;Secondos Counter.c,34 :: 		}
	GOTO       L_main0
;Secondos Counter.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
