
		call ClrScr
		
        call Ghost_init
        call Print_map
		
        forever:      
            call Ghost_load
            call Ghost_block
			
            .IF life ==0
                jmp GameOver
            .ENDIF
			
            call Sync_key        
            call Item      
			
            mGotoxy col, row
            .IF SpecialPower == 0
                mov al, Elf     
            .ELSEIF
                mov al, 1
                dec SpecialPower
            .ENDIF
            call WriteChar 
    
            INVOKE Sleep, speed
            
            call Erase_ghost
            
            mGotoxy col, row
            mov  al,' '     
            call WriteChar

            mGotoxy 16, 24
            mWrite "Life:" 
            mGotoxy 20, 24
            mov eax, Life
            call WriteInt
            
            mGotoxy 27, 24
            mWrite "Score:" 
            mGotoxy 33, 24
            mov eax, Score
            call WriteInt
            mGotoxy 37, 24
            mWrite "/245"

            .IF Score == 245
                jmp YouWin
            .ENDIF
			
        jmp Forever
        
        GameOver:
            call ClrScr
            mGotoxy 11, 9
            mWrite "Game Over"
            call Crlf  
            call Crlf  
            call delay
			ret

        YouWin:
            call ClrScr
            mGotoxy 11, 7
            mWrite "You Win"
            mGotoxy 11, 9
            mWrite "Score:+245" 
            call Crlf  
            call Crlf  
			call delay
            ret
            
      ret