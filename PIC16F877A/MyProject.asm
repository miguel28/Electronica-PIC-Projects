
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		TRISC = 0 ; // set PORTC as output
	CLRF       TRISC+0
;MyProject.c,3 :: 		PORTC = 0 ; // clear PORTC
	CLRF       PORTC+0
;MyProject.c,4 :: 		while(1)
L_main0:
;MyProject.c,6 :: 		PORTC=0xFF;
	MOVLW      255
	MOVWF      PORTC+0
;MyProject.c,7 :: 		Delay_ms(1000);
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
;MyProject.c,8 :: 		PORTC=0x00;
	CLRF       PORTC+0
;MyProject.c,9 :: 		Delay_ms(1000);
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
;MyProject.c,10 :: 		}
	GOTO       L_main0
;MyProject.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
