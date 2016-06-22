
_separateunits:

;SensorTemperatura.c,5 :: 		void separateunits()
;SensorTemperatura.c,7 :: 		Dec=Temperute/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Temperute+0, 0
	MOVWF      R0+0
	MOVF       _Temperute+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _Dec+0
;SensorTemperatura.c,8 :: 		Uni=Temperute-(Dec*10);
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	SUBWF      _Temperute+0, 0
	MOVWF      _Uni+0
;SensorTemperatura.c,9 :: 		if(Dec>10)Dec=10;
	MOVF       _Dec+0, 0
	SUBLW      10
	BTFSC      STATUS+0, 0
	GOTO       L_separateunits0
	MOVLW      10
	MOVWF      _Dec+0
L_separateunits0:
;SensorTemperatura.c,10 :: 		}
L_end_separateunits:
	RETURN
; end of _separateunits

_main:

;SensorTemperatura.c,12 :: 		void main() {
;SensorTemperatura.c,14 :: 		TRISA=0x3F;
	MOVLW      63
	MOVWF      TRISA+0
;SensorTemperatura.c,15 :: 		ADCON0=0x40; // fosc/8 --> see datasheet for other clock - fosc is defined by 2 bits in ADCON0 (6..7) and 1 bit (6) in ADCON1..
	MOVLW      64
	MOVWF      ADCON0+0
;SensorTemperatura.c,16 :: 		ADCON1=0x84; // AN0/AN1/AN3/Vref+=VDD/Vref-=VSS - remaining inputs on PORTA/PORTE will be digital
	MOVLW      132
	MOVWF      ADCON1+0
;SensorTemperatura.c,18 :: 		TRISD=0x00;
	CLRF       TRISD+0
;SensorTemperatura.c,19 :: 		TRISB=0x00;
	CLRF       TRISB+0
;SensorTemperatura.c,20 :: 		TRISC=0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;SensorTemperatura.c,21 :: 		PORTB=0x00;
	CLRF       PORTB+0
;SensorTemperatura.c,22 :: 		PORTD=0x00;
	CLRF       PORTD+0
;SensorTemperatura.c,24 :: 		PORTB=0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;SensorTemperatura.c,25 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;SensorTemperatura.c,27 :: 		PORTB=Segments[2];
	MOVLW      91
	MOVWF      PORTB+0
;SensorTemperatura.c,28 :: 		PORTD=Segments[8];
	MOVLW      127
	MOVWF      PORTD+0
;SensorTemperatura.c,29 :: 		Delay_ms(1000);
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
;SensorTemperatura.c,31 :: 		while(1)
L_main3:
;SensorTemperatura.c,34 :: 		temp_res = ADC_Read(2) >> 2;
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Temperute+0
	MOVF       R0+1, 0
	MOVWF      _Temperute+1
	RRF        _Temperute+1, 1
	RRF        _Temperute+0, 1
	BCF        _Temperute+1, 7
	RRF        _Temperute+1, 1
	RRF        _Temperute+0, 1
	BCF        _Temperute+1, 7
;SensorTemperatura.c,36 :: 		Temperute=temp_res;
	MOVLW      0
	MOVWF      _Temperute+1
;SensorTemperatura.c,37 :: 		separateunits();
	CALL       _separateunits+0
;SensorTemperatura.c,38 :: 		PORTB=Segments[Uni];
	MOVF       _Uni+0, 0
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
;SensorTemperatura.c,40 :: 		PORTD=Segments[Dec];
	MOVF       _Dec+0, 0
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
	MOVWF      PORTD+0
;SensorTemperatura.c,41 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;SensorTemperatura.c,42 :: 		}
	GOTO       L_main3
;SensorTemperatura.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
