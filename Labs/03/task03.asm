.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Enter First Initial: $'
MSG2 DB 'Enter Second Initial: $'
MSG3 DB 'Enter Third Initial: $'
.CODE 


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1 ; Enter First Initial:
    MOV AH,9
    INT 21H
    
    ; 1ST SINGLE INPUT
    MOV AH,1 
    INT 21H
    MOV BH,AL ;MOVING THE VALUE OF AL TO BH
    
    MOV AH,2                                       
    MOV DL,0DH ; LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H 
                
                
    LEA DX,MSG2 ; Enter Second Initial:
    MOV AH,9
    INT 21H
    
    ; 2nd SINGLE INPUT
    MOV AH,1 
    INT 21H
    MOV BL,AL ;MOVING THE VALUE OF AL TO BL
                 
                 
    MOV AH,2                                       
    MOV DL,0DH ; LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,MSG3 ; Enter Third Initial:
    MOV AH,9
    INT 21H
    
    ; 3rd SINGLE INPUT
    MOV AH,1 
    INT 21H
    MOV CL,AL ;MOVING THE VALUE OF AL TO CL
    
    
    ; PRINTING PART
    MOV AH,2                                       
    MOV DL,0DH ; LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H 
     
    MOV AH,2 
    MOV DL,BH  ; 1ST OUTPUT 
    INT 21H
    
    
    MOV AH,2                                       
    MOV DL,0DH ; LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H        
     
    MOV AH,2               
    MOV DL,BL  ; 2ND OUTPUT 
    INT 21H   

    MOV AH,2                                       
    MOV DL,0DH ; LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H                
                   
    MOV DL,CL  ; 3RD OUTPUT 
    INT 21H                
                   
    MAIN ENDP
END MAIN