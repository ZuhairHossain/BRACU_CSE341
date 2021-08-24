.MODEL SMALL
.STACK 100H
.DATA 

array db 5 dup(?)

;variables 
                  
a db "Enter 5 numbers: $" 
b db "Sorted Order: $ "

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
    ; enter your code here
    
    lea dx,a
    mov ah,9
    int 21h    
    
    mov cx,5   ; [input in array]
    mov si,0
    mov ah,1
    
    start_loop:
    
    int 21h
    mov array[si],al
    add si,1
    
    loop start_loop
    
    ; sorting the array
    
    mov dl,0  
    
    nested1:  
    
    cmp dl,3
    jg end
    
    mov cx,4
    mov si,0
    mov di,1
    
    nested2:
    mov al,array[si]
    mov bl,array[di]
    cmp al,bl
    jg swap   
    
    jmp ignore
                   
    swap:
    mov array[si],bl         
    mov array[di],al
    
    ignore:
    add si,1
    add di,1 
    
    loop nested2
    
    add dl,1
    
    jmp nested1  
    
    end:
    
    ; printing
    
    mov ah,2
    mov dl,0DH
    int 21h
    mov dl,0AH
    int 21h
    
    lea dx,b
    mov ah,9
    int 21h 
    
    mov cx,5
    mov si,0
    mov ah,2
    
    print:
    mov dl,array[si]
    int 21h
    add si,1
    loop print


;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  



