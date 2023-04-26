.org 0x08C00010
.dw c00010_polyrhythm_intro_obj |0x80000000
.org 0x08C0212C
.dw c0212c_polyrhythm_intro_bg |0x80000000
.org 0x08C781AC
.dw C781AC_polyrhythm_obj |0x80000000

.org 0x088F6090
.import "gfx/RhythmGames/Polyrhythm/8F6090_assembly0.bin"
;--
.org 0x088F60AA
.import "gfx/RhythmGames/Polyrhythm/8F60AA_assembly1.bin"
;--


.org 0x08C02628
.dw c0212c_polyrhythm_intro_bg_map_dat
.org 0x08C02628+4
.dw c0212c_polyrhythm_intro_bg_map_rle
.org 0x08C02628+8
.dh c0212c_polyrhythm_intro_bg_map_rle_end - c0212c_polyrhythm_intro_bg_map_rle