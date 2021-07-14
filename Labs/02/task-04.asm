.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE  
        ;task-04 
        ; 5 + 8 - (3 + 1) * (9 - 2) / 4 + (2 * 3)
        
        mov ax, 9
        mov bx, 2
        mov cx, 4
        
        sub ax,bx ; (9-2) => ax = 7
        div cx    ; ax/4 => ax = 1, dx = 3        
        mov cx, ax
        
        mov ax, 3
        mov bx, 1
        add ax, bx; (3+1) => 4=ax
        
        mul cx    ; 4 * 1=4=ax
        mov cx,ax
        
        mov ax, 2
        mov bx, 3
        mul bx    ; (2*3) = 6=ax
        
        add cx, ax; 6+4=10 = cx
        
        mov ax, 5
        mov bx, 8
        add ax, bx; 5+8 = 13
        
        sub ax, cx ;ends here
     
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
