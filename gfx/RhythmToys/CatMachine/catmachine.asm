.org 0x08CDA118
.dw CDA118_catmachine_bg | 0x80000000

.org 0x08CDA400
.dw CDA118_catmachine_bg_map_dat | 0x8000000

.org 0x08CDA400+4
.dw CDA118_catmachine_bg_map_rle | 0x8000000

.org 0x08CDA400+8
.dw CDA118_catmachine_bg_map_rle_end - CDA118_catmachine_bg_map_rle
