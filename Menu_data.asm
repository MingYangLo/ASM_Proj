nd0 EQU <0dh,0ah>
Menu LABEL BYTE 
		BYTE "                                                                    ",endl
		BYTE "       _________                                         ___        ",endl
		BYTE "       |        |                                       |   |       ",endl
		BYTE "       |    ____|                                       |   |       ",endl
		BYTE "       |   |         __     __            __________    |   |       ",endl
		BYTE "       |   |____    |__|   |  |______    |________  |   |   |       ",endl
		BYTE "       |        |    __    |         |    _______|  |   |   |       ",endl
		BYTE "       |    ____|   |  |   |   ___   |   |  ___     |   |   |       ",endl
		BYTE "       |   |        |  |   |  |   |  |   | |   | |  |   |   |       ",endl
		BYTE "       |   |        |  |   |  |   |  |   | |___| |  |   |   |       ",endl
		BYTE "       |___|        |__|   |__|   |__|   |_______|__|   |___|       ",endl
MenuSize DWORD ($-Menu)
consoleHandle HANDLE 0   
bytesWritten  DWORD ?      
Choice BYTE ?
Life DWORD 0