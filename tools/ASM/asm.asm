.include tools/ASM/lz77hack.asm
.include tools/ASM/debug.asm

.if _debugmenu==1
;Skip Main Menu
.org 0x0801D078
.dw 0x089DD778
.endif

.org 0x080198E8
bl FixResultsCaps
; .org 0x08019B80 ; And.. (NOT CURRENTLY CONVERTED)
; bl FixResultsCaps
.org 0x08019B3C
bl FixResultsCaps
.org 0x08019B86
bl FixResultsCaps

;eof

;60DB9C08
