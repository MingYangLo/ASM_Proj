INCLUDE Irvine32_all.asm
INCLUDE Fi_macro.asm

.data
	INCLUDE H_data.asm
	INCLUDE G_data.asm
	INCLUDE Menu_data.asm	
	
.code
	INCLUDE G_ElfCon.asm
	INCLUDE G_GhostCon.asm
	INCLUDE H_LiveAct.asm
	INCLUDE H_Procs.asm
	INCLUDE Main_menu.asm

main PROC
	
	call Main_menu
	jmp main
	
main ENDP

END main
