Find_string PROC				
    lea edi, h_Words         

    mov ecx, len                
    xor al, al                 

    @@:
    sub edx, 1					
    jc done                    
    repne scasb               
    jmp @B                     

  done:
	ret

Find_string ENDP                   

Array_dash PROC     
	mov  edx,OFFSET selectedWords
    call StrLength               
    mov  lengthArray,eax

    mov al, '-'                
    mov ecx, lengthArray		
    mov edi, offset guessWords  
    rep stosb                   
    mov BYTE PTR [edi], 0       

    ret
Array_dash ENDP  

Array_guess_letter PROC     
	mov  edx, OFFSET guessLetterArray
    call StrLength				
    mov  lengthArray, eax

    mov edi, offset guessLetterArray 
    add edi, lengthArray
	mov al, guessLetter
	mov BYTE PTR [edi], al      
	inc edi
	mov BYTE PTR [edi], ','     

    ret
Array_guess_letter ENDP