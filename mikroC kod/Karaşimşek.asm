
_kurulum:

;Karažimžek.c,3 :: 		void kurulum()
;Karažimžek.c,5 :: 		TRISB=0;
	CLRF       TRISB+0
;Karažimžek.c,6 :: 		PORTB=0;
	CLRF       PORTB+0
;Karažimžek.c,7 :: 		led=1;
	MOVLW      1
	MOVWF      _led+0
;Karažimžek.c,8 :: 		}
L_end_kurulum:
	RETURN
; end of _kurulum

_main:

;Karažimžek.c,10 :: 		void main()
;Karažimžek.c,12 :: 		kurulum();
	CALL       _kurulum+0
;Karažimžek.c,13 :: 		while(1)
L_main0:
;Karažimžek.c,15 :: 		for(i=0;i<7;i++)
	CLRF       _i+0
L_main2:
	MOVLW      7
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Karažimžek.c,17 :: 		PORTB=led;
	MOVF       _led+0, 0
	MOVWF      PORTB+0
;Karažimžek.c,18 :: 		led=led<<1;
	RLF        _led+0, 1
	BCF        _led+0, 0
;Karažimžek.c,19 :: 		delay_ms(70);
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
;Karažimžek.c,15 :: 		for(i=0;i<7;i++)
	INCF       _i+0, 1
;Karažimžek.c,20 :: 		}
	GOTO       L_main2
L_main3:
;Karažimžek.c,22 :: 		for(i=0;i<7;i++)
	CLRF       _i+0
L_main6:
	MOVLW      7
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Karažimžek.c,24 :: 		PORTB=led;
	MOVF       _led+0, 0
	MOVWF      PORTB+0
;Karažimžek.c,25 :: 		led=led>>1;
	RRF        _led+0, 1
	BCF        _led+0, 7
;Karažimžek.c,26 :: 		delay_ms(70);
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
;Karažimžek.c,22 :: 		for(i=0;i<7;i++)
	INCF       _i+0, 1
;Karažimžek.c,27 :: 		}
	GOTO       L_main6
L_main7:
;Karažimžek.c,28 :: 		}
	GOTO       L_main0
;Karažimžek.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
