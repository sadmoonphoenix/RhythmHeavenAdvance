.gba
.open ROM/rh-atlus.gba,ROM/rh-eng.gba, 0x08000000

_skiprhythmtest equ 1
_debug equ 0
_debugmenu equ 0
_oamluaconsolemessages equ 0
_spriteluaconsolemessages equ 0

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


.include tools/ASM/relocate.asm

.include src/Graphics/Font/font.asm

.include tools/ASM/asm_relocate.asm
.include tools/ASM/asm.asm

.close
;eof 
