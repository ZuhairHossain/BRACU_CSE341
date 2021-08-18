.MODEL SMALL
.STACK 100H
.DATA
temp dw ?
sum dw 0
       
.CODE
MAIN PROC


    ;MOV AX,@DATA
    ;MOV DS,AX

    mov ah,1         ; 1st user input
    int 21h
    mov ah, 0h
    mov cx, ax
    sub cx, 30h        
        
    mov ah,1
    int 21h
    mov ah, 0h          ; 2nd user input
    mov dx, ax
    sub dx, 30h
    
    mov ax, cx
    mov temp, dx
    
    mov bx,0h
    
    start:
        cmp bx, ax
        jge print
        add sum, dx
        inc bx
    loop start
    
    print:
    add sum, 30h
    mov dx, sum
    mov ah,2
    int 21h
    
   exit:
        MOV AX,4C00H
        INT 21H

MAIN ENDP
   END MAIN