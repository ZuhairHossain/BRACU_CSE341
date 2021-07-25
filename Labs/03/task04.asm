.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "ENTER A HEX DIGIT: $"
MSG2 DB "IN DECIMAL IT IS $"
.CODE 
   

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, MSG1 ; ENTER A HEX DIGIT:
    MOV AH, 9
    INT 21H
                ; INPUT A VALUE
    MOV AH, 1
    INT 21H
    MOV BH, AL ; MOVING THE VALUE FROM AL TO BH
    
    MOV AH,2                                       
    MOV DL,0DH ; LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H            
    
    LEA DX, MSG2 ; IN DECIMAL IT IS:
    MOV AH, 9
    INT 21H
                 ; 1ST DECIMAL DIGIT PRINT
    MOV AH, 2
    MOV DL, 31H
    INT 21H
    
    MOV AH, 2    ; 2ND DECIMAL DIGIT PRINT
    SUB BH, 11H
    MOV DL, BH
    INT 21H
        
EXIT:        

    MAIN ENDP
END MAIN
