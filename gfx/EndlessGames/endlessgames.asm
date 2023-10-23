.org 0x08CC3B7C
.dw CC3B7C_endlessgames_obj | 0x80000000

.org 0x08CC4670
.dw CC4670_endlessgames_bg | 0x80000000

.org 0x08CC4A00
.dw CC4670_endlessgames_bg_map_dat | 0x8000000

.org 0x08CC4A00+4
.dw CC4670_endlessgames_bg_map_rle | 0x8000000

.org 0x08CC4A00+8
.dw CC4670_endlessgames_bg_map_rle_end - CC4670_endlessgames_bg_map_rle

.org 0x08900444
.dw X90041C_assembly0

.org 0x08900454
.dw X9003DC_assembly0

.org 0x089003FC
.import "gfx/EndlessGames/9003FC_assembly0.bin"