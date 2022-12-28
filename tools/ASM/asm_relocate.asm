.org 0x080B4D48
.area (31*0x20)

MenuPluralTilesLookupTable:
;order top_no_s,bottom_no_s,top_with_s,bottom_no_s
;rhythmtoys
.dh 0x408E,0x409B,0x40B2,0x40B3
;endless
.dh 0x40AC,0x40B8,0x40CF,0x40D0
;drumblessons
.dh 0x60CA,0x60CB,0x60A7,0x60B3

;Adapt the plural of Metals in endless games
EndlessGamesPlural:
push r1-r4
ldr r1,=0x0600ec56
ldr r4,=MenuPluralTilesLookupTable
ldr r2,[r5]
ldrb r2,[r2,0x18]
lsl r2,r2,3
add r4,r4,r2
cmp r0,1
beq @@writetiles
add r4,r4,4
@@writetiles:
ldrh r2,[r4]
ldrh r3,[r4,2]
strh r2,[r1]
mov r2,0x40
strh r3,[r1,r2]
pop r1-r4
mov r15,r14
.pool

EndlessGamesPlural_Hook:
push r14
bl EndlessGamesPlural
bl 0x0801d388
pop r15
.include tools/ASM/lz77hack_relocate.asm
.include tools/ASM/debug_relocate.asm
.endarea

;eof