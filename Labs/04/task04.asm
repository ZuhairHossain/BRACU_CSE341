.MODEL SMALL
.STACK 100
.DATA
    MSG1 DB '1st side: $'
    MSG2 DB '2nd side: $'
    MSG3 DB '3rd side: $'
    YES  DB 'Y $'
    NO   DB 'N $'
    A DW ?
    B DW ?
    C DW ? 
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     ; for 1st side input {
     
     LEA DX,MSG1 ; 1st side 
     MOV AH,9
     INT 21H
     
     MOV AH,1 ; 
     INT 21H
     SUB AL,48
     MOV A,AX ; MOVING THE VALUE OF AX TO A
    
     MOV AH,2    ; line break
     MOV DL,0DH
     INT 21H
     MOV DL,0AH
     INT 21H
     
     ; }
     
     
     ; for 2nd side input {
     
     LEA DX,MSG2 ; 2nd side 
     MOV AH,9
     INT 21H
     
     MOV AH,1 ; 
     INT 21H
     SUB AL,48
     MOV B,AX ; MOVING THE VALUE OF AX TO B
    
     MOV AH,2    ; line break
     MOV DL,0DH
     INT 21H
     MOV DL,0AH
     INT 21H
     
     ; }
     
     
     ; for 3rd side input {
     
     LEA DX,MSG3 ; 3rd side 
     MOV AH,9
     INT 21H
     
     MOV AH,1 ; 
     INT 21H
     SUB AL,48
     MOV C,AX ; MOVING THE VALUE OF AX TO C
    
     MOV AH,2    ; line break
     MOV DL,0DH
     INT 21H
     MOV DL,0AH
     INT 21H
     
     ; }
     
     MOV BX, A
     MOV CX, B
     MOV DX, C
     
     ; CHECK POINT-01   (if a + b > c)
     ADD BL, CL
     CMP BL, DL
        JG small_c
        JMP print_no
     
     
     ; CHECK POINT-02
     small_c:
       MOV BX, A
       ADD BL, DL
       CMP BL, CL  ; (if a + c > b)
        JG small_b
        JMP print_no
     
        
     ; CHECK POINT-03
     small_b:
        MOV BX, A
        ADD CL, DL
        CMP CL, BL
        JG print_yes
        JMP print_no
     
     ; PRINTING PHASE
     print_yes:
        MOV AH, 9
        LEA DX, YES
        INT 21H
        JMP EXIT
        
     print_no:
        MOV AH, 9
        LEA DX, NO
        INT 21H
        JMP EXIT
        
     ; EXIT POINT       
     EXIT:
     MOV AX,4C00H
     INT 21H
     MAIN ENDP
END MAIN



