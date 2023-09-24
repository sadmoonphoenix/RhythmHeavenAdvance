.include "gfx/RhythmToys/RapMachine/rapmachine_relocate.asm"
.include "gfx/RhythmToys/ConfessionMachine/confessionmachine_relocate.asm"
; .include "gfx/RhythmToys/HorseMachine/horsemachine_relocate.asm"
.include "gfx/RhythmToys/CatMachine/catmachine_relocate.asm"

.align 4
CD8388_rhythmtoys_obj:
.import "gfx/RhythmToys/CD8388_rhythmtoys_obj.cdat"

.align 4
CD8DA0_rhythmtoys_bg:
.import "gfx/RhythmToys/CD8DA0_rhythmtoys_bg.cdat"

.align 4
CD8DA0_rhythmtoys_bg_map_dat:
.import "gfx/RhythmToys/CD8DA0_rhythmtoys_bg_map.dat"

.align 4
CD8DA0_rhythmtoys_bg_map_rle:
.import "gfx/RhythmToys/CD8DA0_rhythmtoys_bg_map.rle"
CD8DA0_rhythmtoys_bg_map_rle_end: