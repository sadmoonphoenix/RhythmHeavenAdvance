; Debug purposes binhacks (unlocks stage, replace stages to test unused levels...)

.if _oamluaconsolemessages==1
.org 0x0804D11E
	bl OAMLuaConsoleMessageHook
.endif

.if _debug ==1
.org 0x0801292e
	bl Debug_UnlockAllStages_Hook

.org 0x08012132
	bl Debug_UnlockAllMail_Hook
.org 0x0801D656
	bl Debug_99Medals_Hook
.endif

.if _skiprhythmtest==1
.org 0x0801CFC0
	nop
.endif