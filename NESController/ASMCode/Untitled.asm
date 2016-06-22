    list      p=16F84A             ; list directive to define processor
    #include <p16F84a.inc>         ; processor specific variable definitions

    __CONFIG   _CP_OFF & _WDT_ON & _PWRTE_ON & _RC_OSC

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

;***** VARIABLE DEFINITIONS
w_temp        EQU     0x0C        ; variable used for context saving 
status_temp   EQU     0x0D        ; variable used for context saving
STORAGE 	  EQU	  0Ch

;**********************************************************************

start1:
		bsf		STATUS,5		;Get to bank 1
		movlw	b'00001'
		movwf	TRISA
		clrf	TRISB				;Setting all portb to output
		bcf		STATUS,5
		clrf	PORTA				;get to familiar setting for NES controller
		clrf	PORTB	
		clrf	STORAGE				;clear our storage

start2:
		
		clrf PORTA
		clrf PORTB
		clrf STORAGE

		;Create the latch output
		bsf		PORTA,1			;Set latch HIGH
Delay_12:
		cblock
		d1
		d2
		endc

			;11998 cycles
		movlw	0x5F
		movwf	d1
		movlw	0x0A
		movwf	d2
Delay_0
		decfsz	d1, f
		goto	$+2
		decfsz	d2, f
		goto	Delay_0
				;2 cycles
		goto	$+1

		;need 12us delay here
 		bcf		PORTA,1			;Set latch LOW
		;need 6us delay here?
		call Delay_6





		;Get data 8 times
		btfss	PORTA,0
		bsf		STORAGE,0
		call	ReadData
		call	ReadData
		call	ReadData
		call	ReadData
		call	ReadData
		call	ReadData
		call	ReadData

		;Initiate correct parallel outputs
		btfsc	STORAGE,0
		bsf		PORTB,7
		bcf		PORTB,7

		btfsc	STORAGE,1
		bsf		PORTB,6
		bcf		PORTB,6

		btfsc	STORAGE,2
		bsf		PORTB,5
		bcf		PORTB,5

		btfsc	STORAGE,3
		bsf		PORTB,4
		bcf		PORTB,4

		btfsc	STORAGE,4
		bsf		PORTB,3
		bcf		PORTB,3

		btfsc	STORAGE,5
		bsf		PORTB,2
		bcf		PORTB,2

		btfsc	STORAGE,6
		bsf		PORTB,1
		bcf		PORTB,1

		btfsc	STORAGE,7
		bsf		PORTB,0
		bcf		PORTB,0
		
        goto start2

		ReadData
			;6us delay here
			call Delay_6
			bsf PORTA,2		;Set clock HIGH
			btfss	PORTA,0
			rlf	STORAGE	;Move current STORAGE value left
			bsf	STORAGE,0	;Put new value in STORAGE
			;6us delay here
			call Delay_6
			bcf PORTA,2		;Set clock LOW
		return		

        goto $

Delay_6:
		cblock
		d3
		d4
		endc

			;5998 cycles
		movlw	0xAF
		movwf	d3
		movlw	0x05
		movwf	d4
Delay_1
		decfsz	d3, f
		goto	$+2
		decfsz	d3, f
		goto	Delay_1

			;2 cycles
		return

        END