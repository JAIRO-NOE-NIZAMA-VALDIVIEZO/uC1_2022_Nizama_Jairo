;--------------------------------------------------------------
; @file:		Retardos.inc
; @brief:		Esta es una librería de retardos en donde se ha implementado diferentes valores de delays.
;			Esta librería está implementada con un oscilador interno de frecuencia de clock de 4 MHZ,por lo tanto un Tcy= 1us.
; @date:		09/01/2023
; @author:		Jairo Noe Nizama Valdiviezo
; @Version and program:	MPLAB X IDE v6.00
;------------------------------------------------------------------
    
PSECT udata_acs
contador1: DS 1	          ;reserva 1 byte en access ram
contador2: DS 1	          ;reserva 1 byte en access ram
    
PSECT code
;T=(6+4k)us
Delay_10us:			              ;2Tcy--CALL
    MOVLW 1		                      ;1Tcy
    MOVWF contador1,0	                      ;1Tcy
Delay_Loop10us:		    
    NOP				              ;k*Tcy
    DECFSZ contador1,1,0                      ;(k-1) +3 Tcy =k+2
    GOTO   Delay_Loop10us	              ;(k-1)*2Tcy=2k-2
    RETURN			              ; 2Tcy
;T=(3k+7)us
Delay_25us:		                      ;2Tcy
    MOVLW 6		                      ;1Tcy
    MOVWF contador1,0	                      ;1Tcy
    NOP				              ;k*Tcy
Delay_Loop25us:
    DECFSZ contador1,1,0	              ;(k-1) +3 Tcy =k+2
    GOTO   Delay_Loop25us                     ;(k-1)*2Tcy=2k-2
    RETURN		                      ;2Tcy
;T=(6+4k)us
Delay_50us:		                      ;2Tcy
    MOVLW 11		                      ;1Tcy
    MOVWF contador1,0	                      ;1Tcy
Delay_Loop50us:
    NOP				              ;k *Tcy
    DECFSZ contador1,1,0	              ;(k-1) +3 Tcy=2k-2
    GOTO   Delay_Loop50us	              ;(k-1)*2Tcy =2k-2
    RETURN		                      ;2Tcy
;T=(3k+7)us
Delay_100us:		                      ;2tcy
    MOVLW 31		                      ;1tcy
    MOVWF contador1,0	                      ;1tcy 
    NOP				              ;k*Tcy
Ext_loop100us: 
    DECFSZ contador1,1,0                      ;(k-1) +3 tcy =k+2
    GOTO   Ext_loop100us                      ;(k-1)*2tcy=2k-2
    RETURN			              ;2tcy
;T=(3k+8)us
Delay_200us:			              ;2Tcy
    MOVLW 64		                      ;1Tcy
    MOVWF contador1,0	                      ;1Tcy
    NOP				              ;k*Tcy
    NOP				              ;k*Tcy
Delay_Loop200us:    
    DECFSZ contador1,1,0                      ;(k-1) +3 Tcy =k+2
    GOTO   Delay_Loop200us                    ;(k-1)*2Tcy=2k-2
    RETURN		                      ;2Tcy
;T=(3k+7)us
Delay_250us:			              ;2Tcy
    MOVLW 81		                      ;1Tcy
    MOVWF contador1,0	                      ;1Tcy
    NOP				              ;k*Tcy
Delay_Loop250us:
    DECFSZ contador1,1,0                      ;(k-1)+3Tcy =k+2
    GOTO   Delay_Loop250us	              ;(k-1)*2Tcy=2k-2
    RETURN		                      ;2Tcy
;T=(3k+8)us
Delay_500us:		                      ;2Tcy
    MOVLW 164		                      ;1Tcy
    MOVWF contador1,0	                      ;1Tcy
    NOP				              ;k*Tcy
    NOP				              ;k*Tcy
Delay_Loop500us:
    DECFSZ contador1,1,0                      ;(k-1)+3Tcy =k+2
    GOTO   Delay_Loop500us                    ;(k-1)*2Tcy=2k-2
    RETURN		                      ;2Tcy
;retardo de 1 ms
Delay_1ms:		                      ;2Tcy
    MOVLW 1		                      ;1Tcy-----k2
    MOVWF contador2,0	                      ;1Tcy
Ext_Loop_1ms:			    
    MOVLW   249		                      ;1 Tcy----K1
    MOVWF   contador1,0	                      ;1 Tcy
Int_Loop:			    
    NOP			                      ;k1*Tcy
    DECFSZ  contador1,1,0	              ;(k1-1)+3Tcy
    GOTO    Int_Loop	                      ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                     
    GOTO    Ext_Loop_1ms                      ;SALTO A LA ETIQUETA
    RETURN			              ;2 TCY
