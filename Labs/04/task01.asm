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
    MOV BH,AL ; NO MOVING THE VALUE OF AL TO ANYWHERE
     
    MOV AH,2                                       
    MOV DL,0DH ;LINE BREAK
    INT 21H
    MOV DL,0AH
    INT 21H

    ; a = bl
    ; b = cl
    ; c = bh
    
    
    ;if al < bl
    CMP BL, cL
    JLE  result_a_small    ; if (a < b)
    JMP result_b_small    ; else b < a
    
        result_a_small:
               cmp bl, bh
               jle set_a    ; if (a < c) set => a 
               jmp set_c
               
        result_b_small:
               cmp cl, al  ; if b < c
               jle set_b
               jmp set_c   ; else
               
                
        set_a:
        mov ah,2
        mov dl, bl  ; OUTPUT  a
        int 21h
        jmp exit
        
        set_b:
        mov ah,2
        mov dl, cl  ; OUTPUT   b
        int 21h
        jmp exit
        
        set_c:
        mov ah,2
        mov dl, bh  ; OUTPUT    c
        int 21h
        jmp exit

        exit:  
    

    MAIN ENDP
END MAIN
