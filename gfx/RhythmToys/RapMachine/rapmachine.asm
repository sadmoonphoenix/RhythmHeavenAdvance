.org 0x08CDBACC
.dw CDBACC_rapmachine_bg | 0x80000000

.org 0x08CDBE6C
.dw CDBACC_rapmachine_map_dat | 0x8000000

.org 0x08CDBE6C+4
.dw CDBACC_rapmachine_map_rle | 0x8000000

.org 0x08CDBE6C+8
.dw CDBACC_rapmachine_map_rle_end - CDBACC_rapmachine_map_rle