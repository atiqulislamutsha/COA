 .MODEL SMALL
.STACK 100H
.DATA
A DB "WELCOME TO MY CALCULATOR",0DH,0AH,"$"
B DB "PLEASE ENTER A HEX DIGIT (A-F) ",0DH,0AH,"$" 
C DB 0DH,0AH,"In decimal it is:  $"
D DB "Thank you for using my calculator ",0DH,0AH,"$"
E DB "Have a good day ",0DH,0AH,"$"

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9 
    LEA DX,A
    INT 21H
    LEA DX,B
    INT 21H
    
    MOV AH,1
    INT 21H
    
   
    
    MOV BL,AL
    
    CALL TASK
     
    MOV AH,9 
    LEA DX,D
    INT 21H 
     
    MOV AH,9 
    LEA DX,E
    INT 21H
    
    
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP


TASK PROC
     
     
    MOV AH,9 
    LEA DX,C
    INT 21H
    
    SUB BL,17 
    
    MOV AH,2
    MOV DL,49
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
   
    
    RET
     
END MAIN
    