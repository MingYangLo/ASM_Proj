Main_menu PROC									
	call ClrScr
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov consoleHandle,eax
	INVOKE WriteConsole,	
		consoleHandle,				
		ADDR Menu,       		
		MenuSize,				
		ADDR bytesWritten,0			
	mGotoxy 22, 13
	mWrite	"4105061037 Benjamin Lo"	
	mGotoxy 29, 15
	mWrite	"Life: "
	mGotoxy 35, 15
	mov eax, Life
	call WriteInt
	mGotoxy 22, 16
	mWrite	"-------GAME MENU-------"							
	mGotoxy 27, 17
	mWrite	"1) Hang Man"						
	mGotoxy 27, 18 
	mWrite	"2) Game"	
	mGotoxy 24, 19
	mWrite	"Press Q to quit. "
	mGotoxy 24, 20
	mWrite	"Plz Select: "

	call ReadChar    
	mov	Choice, al								
	call WriteChar
											
	cmp	Choice, '1'							
	jne	G									
	INCLUDE H_code.asm						
	jmp	q									

    G:
	cmp	Choice, '2'							
	jne	q
	INCLUDE G_code.asm 
	jmp	q

	q:
	cmp	Choice, 'q'							
	jne	q2
	ret

	q2:
	cmp	Choice, 'Q'							
	jne	EnOther
	ret

    EnOther:
	jmp main								

Main_menu ENDP