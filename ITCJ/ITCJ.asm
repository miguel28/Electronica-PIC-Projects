
_main:

;ITCJ.c,8 :: 		void main() {
;ITCJ.c,9 :: 		TRISA=0x00;
	CLRF       TRISA+0
;ITCJ.c,10 :: 		TRISB=0x00;
	CLRF       TRISB+0
;ITCJ.c,12 :: 		while(1)
L_main0:
;ITCJ.c,15 :: 		PORTB=LetraI;
	MOVF       _LetraI+0, 0
	MOVWF      PORTB+0
;ITCJ.c,16 :: 		PORTA=0x01;
	MOVLW      1
	MOVWF      PORTA+0
;ITCJ.c,17 :: 		Delay_ms(1000);
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
;ITCJ.c,20 :: 		PORTB=LetraT;
	MOVF       _LetraT+0, 0
	MOVWF      PORTB+0
;ITCJ.c,21 :: 		PORTA=0x02;
	MOVLW      2
	MOVWF      PORTA+0
;ITCJ.c,22 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;ITCJ.c,25 :: 		PORTB=LetraC;
	MOVF       _LetraC+0, 0
	MOVWF      PORTB+0
;ITCJ.c,26 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;ITCJ.c,27 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;ITCJ.c,30 :: 		PORTB=LetraJ;
	MOVF       _LetraJ+0, 0
	MOVWF      PORTB+0
;ITCJ.c,31 :: 		PORTA=0x08;
	MOVLW      8
	MOVWF      PORTA+0
;ITCJ.c,32 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;ITCJ.c,34 :: 		for(i=0; i< 600; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main6:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      88
	SUBWF      _i+0, 0
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;ITCJ.c,37 :: 		PORTB=LetraI;
	MOVF       _LetraI+0, 0
	MOVWF      PORTB+0
;ITCJ.c,38 :: 		PORTA=0x01;
	MOVLW      1
	MOVWF      PORTA+0
;ITCJ.c,39 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
;ITCJ.c,42 :: 		PORTB=LetraT;
	MOVF       _LetraT+0, 0
	MOVWF      PORTB+0
;ITCJ.c,43 :: 		PORTA=0x02;
	MOVLW      2
	MOVWF      PORTA+0
;ITCJ.c,44 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
;ITCJ.c,47 :: 		PORTB=LetraC;
	MOVF       _LetraC+0, 0
	MOVWF      PORTB+0
;ITCJ.c,48 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;ITCJ.c,49 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
;ITCJ.c,52 :: 		PORTB=LetraJ;
	MOVF       _LetraJ+0, 0
	MOVWF      PORTB+0
;ITCJ.c,53 :: 		PORTA=0x08;
	MOVLW      8
	MOVWF      PORTA+0
;ITCJ.c,54 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
;ITCJ.c,34 :: 		for(i=0; i< 600; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ITCJ.c,56 :: 		}
	GOTO       L_main6
L_main7:
;ITCJ.c,57 :: 		for(i=0; i< 8; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main13:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      8
	SUBWF      _i+0, 0
L__main35:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;ITCJ.c,60 :: 		PORTB=Anim[i];
	MOVF       _i+0, 0
	ADDLW      _Anim+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;ITCJ.c,61 :: 		PORTA=0x01;
	MOVLW      1
	MOVWF      PORTA+0
;ITCJ.c,62 :: 		Delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
;ITCJ.c,57 :: 		for(i=0; i< 8; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ITCJ.c,63 :: 		}
	GOTO       L_main13
L_main14:
;ITCJ.c,65 :: 		PORTB=LetraI;
	MOVF       _LetraI+0, 0
	MOVWF      PORTB+0
;ITCJ.c,66 :: 		PORTA=0x01;
	MOVLW      1
	MOVWF      PORTA+0
;ITCJ.c,67 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;ITCJ.c,68 :: 		for(i=0; i< 8; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main18:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      8
	SUBWF      _i+0, 0
L__main36:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
;ITCJ.c,71 :: 		PORTB=Anim[i];
	MOVF       _i+0, 0
	ADDLW      _Anim+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;ITCJ.c,72 :: 		PORTA=0x02;
	MOVLW      2
	MOVWF      PORTA+0
;ITCJ.c,73 :: 		Delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
;ITCJ.c,68 :: 		for(i=0; i< 8; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ITCJ.c,74 :: 		}
	GOTO       L_main18
L_main19:
;ITCJ.c,76 :: 		PORTB=LetraT;
	MOVF       _LetraT+0, 0
	MOVWF      PORTB+0
;ITCJ.c,77 :: 		PORTA=0x02;
	MOVLW      2
	MOVWF      PORTA+0
;ITCJ.c,78 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;ITCJ.c,79 :: 		for(i=0; i< 8; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main23:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      8
	SUBWF      _i+0, 0
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L_main24
;ITCJ.c,82 :: 		PORTB=Anim[i];
	MOVF       _i+0, 0
	ADDLW      _Anim+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;ITCJ.c,83 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;ITCJ.c,84 :: 		Delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	NOP
;ITCJ.c,79 :: 		for(i=0; i< 8; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ITCJ.c,85 :: 		}
	GOTO       L_main23
L_main24:
;ITCJ.c,87 :: 		PORTB=LetraC;
	MOVF       _LetraC+0, 0
	MOVWF      PORTB+0
;ITCJ.c,88 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;ITCJ.c,89 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;ITCJ.c,90 :: 		for(i=0; i< 8; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main28:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      8
	SUBWF      _i+0, 0
L__main38:
	BTFSC      STATUS+0, 0
	GOTO       L_main29
;ITCJ.c,93 :: 		PORTB=Anim[i];
	MOVF       _i+0, 0
	ADDLW      _Anim+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;ITCJ.c,94 :: 		PORTA=0x08;
	MOVLW      8
	MOVWF      PORTA+0
;ITCJ.c,95 :: 		Delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	NOP
;ITCJ.c,90 :: 		for(i=0; i< 8; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ITCJ.c,96 :: 		}
	GOTO       L_main28
L_main29:
;ITCJ.c,98 :: 		PORTB=LetraJ;
	MOVF       _LetraJ+0, 0
	MOVWF      PORTB+0
;ITCJ.c,99 :: 		PORTA=0x08;
	MOVLW      8
	MOVWF      PORTA+0
;ITCJ.c,100 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;ITCJ.c,101 :: 		}
	GOTO       L_main0
;ITCJ.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
