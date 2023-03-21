; General purpose binhacks, fix the But, capitalization, drum lessons plural patch, etc...

.include "src/lz77hack.asm"
.include "src/debug.asm"

.org 0x08019A2C
bl FixResultsCaps
.org 0x08019B80 ; And..
bl FixResultsCaps
.org 0x08019C80
bl FixResultsCaps
.org 0x08019CCA
bl FixResultsCaps

; "printf"'s location fix.
; tl;dr: the game has a fixed space before the drum lessons's score 
; or perfect game/gift is set, those fixes them.
; fix: change the space
; the byte is the number of character before it cutoffs

; Drum Lessons's Score
.org 0x0802806E
.byte 12

; Perfect Gift
.org 0x08012D1A
.byte 25

.org 0x0801d174
bl EndlessGamesPlural_Hook

.org 0x0801271a
bl OptionsDebugSequence_Hook

.if _autoplay==1
.org 0x08017C54
.byte 0x01
.org 0x08017C58
.byte 0x00
.endif

;eof