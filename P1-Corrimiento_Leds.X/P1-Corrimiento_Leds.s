;--------------------------------------------------------------
; @file:		P1-Corrimiento_Leds.s
; @brief:		Este es un programa que me permite realizar corrimiento de leds concectados al puerto C[7:0]. Consiste que en el número
;                       de corrimientos pares tendrán un retardo de 500ms identificándolo con un led encendido ubicado en RE1 y en el número de corrimientos 
;                       impares tendrán un retardo de 250ms y será identificado con un led encendido ubicado en RE0.
;                       El corrimiento inicia cuando se presiona el pulsador de la placa una vez y se detiende cuando se vuelve a presionar. 
;                       NOTA: se trabaja con una frecuencia de 4Mhz y una libreria de retardos.
; @date:		15/01/2023
; @author:		Jairo Noe Nizama Valdiviezo
; @Version and program:	MPLAB X IDE v6.00
;------------------------------------------------------------------
    
PROCESSOR 18F57Q84
#include "bit_config.inc" /*config statements should precede project file includes.*/
#include "Retardos.inc"
#include <xc.inc>

PSECT resetVect,class=CODE, reloc=2
resetVect:
    goto Main
PSECT CODE
Main:
    CALL    Config_OSC         ;Nos dirige a la configuracion del oscilador
    CALL    Config_Port        ;Nos dirige a la configuracion de los puertos a utilizar
    NOP
;Se tiene en cuenta la condicion de empezar el corrimiento cuando el pulsador 
;sea presioando 
estado_pulsador1:
    BANKSEL PORTA                  ;Me ubica en el puerto A    
    BTFSC   PORTA,3,1		   ;PORTA<3>=0?- button press? 
    GOTO    estado_pulsador1
    
;Código para el corrimiento impar cuyo retardo es 250ms, para ello utilizo rotacion de bit
;a la izquierda (RLNCF) e instrucciones de salto orientado a byte (BTFSS) para la 
;condición del pulsador(PORTA<3>) en caso sea presionado o no.
    
Corrimiento_impar:
    BANKSEL PORTE                 ;Me ubica en el puerto E
    BSF	    PORTE,0,1             ;PORTE<0>=1---leed on
    BANKSEL PORTC                 ;Me ubica en el puerto C
    CLRF    PORTC,1               ;Todo el puerto C iniciará apagado 
    BSF	    PORTC,0,1             ;El led PORTC<0>=1--led encendido 
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<0> tendrá un retardo de 250ms
    BTFSS   PORTA,3,1             ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento y dejar el led encendido
    RLNCF   LATC,1	          ;Rotar un bit a la izquierda--PORTC<1>(led encendido)
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<1> tendrá un retardo de 250ms
    BTFSS   PORTA,3,1             ;PORTA<3>=0?- button press?
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento y dejar el led encendido
    RLNCF   LATC,1	          ;rotar un bit a la izquierda--- PORTC<2>(led encendido)
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<2> tendrá un retardo de 250ms
    BTFSS   PORTA,3,1             ;PORTA<3>=0?- button press?
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento y dejar el led encendido
    RLNCF   LATC,1	          ;rotar un bit a la izquierda--- PORTC<3>(led encendido)
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<3> tendrá un retardo de 250ms
    BTFSS   PORTA,3,1             ;PORTA<3>=0?- button press?
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento y dejar el led encendido
    RLNCF   LATC,1	          ;rotar un bit a la izquierda---PORTC<4>(led encendido)
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<4> tendrá un retardo de 250ms
    BTFSS   PORTA,3,1             ;PORTA<3>=0?- button press?
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento y dejar el led encendido
    RLNCF   LATC,1	          ;rotar un bit a la izquierda---PORTC<5>(led encendido)
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<5> tendrá un retardo de 250ms
    BTFSS   PORTA,3,1             ;PORTA<3>=0?- button press?
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento y dejar el led encendido
    RLNCF   LATC,1	          ;rotar un bit a la izquierda---PORTC<6>(led encendido)
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<6> tendrá un retardo de 250ms
    BTFSS   PORTA,3,1             ;PORTA<3>=0?- button press?
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento y dejar el led encendido
    RLNCF   LATC,1	          ;rotar un bit a la izquierda---PORTC<7>(led encendido)
    CALL    Delay_250ms,1         ;El led ubicado en PORTC<7> tendrá un retardo de 250ms
    BCF	    PORTE,0,1             ;El led ubicado en PORTE<0> se apaga al termianar el corrimiento impar
    BTFSS   PORTA,3,1             ;PORTA<3>=0?- button press?, realiza el salto al corrimiento par si no es presionado 
    CALL    Led_Stop              ;Me dirige a la subrutina para detener el corrimiento
    
