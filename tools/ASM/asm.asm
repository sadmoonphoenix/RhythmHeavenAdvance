.include tools/ASM/lz77hack.asm
.include tools/ASM/debug.asm

.if _debugmenu==1
;Skip Main Menu
;0x089CDE20
.org 0x0801CFD4
.dw 0x089DDBCC ; Check https://docs.google.com/document/d/1gwQz-1zzkr3CLOBLtUMTfsk2Xtd1zmoMDKJRhPMbqwg for more infomation.
;Skip Rhythm Introduction
.org 0x0801D014
.dw 0x089DDBCC
.endif

.org 0x08019A2C
bl FixResultsCaps
; .org 0x08019B80 ; And..
; bl FixResultsCaps
.org 0x08019C80
bl FixResultsCaps
.org 0x08019CCA
bl FixResultsCaps

.org 0x0801d174
bl EndlessGamesPlural_Hook

.org 0x08016832
bl OptionsDebugSequence_Hook

;eof