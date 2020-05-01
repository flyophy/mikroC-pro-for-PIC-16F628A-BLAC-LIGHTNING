
_kurulum:

;Karaþimþek.c,3 :: 		void kurulum()
;Karaþimþek.c,5 :: 		TRISB=0;
	CLRF       TRISB+0
;Karaþimþek.c,6 :: 		PORTB=0;
	CLRF       PORTB+0
;Karaþimþek.c,7 :: 		led=1;
	MOVLW      1
	MOVWF      _led+0
;Karaþimþek.c,8 :: 		}
L_end_kurulum:
	RETURN
; end of _kurulum

_main:

;Karaþimþek.c,10 :: 		void main()
;Karaþimþek.c,12 :: 		kurulum();
	CALL       _kurulum+0
;Karaþimþek.c,13 :: 		while(1)
L_main0:
;Karaþimþek.c,15 :: 		for(i=0;i<7;i++)
	CLRF       _i+0
L_main2:
	MOVLW      7
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Karaþimþek.c,17 :: 		PORTB=led;
	MOVF       _led+0, 0
	MOVWF      PORTB+0
;Karaþimþek.c,18 :: 		led=led<<1;
	RLF        _led+0, 1
	BCF        _led+0, 0
;Karaþimþek.c,19 :: 		delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Karaþimþek.c,15 :: 		for(i=0;i<7;i++)
	INCF       _i+0, 1
;Karaþimþek.c,20 :: 		}
	GOTO       L_main2
L_main3:
;Karaþimþek.c,22 :: 		for(i=0;i<7;i++)
	CLRF       _i+0
L_main6:
	MOVLW      7
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Karaþimþek.c,24 :: 		PORTB=led;
	MOVF       _led+0, 0
	MOVWF      PORTB+0
;Karaþimþek.c,25 :: 		led=led>>1;
	RRF        _led+0, 1
	BCF        _led+0, 7
;Karaþimþek.c,26 :: 		delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Karaþimþek.c,22 :: 		for(i=0;i<7;i++)
	INCF       _i+0, 1
;Karaþimþek.c,27 :: 		}
	GOTO       L_main6
L_main7:
;Karaþimþek.c,28 :: 		}
	GOTO       L_main0
;Karaþimþek.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
