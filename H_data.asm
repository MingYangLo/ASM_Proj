endl EQU <0dh,0ah>	

H_WinGame_00 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|              ",endl
                    BYTE "|      O       ",endl
                    BYTE "|     /|\      ",endl
                    BYTE "|     / \      ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     WIN    | ",endl
                    BYTE "+------------+ ",endl
messageSizeHOHOGame DWORD ($-H_WinGame_00)

H_WinGame_01 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|        TOO   ",endl
                    BYTE "|      O/      ",endl
                    BYTE "|     /|       ",endl
                    BYTE "|     / \      ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     WIN    | ",endl
                    BYTE "+------------+ ",endl

H_WinGame_02 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|        EASY  ",endl
                    BYTE "|      O/      ",endl
                    BYTE "|     /|       ",endl
                    BYTE "|     / \      ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     WIN    | ",endl
                    BYTE "+------------+ ",endl

H_WinGame_03 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|        Bro   ",endl
                    BYTE "|      O      ",endl
                    BYTE "|     \|/       ",endl
                    BYTE "|     / \      ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     WIN    | ",endl
                    BYTE "+------------+ ",endl

H_LostGame_00 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|      O       ",endl
                    BYTE "|     /|\      ",endl
                    BYTE "|     / \      ",endl
                    BYTE "|              ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     DIE    | ",endl
                    BYTE "+------------+ ",endl

H_LostGame_01 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|      O !!    ",endl
                    BYTE "|              ",endl
                    BYTE "|     /|\      ",endl
                    BYTE "|     / \      ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     DIE    | ",endl
                    BYTE "+------------+ ",endl

H_LostGame_02 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|      O ...   ",endl
                    BYTE "|              ",endl
                    BYTE "|              ",endl
                    BYTE "|   \|/__\/    ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     DIE    | ",endl
                    BYTE "+------------+ ",endl

H_LostGame_03 LABEL BYTE 
				BYTE "+------+       ",endl
                    BYTE "|      |       ",endl
                    BYTE "|      O  HA!  ",endl
                    BYTE "|   O/    \O   ",endl
                    BYTE "|  /|      |\  ",endl
                    BYTE "|   /\     /\  ",endl
                    BYTE "+------------+ ",endl
                    BYTE "|     DIE    | ",endl
                    BYTE "+------------+ ",endl

H_Lives_05 LABEL BYTE 
				BYTE "+------+       ",endl
				BYTE "|      |       ",endl
				BYTE "|              ",endl
				BYTE "|              ",endl
				BYTE "|              ",endl
				BYTE "|              ",endl
				BYTE "+------------+ ",endl
				BYTE "|            | ",endl
				BYTE "+------------+ ",endl

H_Lives_04 LABEL BYTE 
				BYTE "+------+       ",endl 
				BYTE "|      |       ",endl
				BYTE "|      O       ",endl
				BYTE "|              ",endl
				BYTE "|              ",endl
				BYTE "|              ",endl
				BYTE "+------------+ ",endl
				BYTE "|            | ",endl
				BYTE "+------------+ ",endl

H_Lives_03 LABEL BYTE 
				BYTE "+------+       ",endl
				BYTE "|      |       ",endl
				BYTE "|      O       ",endl
				BYTE "|      |       ",endl
				BYTE "|              ",endl
				BYTE "|              ",endl
				BYTE "+------------+ ",endl
				BYTE "|            | ",endl
				BYTE "+------------+ ",endl

H_Lives_02 LABEL BYTE 
				BYTE "+------+       ",endl
				BYTE "|      |       ",endl
				BYTE "|      O       ",endl
				BYTE "|     /|\      ",endl
				BYTE "|              ",endl
				BYTE "|              ",endl
				BYTE "+------------+ ",endl
				BYTE "|            | ",endl
				BYTE "+------------+ ",endl

H_Lives_01 LABEL BYTE 
				BYTE "+------+       ",endl
				BYTE "|      |       ",endl
				BYTE "|      O       ",endl
				BYTE "|     /|\      ",endl
				BYTE "|     /        ",endl
				BYTE "|              ",endl
				BYTE "+------------+ ",endl
				BYTE "|            | ",endl
				BYTE "+------------+ ",endl

H_Lives_00 LABEL BYTE 
				BYTE "+------+       ",endl
				BYTE "|      |       ",endl
				BYTE "|      O       ",endl
				BYTE "|     /|\      ",endl
				BYTE "|     / \      ",endl
				BYTE "|              ",endl
				BYTE "+------------+ ",endl
				BYTE "|            | ",endl
				BYTE "+------------+ ",endl

ranNum DWORD ?		

INCLUDE H_Words.asm
len equ $ - h_Words

statusGameLive DWORD ?		

selectedWords BYTE "                    ", 0
lengthArray DWORD ?

guessLetter BYTE ?
guessWords BYTE 50 DUP (?)

guessLetterArray BYTE 50 DUP (?)
chardelete   BYTE 'A'

letterDash BYTE '-'

Set_delay = 1000
Looptimes BYTE 2	