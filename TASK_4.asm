.MODEL SMALL
.STACK 100H
.DATA
MSG0 DB "WELCOME USER",0AH,0DH,"$"
MSG1 DB "PLEASE USER ENTER LETTER 1:",0AH,0DH,"$"
MSG2 DB "PLEASE USER ENTER LETTER 2:",0AH,0DH,"$"
MSG3 DB "PLEASE USER ENTER LETTER 3:",0AH,0DH,"$"

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG0
    MOV AH,9
    INT 21H
    
    CALL TASK
        
    MOV AH,4CH
    INT 21H
    MAIN ENDP

TASK PROC
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
       
    
    RET
    
    TASK ENDP

 
END MAIN