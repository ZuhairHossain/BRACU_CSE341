.MODEL SMALL
.STACK 100H
.DATA

a db ?
b db ? 
i db ?
x db 3   ; divisible by 3
       
.CODE
MAIN PROC


    MOV AX,@DATA
    MOV DS,AX

    mov ah,1         ; 1st user input
    int 21h

    sub al,30h       
    mov a,al         
    mov i,al        
        
    mov ah,1
    int 21h          ; 2nd user input

    sub al,30h
    mov b,al             


    MOV AH,2      
    MOV DL,0DH    
    int 21h       
    MOV DL,0AH    
    int 21h   


    mov cl,b

    check: 
        cmp i,cl
        jg exit  

    mov al,i
    mov ah,0h
    div x               
    mov ch,ah  
        
    cmp ch,0         ;if (i%4==0)
    je print
    inc i
    jmp check

    print:
        mov ah,2
        mov dl,i
        add dl,30h
        int 21h
        inc i
        jmp check


    exit:
        MOV AX,4C00H
        INT 21H

MAIN ENDP
   END MAIN