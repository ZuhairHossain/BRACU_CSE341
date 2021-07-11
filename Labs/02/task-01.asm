	
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
         
        ;TASK 01 Swap two numbers using ADD/SUB
         
        mov ax , 5
        mov bx , 10
        add ax, bx 
        neg bx
        add bx, ax
        sub ax , bx
   
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
