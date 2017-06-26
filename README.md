# semaforoAssembly

Coding for a Motorola HC08J

On this project I use a simple commands like: <br />
EQU <br />
MOV P1,P2 (Move P1 to P2) <br />
CLR P1 (Set memory value of P1 to 00000)<br />
BRSET <br />
JSR  P1   (Jump to Subroutine alocated on P1)<br />
RTS   P1 (Return to Subroutine alocated on P1)<br />
LDA <br />
BCLR <br />
LDHX<br />
DECA<br />
NOP<br />
JMP<br />

###
In this code sequence, I burned processing time by passing as the parameter inside the accumulator the time to be counted.
CRONOMETRO:
FOR1   	LDHX  #65535T			<br />
        	CMP   #00         (Compare if the value on the Accumulator is equal 0)              <br />
        	DECA                            <br />
        	BNE   FOR2    	<br />
        	RTS                   <br />          
FOR2	    CPHX     #00		<br />
	        BEQ	FOR1              <br />     
					NOP <br />    
        	NOP<br />
        	NOP<br />
        	NOP<br />
        	STX $80<br />
        	AIX #-1		<br />
	JMP	FOR2<br />
