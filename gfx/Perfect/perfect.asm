.org 0x08CCC138
.dw CCC138_perfect_bg | 0x80000000

.org 0x08CCC39C
.dw CCC138_perfect_map_dat | 0x8000000

.org 0x08CCC39C+4
.dw CCC138_perfect_map_rle | 0x8000000

.org 0x08CCC39C+8
.dw CCC138_perfect_map_rle_end - CCC138_perfect_map_rle