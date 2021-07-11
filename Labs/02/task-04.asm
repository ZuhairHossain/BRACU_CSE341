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
        
        mov ax, 3
        mov bx, 1
        mov cx, 9
        mov dx, 2
    
        add ax,bx ; (3+1)
    
        mov di,ax ; di = 4
    
        sub cx,dx ; (9-2)
    
        mov si,cx ; si = 7
    
        mov ax,3
        mul dx    ;  (2*3)
        mov dx,ax ; dx = 6
    
        mov ax,4
        mov bx, si
        div bx    ; bx =  (9-2) / 4
        mov bx,ax 
    
        mov cx, di; cx = 4
    
        mul bx; bx * cx 
    
        mov ax, 8 
        sub ax,bx  ; 8 - (3 + 1) * (9 -2) / 4
    
        mov cx,5
        add ax,cx  ; 5 + 8 - (3 + 1) * (9 -2) / 4  
        add ax,dx  ;
    
        mov ax, di ; 5 + 8 - (3 + 1) * (9 -2) / 4 + (2 * 3)
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
