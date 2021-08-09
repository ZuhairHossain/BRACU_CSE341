.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB '1st input: $'
MSG2 DB '2nd input: $'
MSG3 DB '3rd input: $'
.CODE 


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1 ; 1st input: 
    MOV AH,9
    INT 21H
    
    MOV AH,1 ; 
    INT 21H
    MOV BL,AL ;MOVING THE VALUE OF AL TO BL
      
    MOV AH,2                                       
    MOV DL,0DH ;LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H
   
       
    LEA DX,MSG2 ; 2nd input:
    MOV AH,9
    INT 21H
    
    MOV AH,1 ;  
    INT 21H
    MOV CL,AL ;MOVING THE VALUE OF AL TO CL
                   
    MOV AH,2                                       
    MOV DL,0DH ;LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H

                   
    LEA DX,MSG3 ; 3rd input: 
    MOV AH,9
    INT 21H
    
    MOV AH,1 ;
    INT 21H
    ;MOV CL,AL ; NO MOVING THE VALUE OF AL TO ANYWHERE
     
    MOV AH,2                                       
    MOV DL,0DH ;LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H

    
    ;if al < bl
    CMP AL, BL
    JL  result_al_small    ; if (al < bl)
    JMP result_bl_small   
    jmp exit
        result_al_small:
               cmp cl, al
               jl set_c    ; if (cl < al) set => c 
               jmp set_a   ; else set => a
               jmp exit
               
        result_bl_small:
               cmp bl, cl
               jl set_b
               jmp set_c
               jmp exit
        
        set_c:
        mov dl, al  ; OUTPUT 
        int 21h
        jmp exit
        
        set_a:
        mov dl, bl  ; OUTPUT 
        int 21h
        jmp exit
        
        set_b:
        mov dl, cl  ; OUTPUT 
        int 21h
        jmp exit
        
        exit:  
    

    MAIN ENDP
END MAIN