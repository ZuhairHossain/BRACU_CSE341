.MODEL SMALL
.STACK 10H
.CODE


MAIN PROC
    
    MOV BH,0
    MOV BL, 10D
    
    INPUT:
    MOV AH, 1
    INT 21H
    CMP AL, 13D
    JNE NUMBER
    
    JMP EXIT
    
    NUMBER:
    SUB AL, 30H
    MOV CL, AL
    MOV AL, BH
    MUL BL
    ADD AL, CL
    MOV BH, AL
    
    JMP INPUT
    
    
  EXIT:
    AND AX,0
    MOV AL, BH
    MOV CL, 10D
    
    MOV BX, 00000H
        
    STORE:
    DIV CL
    MOV [0000H+BX], AH
    ADD BX, 2H
    MOV AH, 0
    CMP AL, 0
    JNE STORE    
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
       
    PRINT:
    SUB BX, 2H
    MOV DL, [0000H+BX]
    ADD DL, 30H
    INT 21H
    CMP BX, 0
    JNE PRINT    
        
    MAIN ENDP
END MAIN