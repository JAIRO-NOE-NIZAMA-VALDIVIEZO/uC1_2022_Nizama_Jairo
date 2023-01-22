;--------------------------------------------------------------
; @file:		P2-Display_7SEG.s
; @brief:		El presente programa permite mostrar valores alfanuméricos (0-9 y A-F) en un display de 7 segmentos
;                       ánodo común,conectados al puerto D[7:0] y se mostrará cada valor con un retardo de 1 segundo entre transición.
;                       Pero los valores a mostrar serán selccionados por la siguiente codición: la primera condición es que
;                       si el pulsador de la placa no está presionado entonces se muestran los valores numéricos del l 0 al 9.    
;                       y como segunda condición tiene que cumplirse que al mantener presionado el pulsador de la placa, se muestran
;                       los valores de A hasta F.   
; @date:		15/01/2023
; @author:		Jairo Noe Nizama Valdiviezo
; @Version and program:	MPLAB X IDE v6.00
;------------------------------------------------------------------
PROCESSOR 18F57Q84
#include "bit_config.inc"  /*config statements should precede project file includes.*/
#include "Retardos.inc"
#include <xc.inc>
    
PSECT resetVect,class=CODE, reloc=2
resetVect:
    goto Main
PSECT CODE
Main:
    CALL Config_OSC                 ;Nos dirige a la configuracion del oscilador
    CALL Config_Port                ;Nos dirige a la configuracion de los puertos a utilizar
    NOP   
Cambio:  
    BTFSC   PORTA,3,0	              ;PORTA<3> = 0? - Button press?--realiza el salto si se presiona el pulsador
    goto    Button_sin_presionar      ;Me lleva a la instruccion del conteo del 1-9
Button_presionado:
    goto    letras                    ;Me dirige al conteo de letras (A-F)
Button_sin_presionar:
    goto    Numeros	              ;Me permite el conteo alfanumérico de los numero del 1 al 9
;
Numeros:
    BANKSEL PORTD            ;Me ubica en el puerto D 
    MOVLW  1000000B          ;MUESTRA EL NUMERO 0 en el display
    MOVWF LATD,1             ;Se guarda el valor de W en el registro LATD 
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;Realiza un salto si PORTA<3>=1, de lo contrario ejecuta la linea siguiente  
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 1111001B           ;MUESTRA EL NUMERO 1 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?, si no se presiona el pulsador realiza el salto
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 0100100B           ;MUESTRA EL NUMERO 2 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener de 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 0110000B           ;MUESTRA EL NUMERO 3 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener de 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1     
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 0011001B           ;MUESTRA EL NUMERO 4 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener de 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 0010010B           ;MUESTRA EL NUMERO 5 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 0000010B           ;MUESTRA EL NUMERO 6 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio
    MOVLW 1111000B           ;MUESTRA EL NUMERO 7 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio
    MOVLW 0000000B           ;MUESTRA EL NUMERO 8 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio
    MOVLW 0010000B           ;MUESTRA EL NUMERO 9 en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSS PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio
    GOTO Numeros             ;Indica que el conteo 0-9 se repite
letras:
    BANKSEL PORTD            ;me ubica en el puerto D
    MOVLW 0001000B           ;MUESTRA LA LETRA A en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSC PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 0000000B           ;MUESTRA LA LETRA B en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSC PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 1000110B           ;MUESTRA LA LETRA C en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSC PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio
    MOVLW 0100001B           ;MUESTRA LA LETRA d en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSC PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio              ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    MOVLW 0000110B           ;MUESTRA LA LETRA E en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSC PORTA,3,1          ;PORTA<3> = 0? - Button press?
    CALL Cambio          
    MOVLW 0001110B           ;MUESTRA LA LETRA F en el display
    MOVWF LATD,1             ;(W)->LATD
    ;4 retardos de 250 ms para obtener 1 segundo entre transicion
    CALL  Delay_250ms,1      
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    CALL  Delay_250ms,1
    BTFSC PORTA,3,1         ;PORTA<3> = 0? - Button press?, si se presiona el pulsador realiza el salto
    CALL Cambio             ;Me dirige a la subrutina que me permita cambiar el modo de conteo
    GOTO letras             ;Indica que el conteo A-F se repite
	
Config_OSC:
    ;configuración del Oscilador interno a una frecuencia de 4Mhz
    BANKSEL OSCCON1
    MOVLW 0x60	           ;seleccionamos el bloque del oscilador interno con un div:1
    MOVWF OSCCON1
    MOVLW 0X02	           ;seleccionamos a una frecuencia de 4Mhz
    MOVWF OSCFRQ
    RETURN
 
Config_Port:	;PORT-LAT-ANSEL-TRIS LED:RF3,  BUTTON:RA3
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,1	;PORTA<7,0> = 0
    CLRF    ANSELA,1	;PORTA DIGITAL
    BSF	    TRISA,3,1	;RA3 COMO ENTRADA
    BSF	    WPUA,3,1	;ACTIVAMOS LA RESISTENCIA PULLUP DEL PIN RA3
    
    ;Config Port D
    BANKSEL PORTD
    SETF    PORTD,1	;PORTC<7,0>=1
    CLRF    ANSELD,1	;PORTC DIGITAL
    CLRF    TRISD,1	;PORTC COMO SALIDA
    RETURN

END resetVect



