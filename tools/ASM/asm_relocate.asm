.org 0x080B4B70
.area (31*0x20)

;Old Silver patch, not made by me - fixes the capitalization when you do a "Try Again, but..." - Shaffy
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

.include tools/ASM/lz77hack_relocate.asm
.include tools/ASM/debug_relocate.asm
.endarea

;eof