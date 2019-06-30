Print_live_action PROC  
	call Clrscr
	mov eax, statusGameLive

	cmp eax, 5
	je live_5
	cmp eax, 4
	je live_4
	cmp eax, 3
	je live_3
	cmp eax, 2
	je live_2
	cmp eax, 1
	je live_1
	cmp eax, 0
	je live_0

live_5:   
	INVOKE WriteConsole,
		consoleHandle,			
		ADDR H_Lives_05,      
		messageSizeHOHOGame,	
		ADDR bytesWritten,0								
	call Crlf					
	call Crlf					
	mov edx, offset guessWords
	call WriteString            
	call Crlf                   
	call Crlf					
	mWrite <"Guessed letter are: ">
	mov edx, offset guessLetterArray
	call WriteString            
	call Crlf                   
	call Crlf                   
	ret

live_4:   
	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_Lives_04,      
		messageSizeHOHOGame,		
		ADDR bytesWritten,0			
	call Crlf						
	call Crlf						
	mov edx, offset guessWords
	call WriteString                
	call Crlf                       
	call Crlf						
	mWrite <"Guessed letter are: ">
	mov edx, offset guessLetterArray
	call WriteString               
	call Crlf                      
	call Crlf                       
	ret

live_3:  
	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_Lives_03,     
		messageSizeHOHOGame,	
		ADDR bytesWritten,0			
	call Crlf						
	call Crlf					
	mov edx, offset guessWords
	call WriteString                
	call Crlf                     
	call Crlf						
	mWrite <"Guessed letter are: ">
	mov edx, offset guessLetterArray
	call WriteString                
	call Crlf                      
	call Crlf                    
	ret

live_2:   
	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_Lives_02,      
		messageSizeHOHOGame,		
		ADDR bytesWritten,0			
	call Crlf						
	call Crlf						
	mov edx, offset guessWords
	call WriteString               
	call Crlf                      
	call Crlf						
	mWrite <"Guessed letter are: ">
	mov edx, offset guessLetterArray
	call WriteString              
	call Crlf                      
	call Crlf                   
	ret

live_1:   
	INVOKE WriteConsole,
		consoleHandle,		
		ADDR H_Lives_01,      
		messageSizeHOHOGame,	
		ADDR bytesWritten,0
	call Crlf						
	call Crlf						
	mov edx, offset guessWords
	call WriteString              
	call Crlf                      
	call Crlf						
	mWrite <"Guessed letter are: ">
	mov edx, offset guessLetterArray
	call WriteString               
	call Crlf                      
	call Crlf                      
	ret

live_0:   
	INVOKE WriteConsole,
		consoleHandle,				
		ADDR H_Lives_00,      
		messageSizeHOHOGame,		
		ADDR bytesWritten,0			
	call Crlf						
	call Crlf						
	mov edx, offset guessWords
	call WriteString               
	call Crlf                      
	call Crlf						
	mWrite <"Guessed letter are: ">
	mov edx, offset guessLetterArray
	call WriteString                
	call Crlf                       
	call Crlf                       
	ret
		
Print_live_action ENDP  