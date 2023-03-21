.org 0x08CCB298
.dw CCB298_mainmenu_tile | 0x80000000

; --- OAM

.org 0x0890A474
.dw X909CD2_assembly0

.org 0x0890A3D4
.dw X909B88_assembly0
.org 0x0890A3DC
.dw X909BF6_assembly1
.org 0x0890A3E4
.dw X909C64_assembly2

; ----------------

.org 0x0890A484
.dw X90A484_assembly0

.org 0x08909D04
.import "gfx/MainMenu/909D04_assembly0.bin"
.org 0x08909D66
.import "gfx/MainMenu/909D66_assembly1.bin"
.org 0x08909DC8
.import "gfx/MainMenu/909DC8_assembly2.bin"

; ----------------

.org 0x0890A494
.dw X909F46_assembly0

.org 0x0890A414
.dw X909E68_assembly0
.org 0x0890A41C
.dw X909EB2_assembly1
.org 0x0890A424
.dw X909EFC_assembly2


; ----------------

.org 0x0890A122
.import "gfx/MainMenu/90A122_assembly0.bin"

.org 0x08909F6C
.import "gfx/MainMenu/909F6C_assembly0.bin"
.org 0x0890A016
.import "gfx/MainMenu/90A016_assembly1.bin"
.org 0x0890A0A8
.import "gfx/MainMenu/90A0A8_assembly2.bin"

; ----------------

.org 0x0890A2CE
.import "gfx/MainMenu/90A2CE_assembly0.bin"

.org 0x0890A160
.import "gfx/MainMenu/90A160_assembly0.bin"
.org 0x0890A1DA
.import "gfx/MainMenu/90A1DA_assembly1.bin"
.org 0x0890A254
.import "gfx/MainMenu/90A254_assembly2.bin"
