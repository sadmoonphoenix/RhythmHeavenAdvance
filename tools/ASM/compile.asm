.gba
.open ROM/rh-atlus.gba,ROM/rh-eng.gba, 0x08000000

_skiprhythmtest equ 1
_debug equ 1
_debugmenu equ 0
_oamluaconsolemessages equ 1
_spriteluaconsolemessages equ 1

.if _skiprhythmtest ==1
.warning "Rhythm Test will be skipped, do not use for release!"
.endif
.if _debug ==1
.warning "Debug flag enabled! This will result in every part of the game already unlocked."
.endif
.if _debugmenu ==1
.warning "Debug Menu enabled, do not use for release!"
.endif
.if _oamluaconsolemessages ==1
.warning "OAM Log Enabled, while not deadly, should be disabled for the sake of it."
.endif
.if _spriteluaconsolemessages ==1
.warning "Sprite Log Enabled, while not deadly, should be disabled for the sake of it."
.endif

;Init. Seq.
.org 0x089CFE50
; .dw 0x08A218C4

;Init. Seq. (Skip)
.org 0x089CFF2C
; .dw 0x089EF884

;Load Seq. Call
.org 0x089CFED4
; .dw 0x089D2FFC+60h

;Load Seq. (Skip) not actually a pointer...

;Engine (BE)
.org 0x089CFE30
; .dw 0x089E0378

;Prologue
.org 0x089CFE14
; .dw 0x089EA6C0

.include tools/ASM/relocate.asm

.include src/Graphics/Font/font.asm
.include src/Graphics/RhythmGames/RatRace/ratrace.asm
.include src/Graphics/RhythmGames/NightWalk/nightwalk.asm
.include src/Graphics/RhythmGames/KarateMan/karateman.asm
.include src/Graphics/RhythmGames/TheClappyTrio/clappy.asm

.include tools/ASM/asm_relocate.asm
.include tools/ASM/asm.asm

; ALWAYS INCLUDE LAST - DO NOT INCLUDE ANYTHING AFTER THIS.

; .include src/Misc/DebugMenu/debugmenu_relocate.asm
; .include src/Misc/DebugMenu/debugmenu.asm

.close
;eof 
