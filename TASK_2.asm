.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER A CHARACTER $'
    MSG2 DB 'ASCII FORM $'
    A DB ?,'THE BINARY IS :',' $' 
    NUM DB 'NUMBER OF 1 BITS  $'
    
.CODE


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BH,0
    MOV CX,8
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV AL,AL
    MOV BL,AL
    
    MOV AH,2
    MOV DX,0AH
    INT 21H
    MOV DX,0DH
    INT 21H
    
    CALL TASK
    MOV CL,BH
    XOR DX,DX
    XOR AL,AL
    
    LEVEL:
    
    INC AL
    LOOP LEVEL
    ADD AL,48
    MOV AH,2
    MOV DL,AL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    
  TASK PROC
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,2
    
    WHILE:
    
    ROL BL,1
    JNC ZERO
    MOV DL,"1" 
    INC BH
    JMP DISPLAY
    
    ZERO:
    MOV DL,"0"
    JMP DISPLAY
    
    DISPLAY:
    INT 21H
    LOOP WHILE 
    
    MOV DX,0AH
    INT 21H
    MOV DX,0DH
    INT 21H  
    
    LEA DX,NUM
    MOV AH,9 
    
    INT 21H
    RET
    TASK ENDP 
  
END MAIN
  