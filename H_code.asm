INVOKE GetStdHandle, STD_OUTPUT_HANDLE
mov consoleHandle,eax

Jump_game_start_again:

  	mov  eax,13			
	call Randomize		
	call RandomRange   
	mov  ranNum,eax		
	call Crlf			

  	mov edx, ranNum     
	call Find_string       

	INVOKE Str_copy,
        ADDR [edi],
        ADDR selectedWords
 
	call Array_dash
	mov statusGameLive, 6

Input_word_again:
  
	call Print_live_action

	cmp statusGameLive, 0
	je Gameover_loop

	mov  eax,green+(black*16)
    call SetTextColor

	mWrite <"Guess a letter: ">

	call readChar	
	cmp al, 27		
	je Restart_game 
	cmp al, 32		
	je Input_word_again
	and al, 0DFH	
					
	push eax
	sub al, 'A'		
    cmp al, 'Z'-'A'
    jbe Uppercase
	jmp Input_word_again

Uppercase:

	pop eax
	mov guessLetter, al
	call WriteChar
	call Crlf		
	call Crlf		

	mov  eax,white+(black*16)
    call SetTextColor

	mov ecx, LENGTHOF guessLetterArray
	mov edi, offset guessLetterArray
	mov al, guessLetter                 
	repne scasb                         
	je Guess_letter_exists_loop			
		
	call Array_guess_letter 

	mov ecx, LENGTHOF selectedWords
	mov edi, offset selectedWords
	mov al, guessLetter                 
	repne scasb                         
	jne Letter_exists_live_loop					

    mov esi, offset selectedWords       
    mov edi, offset guessWords         
    mov ecx, LENGTHOF selectedWords     
    mov al, guessLetter                 
    xor ebx, ebx                       

Insp_loop:
    cmp [esi+ebx], al                   
    jne @F                             
    mov [edi+ebx], al                   
    @@:
    inc ebx                             
    dec ecx                             
    jne Insp_loop                 

	mov ecx, LENGTHOF guessWords		
    mov edi, offset guessWords
    mov al, letterDash                
    repne scasb						
    jne WinGame_loop					
	jmp Input_word_again
		
INVOKE ExitProcess,0

Guess_letter_exists_loop:

		mov edx, offset guessLetterArray
		jmp Input_word_again

Letter_exists_live_loop:

		dec statusGameLive
		jmp Input_word_again

Restart_game:

		INVOKE Str_trim, ADDR guessLetterArray, ','

		mov  edx, OFFSET guessLetterArray
		call StrLength				
		mov  lengthArray, eax
		mov Looptimes,2
		mov edi, offset guessLetterArray ; Destination
		add edi, lengthArray
		dec edi
		INVOKE Str_trim, ADDR guessLetterArray, [edi]

		cmp edi, offset guessLetterArray
		jne Restart_game

		mov  eax,white+(black*16)
		call SetTextColor
		call Crlf			

		jmp main			

WinGame_loop:
	
	mGotoxy 0, 16
		
	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_WinGame_00,  
		messageSizeHOHOGame,		
		ADDR bytesWritten,			
		0							

	mov eax, set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor

	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_WinGame_01,   
		messageSizeHOHOGame,		
		ADDR bytesWritten,			
		0							

	mov eax, set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor

	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_WinGame_02,   
		messageSizeHOHOGame,		
		ADDR bytesWritten,		
		0							

	mov eax, Set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor

	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_WinGame_03,  
		messageSizeHOHOGame,		
		ADDR bytesWritten,			
		0						

	mov eax, Set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor
	
	dec Looptimes
	cmp Looptimes, 0
	jne WinGame_loop

	mov  eax,white+(black*16)
    call SetTextColor
    inc Life
	call Restart_game
	
	
Gameover_loop:
	
	mGotoxy 0, 16

	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_LostGame_00,   
		messageSizeHOHOGame,		
		ADDR bytesWritten,		
		0						

	mov eax, Set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor

	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_LostGame_01,   
		messageSizeHOHOGame,		
		ADDR bytesWritten,		
		0		

	mov eax, Set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor

  	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_LostGame_02,   
		messageSizeHOHOGame,		
		ADDR bytesWritten,		
		0				

	mov eax, Set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor

	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_LostGame_03,   
		messageSizeHOHOGame,		
		ADDR bytesWritten,		
		0		

	mov eax, Set_delay
	call Delay
	mGotoxy 0, 16
	mov  eax,yellow+(black*16)
    call SetTextColor
	
	dec Looptimes
	cmp Looptimes, 0
	jne Gameover_loop

	mov  eax,white+(black*16)
    call SetTextColor
	call Restart_game			
