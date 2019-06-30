Erase_ghost PROC
    mov ecx, 0
    mov edx, 0
    mov tmp, edx

    .WHILE ecx < Ghost_num +1

            mov al, Ghost[edx].col
            mov ah, Ghost[edx].row  
            
            mGotoxy al, ah 
            mov  al,' '     
            call WriteChar
                
            mov al,Ghost[edx].col
            mov ah,Ghost[edx].row
            mGotoxy al, ah   
                
            INVOKE Array_val, Ghost[edx].row, Ghost[edx].col                       
            call WriteChar
           
            add edx, SIZEOF Ghost_info 
            mov tmp, edx  
   
            inc ecx
    .ENDW
    ret
Erase_ghost ENDP  
    
Ghost_direction PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov edx, tmp    
        mov al, up
        mov Ghost[edx].up, al

        mov al, down
        mov Ghost[edx].down, al

        mov al, left
        mov Ghost[edx].left, al      
        
        mov al, right
        mov Ghost[edx].right, al        
        ret
Ghost_direction ENDP    
    
Ghost_block PROC
        mov ecx, 0
        mov edx, 0
        mov tmp, edx

        .WHILE ecx < Ghost_num 
            mov al, col
            mov ah, row
            .IF Ghost[edx].col == al && Ghost[edx].row == ah
                .IF specialPower != 0 
                    
                    mov al,Ghost[edx].col
                    mov ah,Ghost[edx].row  
            
                    mGotoxy al, ah 
                    mov  al,' '     
                    call WriteChar
                    
                    mov Ghost[edx].col, 23
                    mov Ghost[edx].row, 9
                    mov Ghost[edx].delay, 50
                    INVOKE Ghost_direction, 0,0,0,1                 
                    mov al, 0
                    ret

                .ELSE
                    mov al, 1
                    dec Life
                    ret
                .ENDIF
            .ENDIF
   
            add edx, SIZEOF Ghost_info
            mov tmp, edx     
            inc ecx
        .ENDW
        mov al, 0 
        ret
Ghost_block ENDP
   
Ghost_init PROC 
        mov ecx, 0
        
        mov edx, 0
        mov tmp, edx
        
        .WHILE ecx < Ghost_num  
            call Randomize
            mov  eax,1
            call RandomRange
            
            .IF eax == 0
                INVOKE Ghost_direction, 0,0,1,0
            .ELSE
                INVOKE Ghost_direction, 0,0,0,1
            .ENDIF
            
            mov edx, tmp
            
            mov  eax,30
            call RandomRange
			mov Ghost[edx].delay, ax
            add edx, SIZEOF Ghost_info 
            mov tmp, edx            
                
            inc ecx
        .ENDW
        ret
Ghost_init ENDP
   
Ghost_load PROC   

        mov ecx, 0  
        mov edx, 0
        mov tmp, edx
        
        .WHILE ecx < Ghost_num        
            .IF Ghost[edx].delay != 0
                dec Ghost[edx].delay
            .ELSE            
                .IF Ghost[edx].left
                    INVOKE Blocky, Ghost[edx].col, Ghost[edx].row, -1, 0
                    .IF ah
                        mov edx, tmp
                        dec Ghost[edx].col
                    .ENDIF
                .ELSEIF Ghost[edx].right
                    INVOKE Blocky, Ghost[edx].col, Ghost[edx].row, 1, 0
                    .IF ah
                        mov edx, tmp                     
                        inc Ghost[edx].col
                    .ENDIF
                .ELSEIF Ghost[edx].up
                    INVOKE Blocky, Ghost[edx].col, Ghost[edx].row, 0, -1
                    .IF ah
                        mov edx, tmp                     
                        dec Ghost[edx].row
                    .ENDIF
                .ELSEIF Ghost[edx].down
                    INVOKE Blocky, Ghost[edx].col, Ghost[edx].row, 0, 1
                    .IF ah
                        mov edx, tmp                     
                        inc Ghost[edx].row
                    .ENDIF
                .ENDIF    
                
                mov edx, tmp
                
                .IF ah == 0         
                    call Randomize
                    mov  eax,2
                    call RandomRange
                
                    mov edx, tmp
                    
                    .IF Ghost[edx].down == 1
                        .IF eax
                            INVOKE Ghost_direction, 0,0,1,0 
                        .ELSE
                            INVOKE Ghost_direction, 0,0,0,1                 
                        .ENDIF
                    .ELSEIF Ghost[edx].up == 1
                        .IF eax
                            INVOKE Ghost_direction, 0,0,1,0 
                        .ELSE
                            INVOKE Ghost_direction, 0,0,0,1                 
                        .ENDIF
                    .ELSEIF Ghost[edx].right == 1
                        .IF eax
                            INVOKE Ghost_direction, 1,0,0,0 
                        .ELSE
                            INVOKE Ghost_direction, 0,1,0,0                 
                        .ENDIF
                    .ELSEIF Ghost[edx].left == 1
                        .IF eax
                            INVOKE Ghost_direction, 1,0,0,0 
                        .ELSE
                            INVOKE Ghost_direction, 0,1,0,0                 
                        .ENDIF
                    .ENDIF
                   
                .ENDIF
            .ENDIF
            
            mov al, Ghost[edx].col
            mov ah, Ghost[edx].row
                
            mGotoxy al, ah                            
            .IF SpecialPower == 0
                mWrite "w" 
            .ELSE    
                mWrite "!" 
            .ENDIF
                                   
            add edx, SIZEOF Ghost_info
            mov tmp, edx            
                
            inc ecx
        .ENDW    
        
        ret
Ghost_load ENDP