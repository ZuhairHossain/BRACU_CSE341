.MODEL SMALL
 
.STACK 100H

.DATA 
                               
n db 12 dup(?) 
                              
;variables 
 
    a db "Enter Name: $" 
    b db "Output: $"


    .CODE 
    MAIN PROC 
    
    ;initialize DS
    
    MOV AX,@DATA 
    MOV DS,AX 
    
    ; TAKING MY NAME AS INPUT
         
    lea dx,a
    mov ah,9
    int 21h 
    
    mov cx,12
    mov si,0 
    mov ah,1   
    
    start: 
    int 21h  
    mov n[si],al
    add si,1
    loop start  
    
    ;PRINTING MY NAME AS IT WAS WANTED IN THE QUESTION:
    
    mov ah,2
    mov dl,0DH
    int 21h
    mov dl,0AH
    int 21h  
    
    lea dx,b
    mov ah,9
    int 21h 
    
    
    mov cx,12
    mov si,0 
    mov ah,2 
    
    loop_start:
    cmp n[si],41h  
    jge capital_second_check 
    
    cmp n[si],20h
    je print
       
    
    capital_second_check:
    cmp n[si],5Ah
    jle smallaization
    jmp small_second_check
    
    
    smallaization:
    add n[si],20h 
    jmp print 
    
    
    small_second_check:
    cmp n[si], 7Ah
    jle capitalization
    
    capitalization:
    sub n[si],20h
    jmp print
    
    print:
    mov dl,n[si]  
    mov ah,2
    int 21h
    add si,1
    
    loop loop_start
 

;exit to DOS   
exit:
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  



