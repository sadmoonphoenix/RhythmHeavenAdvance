; General purpose binhacks, fix the But, capitalization, drum lessons plural patch, etc...

.org 0x080B4D48
.area (31*0x20)

;Old Silver patch, not made by me - fixes the capitalization when you do a "Try Again, but, xxx" - Shaffy
FixResultsCaps:
push r4,r14
mov r4,0
@@getmessagelength:
ldrb r3,[r0,r4]
add r4,1
cmp r3,0
bne @@getmessagelength
sub r4,1
bl 0x080081A8
cmp r4,0
beq @@dontlowercase
ldrb r2,[r0,r4]
cmp r2,0x41
blt @@dontlowercase
cmp r2,0x5A
bgt @@dontlowercase
add r2,0x20
strb r2,[r0,r4]
@@dontlowercase:
pop r4,r15

MenuPluralTilesLookupTable:
;order top_no_s,top_with_s
;rhythmtoys
.dh 0x40DC,0x40FA
;endless
.dh 0x40FB,0x413E
;drumblessons
.dh 0x6178,0x613C

;Adapt the plural of Metals in endless games
EndlessGamesPlural:
push r1-r4
ldr r1,=0x0600ec4c
ldr r4,=MenuPluralTilesLookupTable
ldr r2,[r5]
ldrb r2,[r2,0x18]
lsl r2,r2,2
add r4,r4,r2
cmp r0,1
beq @@writetiles
add r4,r4,2 
@@writetiles:
ldrh r2,[r4]
strh r2,[r1]
pop r1-r4
mov r15,r14
.pool

EndlessGamesPlural_Hook:
push r14
bl EndlessGamesPlural
bl 0x0801d388
pop r15


OptionsDebugSequence:
push r2
ldr r2,=0x04000131
ldrb r2,[r2]
cmp r2,0x00
beq @@accessdebug
bne @@nevermind

@@accessdebug:
ldr r0,=0x089ddbcc
@@nevermind:

pop r2
mov r15,r14
.pool

OptionsDebugSequence_Hook:
push r14
bl OptionsDebugSequence
bl 0x08000584
pop r15

.include "src/lz77hack_relocate.asm"
.include "src/debug_relocate.asm"
.endarea

;eof