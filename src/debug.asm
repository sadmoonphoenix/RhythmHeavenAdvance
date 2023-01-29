; Debug purposes binhacks (unlocks stage, replace stages to test unused levels...)

.if _debugmenu==1
;Skip Main Menu
;0x089CDE20
.org 0x0801CFD4
.dw 0x089DDBCC ; Check https://docs.google.com/document/d/1gwQz-1zzkr3CLOBLtUMTfsk2Xtd1zmoMDKJRhPMbqwg for more infomation.
;Skip Rhythm Introduction
.org 0x0801D014
.dw 0x089DDBCC
.endif

.if _oamluaconsolemessages==1
.org 0x0804D11E
bl OAMLuaConsoleMessageHook
.endif

.if _debug ==1
;This flag is for easy debugging, it unlocks everything.

.org 0x0801292e
bl Debug_UnlockAllStages_Hook

.org 0x08012132
bl Debug_UnlockAllMail_Hook
.org 0x0801D656
bl Debug_99Medals_Hook

;Init. Seq.
.org 0x089CFE50
; .dw 0x089D3984

;Init. Seq. (Skip)
.org 0x089CFF2C
; .dw 0x08A2C990

;Load Seq. Call
.org 0x089CFED4
.dw 0x089CFF88

;Engine (BE)
.org 0x089CFE30
; .dw 0x089E0378

;Prologue
.org 0x089CFE14
; .dw 0x089EA6C0

.endif

.if _skiprhythmtest==1
.org 0x0801CFC0
nop
.endif
;eof