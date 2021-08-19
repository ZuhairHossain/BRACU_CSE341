.MODEL SMALL
.STACK 100H
.DATA 
   
a db "ENTER A HEX DIGIT: $"
b db "CORRESPONDING DECIMAL IS $"
c db "REPEAT? : $" 
d db "ILLEGAL CHARACTER, INSERT AGAIN: $"  


.CODE 
MAIN PROC 


MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here   

    welcomeTothecode:
        mov ah,9
        LEA dx,a
        int 21h 

        mov ah,1
        int 21h
        mov bl,al 
        jmp start

    start:
        cmp bl,0
        jge goTOnext  


    goTOnext:
        cmp bl,39h
        jg AtoF

        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h 
        
        mov ah,9
        LEA dx,b
        int 21h

        mov dl,bl
        mov ah,2
        int 21h
        jmp exit 

    extraa:
        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h
        LEA cx,d
        mov dx,cx 
        mov ah,9
        int 21h
        mov ah,1
        int 21h  
        mov bl,al
            jmp start

    AtoF:
        cmp bl,'A'
        je ten
        cmp bl,'B'
        je eleven
        cmp bl,'C'
        je twelve
        cmp bl,'D'
        je thirteen 
        cmp bl,'E'
        je fourteen 
        cmp bl,'F'
        je fifteen 

            jmp extraa
 

    ten:   
        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h

        mov ah,9
        LEA dx,b
        int 21h
 
        mov dl,31h
        mov ah,2
        int 21h
   
        mov dl,30h
        mov ah,2
        int 21h
        jmp exit 


    eleven: 

        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h
        mov ah,9
        LEA dx,b
        int 21h
 
        mov dl,31h
        mov ah,2
        int 21h
   
        mov dl,31h
        mov ah,2
        int 21h
            jmp exit 


    twelve:
        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h

        mov ah,9
        LEA dx,b
        int 21h
 
        mov dl,31h
        mov ah,2
        int 21h
   
        mov dl,32h
        mov ah,2
        int 21h
            jmp exit  

    thirteen:  
        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h

        mov ah,9
        LEA dx,b
        int 21h
 
        mov dl,31h
        mov ah,2
        int 21h
   
        mov dl,33h
        mov ah,2
        int 21h
            jmp exit

    fourteen:   
        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h

        mov ah,9
        LEA dx,b
        int 21h
 
        mov dl,31h
        mov ah,2
        int 21h
   
        mov dl,34h
        mov ah,2
        int 21h
            jmp exit 

    fifteen:   
        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h

        mov ah,9
        LEA dx,b
        int 21h
 
        mov dl,31h
        mov ah,2
        int 21h
   
        mov dl,35h
        mov ah,2
        int 21h
            jmp exit  
 
    exit:  
        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h

        mov ah,9
        LEA dx,c 
        int 21h
               
        mov ah,1
        int 21h 
        mov bl,al
        cmp bl,'k'

        mov ah,2
        mov dl, 0AH
        int 21h   
        mov ah,2
        mov dl, 0DH
        int 21h 
            je welcomeTothecode 

    cmp bl,'K' 
    mov ah,2
    mov dl, 0AH
    int 21h   
    mov ah,2
    mov dl, 0DH
    int 21h
    je welcomeTothecode


;exit to DOS   

               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  






