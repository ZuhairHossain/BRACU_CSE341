.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'Enter a number$'
.CODE 


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG ; Enter a number
    MOV AH,9
    INT 21H
    
    MOV AH,2                                       
    MOV DL,0DH ;LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,1 ; SINGLE INPUT
    INT 21H
    MOV BL,AL ;MOVING THE VALUE OF AL TO BL 
    
    MOV AH,2                                       
    MOV DL,0DH ;LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AL, 1
    SUB BL,AL
    
    MOV DL,BL  ; OUTPUT 
    INT 21H
    

    MAIN ENDP
END MAIN