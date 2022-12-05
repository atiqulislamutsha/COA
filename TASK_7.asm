.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "WELCOME TO MY CALCULATOR !!",0AH,0DH,"$"
MSG2 DB "PLEASE USER ENTER DIGIT 1:",0AH,0DH,"$"
MSG3 DB "PLEASE USER ENTER DIGIT 2:",0AH,0DH,"$"
A DB ?, "OUTUT : ","$"
NUM DB "THANK YOU FOR USING OUR CALCULATOR HAVE A GOOD DAY$" 
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    CALL TASK
    
    LEA DX,NUM
    MOV AH,9
    INT 21H
        
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

TASK PROC
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    
    
    MOV AH,2
    MOV DX,0AH
    INT 21H
    MOV DX,0DH
    INT 21H 
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    MOV AH,2
    MOV DX,0AH
    INT 21H
    MOV DX,0DH
    INT 21H
    
    LEA DX,A
    MOV AH,9
    INT 21H
    
    ADD BL,BH
    ADD BL,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
        
    MOV DX,0AH
    INT 21H
    MOV DX,0DH
    INT 21H
    
    
    
    RET
    
    TASK ENDP

 
END MAIN
