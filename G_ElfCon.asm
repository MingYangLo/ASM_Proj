Array_val PROC, x:BYTE, y:BYTE
        mov eax, 0
        mov al, x      
        mov bl, mapCol  
        mul bl
        movsx bx, y
        add ax, bx     
          
        mov al, map[eax]         
        
        .IF al != '|' && al != '-' && al != '+' 
            mov ah, 1
        .ELSE 
            mov ah, 0
        .ENDIF
        
        ret
Array_val ENDP      
        
Blocky PROC, co:BYTE, r:BYTE, colAdd:BYTE, rowAdd:BYTE
        mov dl, co
        mov dh, r
        
        add dl, colAdd
        add dh, rowAdd
        
        INVOKE Array_val, dh, dl    
        .IF ah
            add dl, colAdd
           INVOKE Array_val, dh, dl            
        .ENDIF
        ret
Blocky ENDP 
        
Item PROC
        mov eax, 0
        mov al, row     
        mov bl, mapCol  
        mul bl
        movsx bx, col
        add ax, bx      
        
        mov bl, map[eax] 
        .IF bl == '.'
            mov map[eax] , ' '
            inc Score
        .ELSEIF bl == '$'
            mov map[eax] , ' '
            mov bl, SpecialPowerLimit
            mov SpecialPower, bl
        .ENDIF
        
        ret
Item ENDP
    
Set_direction PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov al, up
        mov Elf_mov.up, al

        mov al, down
        mov Elf_mov.down, al

        mov al, left
        mov Elf_mov.left, al      
        
        mov al, right
        mov Elf_mov.right, al        
        
        ret
Set_direction ENDP
        
Sync_key PROC
        mov ah, 0
        INVOKE GetKeyState, VK_DOWN
        .IF ah && row < mapRow - 1 || Elf_mov.down
            INVOKE Blocky, col, row, 0, 1
            .IF ah
                inc row
                INVOKE Set_direction, 0, 1, 0, 0
            .ENDIF 
        .ENDIF

        mov ah, 0
        INVOKE GetKeyState, VK_UP
        .IF ah && row > 1 || Elf_mov.up
            INVOKE Blocky, col, row, 0, -1
            .IF ah 
                dec row
                INVOKE Set_direction, 1, 0, 0, 0
            .ENDIF
        .ENDIF     
        
        mov ah, 0
        INVOKE GetKeyState, VK_LEFT
        .IF ah && col > 1 || Elf_mov.left
            INVOKE Blocky, col, row, -1, 0
            .IF ah 
                dec col
                INVOKE Set_direction, 0, 0, 1, 0                
            .ENDIF
        .ENDIF  

        mov ah, 0
        INVOKE GetKeyState, VK_RIGHT
        .IF ah && col < mapCol || Elf_mov.right
            INVOKE Blocky, col, row, 1, 0
            .IF ah
                inc col
                INVOKE Set_direction, 0, 0, 0, 1                
            .ENDIF

        .ENDIF     
        
        .IF col == 0
            mov ah, mapCol - 1
            mov col, ah
        .ELSEIF col == mapCol - 1
            mov col, 0
        .ENDIF
        
        ret
Sync_key ENDP

Print_map PROC
        mov dl, 0   ; row
        mov dh, 0   ; col
               
        .WHILE dl != mapRow
            .WHILE dh != mapCol
                    INVOKE Array_val, dl, dh                        
                    call WriteChar
                    inc dh
            .ENDW
            mov dh, 0
            call Crlf
            inc dl
        .ENDW
        ret
Print_map ENDP