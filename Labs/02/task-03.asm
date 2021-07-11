.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE 
          
        ;task-03 - Y*X/Z
        
        mov ax , 9  ; X = 9
        mov bx , 3  ; Z = 3
        div bx      ; X/Z = 3
        
        mov ax, bx  ; ax=3
        mov bx, 5   ; Y=5
        mul bx      ; ax = ax * 5
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
            
            
            