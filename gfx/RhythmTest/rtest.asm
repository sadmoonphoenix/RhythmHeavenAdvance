.org 0x08C6A350
.dw C6A350_rtest_obj | 0x80000000

.org 0x08C6A638
.dw C6A638_rtest_bg | 0x80000000

.org 0x08C6A830
.dw C6A638_rtest_bg_map_dat | 0x8000000

.org 0x08C6A830+4
.dw C6A638_rtest_bg_map_rle | 0x8000000

.org 0x08C6A830+8
.dw C6A638_rtest_bg_map_rle_end - C6A638_rtest_bg_map_rle

.org 0x088EFBEE
.import "gfx/RhythmTest/8EFBEE_assembly0.bin"

.org 0x088EFC1A
.import "gfx/RhythmTest/8EFC1A_assembly1.bin"

.org 0x088EFFC0
.dw X8EFBD8_assembly0

.org 0x088EFC46
.import "gfx/RhythmTest/8EFC46_assembly1.bin"

.org 0x088EFBE6
.import "gfx/RhythmTest/8EFBE6_assembly2.bin"
