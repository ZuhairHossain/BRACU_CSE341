.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE  
        
        
        ;TASK 02 Swap two numbers using ADD/SUB 
        mov ax, 5
        mov bx, 10
        mov cx, 30
        add ax, bx ; (A+B)
        sub cx, ax ; C - (A+B)
        mov ax, cx ; 
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN