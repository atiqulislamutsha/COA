.MODEL SMALL
.STACK 100H
.DATA
  MSG1 DB  'HI, I am from main procedure $'
  MSG2 DB 0DH,0AH, 'HI, I am from second procedure $'
  MSG3 DB 0DH,0AH, 'HI, I am from third procedure $' 
  
.CODE
 
 MAIN PROC
   MOV AX,@DATA
   MOV DS,AX
   
   MOV AH,9
   LEA DX,MSG1
   INT 21H
   
   CALL SECOND 
   CALL THIRD
   
   MOV AH,4CH
   INT 21H
   MAIN ENDP
 
 SECOND PROC
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    RET 
    
    SECOND ENDP
 
 THIRD PROC
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H 
    
    RET 
    
    THIRD ENDP
 
 END MAIN
     
  