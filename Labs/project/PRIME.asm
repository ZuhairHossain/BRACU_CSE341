.MODEL SMALL
.STACK 100H
.DATA
    PRIME_ db "Prime number $"
    PERFECT db "Perfect Number $"
    NONE_ db "Neither Prime nor Perfect $"
   
.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BH,0
    MOV BL, 10D
    
    INPUT:
    MOV AH, 1
    INT 21H
    CMP AL, 13D
    JNE NUMBER
    
    JMP CHECK
    
    NUMBER:
    SUB AL, 30H
    MOV CL, AL
    MOV AL, BH
    MUL BL
    ADD AL, CL
    MOV BH, AL
    
    JMP INPUT
    
    
    CHECK:
    CMP BH, 1
    JLE NOT_PRIME
    
    MOV CX, 2
    AND AX, 0
    AND DX, 0
    
    MOV AL, BH
    DIV CX    ;DX:AX/CX
    ;REM = DX, VALUE = AX
    MOV CX, AX
    
    
    IS_PRIME:
    CMP CX, 2
    JL PRIME
    AND AX, 0
    AND DX, 0
    MOV AL, BH
    DIV CX     ; DX : AX / CX
    ; REM = DX, VALUE = AX
    DEC CX
    CMP DX, 0
    JE NOT_PRIME
    JMP IS_PRIME
    
    
    PRIME:
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    MOV AH, 9
    LEA DX, PRIME_
    INT 21H
    JMP EXIT
    
    NOT_PRIME:
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    MOV AH,9
    LEA DX, NONE_
    INT 21H
    
    
  EXIT:
    
        
        
    MAIN ENDP
END MAIN