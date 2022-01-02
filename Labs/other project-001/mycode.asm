.MODEL SMALL

.STACK 100H

.DATA

     a db 'Input: $'
     b db 'Input2: $'
     c db 'Output: $' 
      
.CODE
MAIN PROC
    
    
    MOV AX, @DATA
    MOV DS,AX 
    
    ;CODE
    
    LEA DX, a ; a = column
    MOV AH, 9
    INT 21H
   
    
    MOV AH, 1        
    INT 21H
    
    MOV BH, AL       
    SUB BH, 30H  ; bh = column
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H       
    MOV DL, 0AH
    INT 21H
    
    LEA DX, b   ; b = row
    MOV AH, 9
    INT 21H
    
    
    MOV AH, 1        
    INT 21H
                                                                                                                         
                                                                                                                         
    MOV CH, AL       
    SUB CH, 30H  ; ch = row
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H       
    MOV DL, 0AH
    INT 21H  
    
    LEA DX, c  
    MOV AH, 9
    INT 21H
    
   
    
    MOV CL, 1
    
    MOV AH, 2  
    
    OUTER_LOOP:
    CMP CL, BH         ; ch > bh
    JG exit_outer_loop
    
    MOV DL, 0DH
    INT 21H       
    MOV DL, 0AH
    INT 21H
    
    MOV DH, 1   
    
    INNER_LOOP:
    CMP DH, CH  
    JG exit_inner_loop
    
    
    CMP CL, BH   
    JE print_number
    
    CMP DH, 1
    JE print_number
    
    CMP DH, CH
    JE print_number
    CMP CL, 2
    JGE hollow
    CMP DH, CH                            
    JLE  print_number 
    
    
    print_number:
    MOV DL, DH
    ADD DL, 30H
    INT 21H
    JMP next
    
    hollow:
    MOV DL, ' '
    INT 21H
    
    
    next:
    INC DH
    JMP INNER_LOOP 
    
    exit_inner_loop:
    INC CL
    JMP OUTER_LOOP
    
    exit_outer_loop:
    
    ;EXIT TO DOS
     
    MOV AX, 4C00H
    INT 21H
    MAIN ENDP
END MAIN