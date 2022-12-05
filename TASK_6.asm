.MODEL SMALL
.STACK 100H
.DATA
 MSG1 DB 0DH,0AH,'ENTER THE SMALL CHARACTER $'
 MSG2 DB 0DH,0AH,'OUTPUT IS $'
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H 
    
     MOV AH,1
    INT 21H
    MOV BL,AL 
    CALL TASK
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP


TASK PROC
   
    SUB BL,32
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    RET
     
END MAIN