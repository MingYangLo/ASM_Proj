VK_LEFT     EQU     000000025h
VK_UP       EQU     000000026h
VK_RIGHT    EQU     000000027h
VK_DOWN     EQU     000000028h
maxCol      EQU     79
maxRow      EQU     23

mGotoxy MACRO X:REQ, Y:REQ           
    PUSH    EDX
    MOV DH, Y
    MOV DL, X
    CALL    Gotoxy
    POP EDX
ENDM


mWrite MACRO text:REQ                  
    LOCAL string
    .data
        string BYTE text, 0
    .code
        PUSH    EDX
        MOV EDX, OFFSET string
        CALL    WriteString
        POP EDX
ENDM


mWriteString MACRO buffer:REQ         
    PUSH    EDX
    MOV EDX, OFFSET buffer
    CALL    WriteString
    POP EDX
ENDM


mReadString MACRO var:REQ              
    PUSH    ECX
    PUSH    EDX
    MOV EDX, OFFSET var
    MOV ECX, SIZEOF var
    CALL    ReadString
    POP EDX
    POP ECX
ENDM

AXIS STRUCT                           
    x BYTE 0
    y BYTE 0
AXIS ENDS

GetKeyState PROTO, nVirtKey:DWORD

Movement STRUCT
    up BYTE 0
    down BYTE 0
    left BYTE 0
    right BYTE 0
Movement ENDS

Ghost_info STRUCT
    col     BYTE 26
    row     BYTE 9
    up      BYTE 0
    down    BYTE 0
    left    BYTE 0
    right   BYTE 1
    delay   WORD 0
    hrow     BYTE 26
    hcol     BYTE 9
Ghost_info ENDS