;retardo de 5 ms
Delay_5ms:		                      ;2Tcy
    MOVLW 5	                              ;1Tcy-----k2
    MOVWF contador2,0	                      ;1Tcy
Ext_Loop_1ms1:			     
    MOVLW   249		                      ;1 Tcy----K1
    MOVWF   contador1,0	                      ;1 Tcy
Int_Loop1:			    
    NOP			                      ; k1*Tcy
    DECFSZ  contador1,1,0	              ;(k1-1)+3Tcy 
    GOTO    Int_Loop1	                      ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                     
    GOTO    Ext_Loop_1ms1                     
    RETURN			              ;2 TCY
;retardo de 10 ms
Delay_10ms:		                      ;2Tcy
    MOVLW 10		                      ;1Tcy-----k2
    MOVWF contador2,0                         ;1Tcy
Ext_Loop_1ms2:			     
    MOVLW   249		                      ;1 Tcy----K1
    MOVWF   contador1,0	                      ;1 Tcy
Int_Loop2:			    
    NOP			                      ; k1*Tcy
    DECFSZ  contador1,1,0	              ;(k1-1)+3Tcy
    GOTO    Int_Loop2	                      ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                     
    GOTO    Ext_Loop_1ms2	              
    RETURN			              ;2 TCY
;retardo de 25 ms
Delay_25ms:		                      ;2Tcy
    MOVLW 25		                      ;1Tcy-----k2
    MOVWF contador2,0	                      ;1Tcy
Ext_Loop_1ms3:			    
    MOVLW   249		                      ;1 Tcy----K1
    MOVWF   contador1,0	                      ;k Tcy
Int_Loop3:			    
    NOP			                      ; k1*Tcy
    DECFSZ  contador1,1,0	              ;(k1-1)+3Tcy
    GOTO    Int_Loop3	                      ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                     
    GOTO    Ext_Loop_1ms3	              
    RETURN			              ;2 TCY
;retardo de 50 ms
Delay_50ms:		                      ;2Tcy
    MOVLW 50		                      ;1Tcy-----k2
    MOVWF contador2,0	                      ;1Tcy
Ext_Loop_1ms4:			    
    MOVLW   249		                      ;1 Tcy----K1
    MOVWF   contador1,0	                      ;k Tcy
Int_Loop4:			    
    NOP			                      ; k1*Tcy
    DECFSZ  contador1,1,0	              ;(k1-1)+3Tcy
    GOTO    Int_Loop4	                      ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                     
    GOTO    Ext_Loop_1ms4                     
    RETURN			              ;2 TCY
;retardo de 100 ms
Delay_100ms:		                      ;2Tcy
    MOVLW 100		                      ;1Tcy-----k2
    MOVWF contador2,0	                      ;1Tcy
Ext_Loop_1ms5:			     
    MOVLW   249		                      ;1 Tcy----K1
    MOVWF   contador1,0	                      ;1 Tcy
Int_Loop5:			     
    NOP			                      ; k1*Tcy
    DECFSZ  contador1,1,0	              ;(k1-1)+3Tcy
    GOTO    Int_Loop5	                      ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                     
    GOTO    Ext_Loop_1ms5	              
    RETURN			              ;2 TCY
;retardo de 200 ms
Delay_200ms:			              ;2Tcy
    MOVLW 200		                      ;1Tcy-----k2
    MOVWF contador2,0		              ;1Tcy
Ext_Loop_1ms6:			     
    MOVLW   249		                      ;1 Tcy----K1
    MOVWF   contador1,0	                      ;1 Tcy
Int_Loop6:			    
    NOP			                      ; k1*Tcy
    DECFSZ  contador1,1,0	              ;(k1-1)+3Tcy
    GOTO    Int_Loop6	                      ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                     
    GOTO    Ext_Loop_1ms6	              
    RETURN			              ;2 TCY
;retardo de 250 ms
Delay_250ms:		                       ;2Tcy
    MOVLW 250			               ;1Tcy-----k2
    MOVWF contador2,0	                       ;1Tcy
Ext_Loop_1ms7:			     
    MOVLW   249		                       ;1 Tcy----K1
    MOVWF   contador1,0	                       ;1 Tcy
Int_Loop7:			    
    NOP			                       ; k1*Tcy
    DECFSZ  contador1,1,0	               ;(k1-1)+3Tcy
    GOTO    Int_Loop7	                       ;(k1-1)*2Tcy
    DECFSZ  contador2,1,0                      
    GOTO    Ext_Loop_1ms7	               
    RETURN			               ;2 TCY

