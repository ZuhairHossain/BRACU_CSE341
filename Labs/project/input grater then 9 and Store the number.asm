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
    MAIN ENDP
END MAIN