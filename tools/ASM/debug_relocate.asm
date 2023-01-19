.if _oamluaconsolemessages==1
.align 2
OAMLuaConsoleMessageHook:
push r0-r7
mov r1,0x80
lsl r1,r1,0x14
tst r0,r1
beq @@SkipAdding
ldr r1,=0x02021000
ldr r2,[r1]
cmp r2,0x13
ble @@addentry
mov r2,0
@@addentry:
add r3,r2,1
str r3,[r1]
add r1,4
lsl r3,r2,2
str r0,[r1,r3]
@@SkipAdding:
pop r0-r7
mov r2,r0
mov r1,0
mov r15,r14
.pool
.endif

;eof