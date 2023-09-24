.include "gfx/RhythmToys/RapMachine/rapmachine.asm"
.include "gfx/RhythmToys/ConfessionMachine/confessionmachine.asm"
; .include "gfx/RhythmToys/HorseMachine/horsemachine.asm"
.include "gfx/RhythmToys/CatMachine/catmachine.asm"

.org 0x08CD8388
.dw CD8388_rhythmtoys_obj | 0x80000000

.org 0x08CD8DA0
.dw CD8DA0_rhythmtoys_bg | 0x80000000

.org 0x08CD931C
.dw CD8DA0_rhythmtoys_bg_map_dat | 0x8000000

.org 0x08CD931C+4
.dw CD8DA0_rhythmtoys_bg_map_rle | 0x8000000

.org 0x08CD931C+8
.dw CD8DA0_rhythmtoys_bg_map_rle_end - CD8DA0_rhythmtoys_bg_map_rle