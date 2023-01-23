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

; "printf"'s location fix.
; tl;dr: the game has a fixed space before the drum lessons's score 
; or perfect game/gift is set, those fixes them.
; fix: change the space

; Drum Lessons's Score
.org 0x0802806E
.byte 12

; Perfect Gift
.org 0x08012D1A
.byte 25

.org 0x0801d174
bl EndlessGamesPlural_Hook

.org 0x08016832
bl OptionsDebugSequence_Hook

.if _autoplay==1
.org 0x08017C54
.byte 0x01
.org 0x08017C58
.byte 0x00
; .org 0x08017C1C
; bl AutoPlay_Hook
.endif

;eof