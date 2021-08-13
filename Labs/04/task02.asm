.MODEL SMALL
.STACK 100
.DATA
    MSG1 DB '1st input: $'
    MSG2 DB '2nd input: $'
    MSG3 DB 'Result is $'
    DIVI  DB 'Divisible $'
    NON_DIV DB 'Not divisible $'
 
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     ; for 1st input {
     
     LEA DX,MSG1 ; 1st input 
     MOV AH,9
     INT 21H
     
     MOV AH,1 ; 
     INT 21H
     SUB AL,48
     MOV BL,AL ; MOVING THE VALUE OF AL TO BL
    
     MOV AH,2    ; line break
     MOV DL,0DH
     INT 21H
     MOV DL,0AH
     INT 21H
     
     ; }
     
     
     ; for 2nd input {
     
     LEA DX,MSG2 ; 2nd side 
     MOV AH,9
     INT 21H
     
     MOV AH,1 ; 
     INT 21H
     SUB AL,48
     MOV DL,AL ; MOVING THE VALUE OF AL TO DL
     ; }
     
    
     ; ASSIGN DIVISOR
     MUL BL
     MOV CL, 2
     MOV DX, AX
     DIV CL
     
     ; IF REMAINDER == 0?
     CMP AH, 0
        JE CHECK_5
        JMP NONE
     
     ; NOT DIV BY 2; CHECK WITH 5
     CHECK_5:
        MOV CL, 5
        MOV AX, DX
        DIV CL
        
        CMP AH, 0
            JE DIVISIBLE
            JMP NONE
            
     DIVISIBLE:
        MOV AH,2    ; line break
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX, DIVI
        MOV AH, 9
        INT 21H
        JMP EXIT
         
     NONE:
        MOV AH,2    ; line break
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX, NON_DIV
        MOV AH, 9
        INT 21H
        JMP EXIT   
                
     ; EXIT POINT       
     EXIT:
     MOV AX,4C00H
     INT 21H
     
     MAIN ENDP
END MAIN



