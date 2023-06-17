.org 0x08CC9854
.dw CC9854_gameselect_bg | 0x80000000

.org 0x08CC9148
.dw CC9148_gameselect_obj | 0x80000000

.org 0x08CC9E14
.dw CC9854_gameselect_bg_map_dat | 0x8000000

.org 0x08CC9E14+4
.dw CC9854_gameselect_bg_map_rle | 0x8000000

.org 0x08CC9E14+8
.dw CC9854_gameselect_bg_map_rle_end - CC9854_gameselect_bg_map_rle

; ----------------------------------------

.org 0x08902944
.import "gfx/GameSelect/902944_assembly0.bin"

; ----------------------------------------

.org 0x08902DA8
.dw X9022CE_assembly0

;--
.org 0x08902DB0
.dw X9022EE_assembly1

;--
.org 0x08902DB8
.dw X90231A_assembly2

;--
.org 0x08902DC0
.dw X902346_assembly3

; ----------------------------------------

.org 0x08901F04
.import "gfx/GameSelect/901F04_assembly0.bin"
;--
.org 0x08901F30
.import "gfx/GameSelect/901F30_assembly1.bin"
;--
.org 0x08901F68
.import "gfx/GameSelect/901F68_assembly2.bin"
;--
.org 0x08901FA0
.import "gfx/GameSelect/901FA0_assembly3.bin"
;--

; ----------------------------------------

.org 0x08901FC6
.import "gfx/GameSelect/901FC6_assembly0.bin"
;--
.org 0x08902D10
.dw X901FF2_assembly1

;--
.org 0x08902D18
.dw X90202A_assembly2

;--
.org 0x08902D20
.dw X902062_assembly3

; ----------------------------------------

.org 0x08902088
.import "gfx/GameSelect/902088_assembly0.bin"
;--
.org 0x08902D38
.dw X9020B4_assembly1

;--
.org 0x08902D40
.dw X9020EC_assembly2

;--
.org 0x08902D48
.dw X902124_assembly3

; ----------------------------------------

.org 0x0890214A
.import "gfx/GameSelect/90214A_assembly0.bin"
;--
.org 0x08902176
.import "gfx/GameSelect/902176_assembly1.bin"
;--
.org 0x089021AE
.import "gfx/GameSelect/9021AE_assembly2.bin"
;--
.org 0x089021E6
.import "gfx/GameSelect/9021E6_assembly3.bin"
;--

; ----------------------------------------

.org 0x0890220C
.import "gfx/GameSelect/90220C_assembly0.bin"
;--
.org 0x08902238
.import "gfx/GameSelect/902238_assembly1.bin"
;--
.org 0x08902270
.import "gfx/GameSelect/902270_assembly2.bin"
;--
.org 0x089022A8
.import "gfx/GameSelect/9022A8_assembly3.bin"
;--

; ----------------------------------------

.org 0x08902DD0
.dw X902360_assembly0

;--
.org 0x08902DD8
.dw X902380_assembly1

;--
.org 0x08902DE0
.dw X9023AC_assembly2

;--
.org 0x08902DE8
.dw X9023D8_assembly3

; ----------------------------------------

.org 0x08902DF8
.dw X9023F2_assembly0

;--
.org 0x08902E00
.dw X902412_assembly1

;--
.org 0x08902E08
.dw X90243E_assembly2

;--
.org 0x08902E10
.dw X90246A_assembly3

; ----------------------------------------

.org 0x08902484
.import "gfx/GameSelect/902484_assembly0.bin"
;--
.org 0x089024AA
.import "gfx/GameSelect/9024AA_assembly1.bin"
;--
.org 0x089024DC
.import "gfx/GameSelect/9024DC_assembly2.bin"
;--
.org 0x0890250E
.import "gfx/GameSelect/90250E_assembly3.bin"
;--

; ----------------------------------------


; Shoutout to the decomp for those offsets! - Shaffy
.org 0x089028F4
.import "gfx/GameSelect/9028F4_assembly0.bin"

.org 0x089028FC
.import "gfx/GameSelect/9028FC_assembly1.bin"

.org 0x08902904
.import "gfx/GameSelect/902904_assembly2.bin"

.org 0x0890290C
.import "gfx/GameSelect/90290C_assembly3.bin"

.org 0x08902914
.import "gfx/GameSelect/902914_assembly4.bin"

.org 0x0890291C
.import "gfx/GameSelect/90291C_assembly5.bin"

.org 0x08902924
.import "gfx/GameSelect/902924_assembly6.bin"

.org 0x0890292C
.import "gfx/GameSelect/90292C_assembly7.bin"

.org 0x08902934
.import "gfx/GameSelect/902934_assembly8.bin"

.org 0x0890293C
.import "gfx/GameSelect/90293C_assembly9.bin"

.org 0x08901C20
.import "gfx/GameSelect/901C20_assembly10.bin"

