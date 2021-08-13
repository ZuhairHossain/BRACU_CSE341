.MODEL SMALL
.STACK 100
.DATA
    MSG31 DB '31$'
    MSG28 DB '28$'
    MSG30 DB '30$'
    MSG_none DB 'Value is not between 1 to 6 $' 
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     
     MOV AH,1 ; 
     INT 21H
     ;SUB AL,48
     
     ;january
     cmp al, 31h ;(al == 1)
     je t_31
     
     cmp al, 32h ; al == 2
     je t_28
     
     cmp al, 33h ; al == 3
     je t_31
     
     cmp al, 34h ; al == 4
     je t_30
     
     cmp al, 35h ; al == 5
     je t_31
     
     cmp al, 36h ; al == 6
     je t_30
     
     jmp wrong
     
     
     t_28:
        MOV AH,2    ; line break
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX, MSG28
        MOV AH, 9
        INT 21H
        JMP EXIT     
     
     t_31:
        MOV AH,2    ; line break
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX, MSG31
        MOV AH, 9
        INT 21H
        JMP EXIT
        
     t_30:
        MOV AH,2    ; line break
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX, MSG30
        MOV AH, 9
        INT 21H
        JMP EXIT
     
     wrong:
        MOV AH,2    ; line break
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX, MSG_none
        MOV AH, 9
        INT 21H
        JMP EXIT      
     
                      
     ; EXIT POINT       
     EXIT:
     MOV AX,4C00H
     INT 21H
     
     MAIN ENDP
END MAIN



