.MODEL SMALL
.STACK 100H
.DATA
.CODE 


MAIN PROC
    
    MOV AH,1 ; 1ST SINGLE INPUT
    INT 21H
    MOV BL,AL ;MOVING THE VALUE OF AL TO BL 
    
    MOV AH,2                                       
    MOV DL,0DH ;LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AL, 32
    ADD BL,AL
    
    MOV DL,BL  ; OUTPUT 
    INT 21H
    

    MAIN ENDP
END MAIN