;código para el corrimiento de leds par que tendrá  un retardo de 500ms
Corrimiento_par:
    BANKSEL  PORTE                ;Me ubica en el puerto E
    BSF	     PORTE,1,1            ;PORTE<0>=1---leed on
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<0>(led encendido)
    ;El led ubicado en PORTC<0> tendrá un retardo de 500ms
    CALL    Delay_250ms,1         
    CALL    Delay_250ms,1
    BTFSS    PORTA,3,1            ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente
    CALL     Led_Stop             
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<1>(led encendido
    ;El led ubicado en PORTC<1> tendrá un retardo de 500ms
    CALL    Delay_250ms,1         
    CALL    Delay_250ms,1
    BTFSS    PORTA,3,1            ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente 
    CALL     Led_Stop             
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<2>(led encendido)
    ;El led ubicado en PORTC<2> tendrá un retardo de 500ms
    CALL    Delay_250ms,1         
    CALL    Delay_250ms,1
    BTFSS    PORTA,3,1            ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente
    CALL     Led_Stop
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<3>(led encendido)
    ;El led ubicado en PORTC<3> tendrá un retardo de 500ms
    CALL    Delay_250ms,1         
    CALL    Delay_250ms,1
    BTFSS    PORTA,3,1            ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente
    CALL     Led_Stop
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<4>(led encendido)
    ;El led ubicado en PORTC<4> tendrá un retardo de 500ms
    CALL    Delay_250ms,1         
    CALL    Delay_250ms,1
    BTFSS    PORTA,3,1            ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente
    CALL     Led_Stop
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<5>(led encendido)
    ;El led ubicado en PORTC<5> tendrá un retardo de 500ms
    CALL    Delay_250ms,1         
    CALL    Delay_250ms,1
    BTFSS    PORTA,3,1            ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente
    CALL     Led_Stop
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<6>(led encendido)
    ;El led ubicado en PORTC<6> tendrá un retardo de 500ms
    CALL    Delay_250ms,1        
    CALL    Delay_250ms,1
    BTFSS    PORTA,3,1            ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente
    CALL     Led_Stop
    RLNCF    LATC,1	          ;rotar un bit a la izquierda--- PORTC<7>(led encendido)
    ;El led ubicado en PORTC<7> tendrá un retardo de 500ms
    CALL    Delay_250ms,1         
    CALL    Delay_250ms,1
    BCF      PORTE,1,1            ;El led ubicado en PORTE<1> se apaga al termianar el corrimiento par
    BTFSS    PORTA,3,1            ;PORTA<3>=0?- button press?,realiza el salto al corrimiento impar si no es presionado 
    CALL     Led_Stop 
    GOTO     Corrimiento_impar    ;Me dirige a la instruccion de corrimiento impar
   
Led_Stop:
;Se le agrega un retardo de 1 segundo al presionar el pulsador 
    CALL    Delay_250ms,1	   
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,1		   ; PORTA<3>=0?- button press?
    GOTO    estado_pulsador2	   ;Me dirije a la subrutina para preguntar el estado en el que se encuentra el pulsador		; 
estado_pulsador2:
    BANKSEL PORTA                  ;Me ubica en el PUERTO A
    BTFSC   PORTA,3,1		   ;PORTA<3>=0?- button press?, al presionarse el pulsador realiza el salto
    GOTO    estado_pulsador2	   			; 	 
    RETURN                         ;Continua el corrimiento de los leds al presionar el pulsador
	
Config_OSC:
    ;configuración del Oscilador interno a una frecuencia de 4Mhz
    BANKSEL OSCCON1
    MOVLW 0x60	                 ;seleccionamos el bloque del oscilador interno con un div:1
    MOVWF OSCCON1
    MOVLW 0X02	                 ;seleccionamos a una frecuencia de 4Mhz
    MOVWF OSCFRQ
    RETURN
 
Config_Port:	;PORT-LAT-ANSEL-TRIS LED:RF3,  BUTTON:RA3
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,1	;PORTA<7,0> = 0
    CLRF    ANSELA,1	;PORTA DIGITAL
    BSF	    TRISA,3,1	;RA3 COMO ENTRADA
    BSF	    WPUA,3,1	;ACTIVAMOS LA RESISTENCIA PULLUP DEL PIN RA3
    ;Config PORTE
    BANKSEL PORTE
    CLRF    PORTE,1	;PORTE<7,0> = 0
    CLRF    ANSELE,1	;PORTE DIGITAL
    BCF	    TRISE,0,1	;PORTE<0> COMO SALIDA
    BCF	    TRISE,1,1	;PORTE<1> COMO SALIDA
    ;Config PORTC
    BANKSEL PORTC
    CLRF    PORTC,1	;PORTC<7,0>=0
    CLRF    ANSELC,1	;PORTC DIGITAL
    CLRF    TRISC,1	;PORTC COMO SALIDA
    RETURN

END resetVect




