PORTA	EQU	$0000
DDRA 	EQU 	$0004

PORTB EQU $0001
DDRB  EQU $0005

PORTD EQU $0003
DDRD  EQU $0007
        ORG	$EC00
CONFIG  
MOV #3,DDRA 
CLR PORTA
        	MOV #00,DDRB  
        	CLR PORTB
        	MOV #00,DDRD
        	CLR PORTD

INICIO  
BRSET 0,PORTA,BOTAOUP_A		
        	BRSET 1,PORTA,BOTAOUP_B		
        	JSR   NORMAL
        	JMP INICIO

NORMAL:   	JSR FAROLVERM_A       ;FAROL A EM VERMELHO
         		JSR FAROLVERD_B  
          		JSR tempo17s        
          		JSR FAROLAMAR_B
          		JSR tempo3s
          		JSR FAROLVERD_A
          		JSR FAROLVERM_B
          		JSR tempo17s        
          		JSR FAROLAMAR_A
          		JSR tempo3s
         		RTS

BOTAOUP_A:   	BSET 0,PORTD        
             		BSET 1,PORTD        
             		JSR FAROLVERM_A
             		JSR FAROLVERM_B
             		JSR PEDESTRE
             		JMP INICIO
             ;
BOTAOUP_B:  	JSR FAROLVERM_A
             		JSR FAROLVERM_B
             		JSR PEDESTRE
             		JMP INICIO
             ;
tempo17s:   	LDA     #8T      
            		JSR  CRONOMETRO
            		RTS
;
tempo3s:    	LDA     #2T            
            		JSR  CRONOMETRO
            		RTS
;
tempo15s:       	LDA     #7T   		
                		JSR  CRONOMETRO
                		RTS
;
PEDESTRE:        	LDA     #7T
                		JSR  CRONOMETRO
                		RTS
;			
FAROLVERM_A:  
BCLR 0,PORTB   		
               		BCLR 1,PORTB		
               		BSET 2,PORTB		
               		BCLR 0,PORTD
               		BSET 1,PORTD
               		RTS		
;
FAROLAMAR_A:    	BCLR 0,PORTB		
               		BSET 1,PORTB		
               		BCLR 2,PORTB		
               		RTS			

FAROLVERD_A:    
BSET 0,PORTB
               		BCLR 1,PORTB
               		BCLR 2,PORTB
               		BSET 0,PORTD
               		BCLR 1,PORTD
               		RTS
 ;
FAROLVERM_B:    	BSET 3,PORTB		
               		BCLR 4,PORTB
               		BCLR 5,PORTB
               		RTS
;
FAROLAMAR_B:    	BCLR 3,PORTB
               		BSET 4,PORTB		
               		BCLR 5,PORTB
               		RTS
;
FAROLVERD_B:    BCLR 3,PORTB
               BCLR 4,PORTB
               BSET 5,PORTB
               RTS


CRONOMETRO:
FOR1   	LDHX  #65535T			
        	CMP   #00                       
        	DECA                            
        	BNE   LACO2    	
        	RTS                             
FOR2	CPHX     #00		
	BEQ	FOR1                   
        	NOP                             
        	NOP
        	NOP
        	NOP
        	STX $80
        	AIX #-1		
	JMP	FOR2
                                        

	ORG	$FFFE
        DW      CONFIG 
