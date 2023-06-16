; so alright some documentation (ripped off the decomp)
; a scene is defined by 3 funcs and 4 other variable, 6 of them are pointers, one is a word
;
; initFunc (& Param)
; loopFunc (& Param)
; endFunc (& Param)
; requiredMemory
;
; 0x454 where the code for the load warning appears
; 
;9DD47C - title screeen
;
;
;
;
;

disclamerInitFunc:
disclamerLoopFunc:
disclamerEndFunc:


disclamerScene:
.dw disclamerInitFunc | 0x8000000
.word 0x00000000
.dw disclamerLoopFunc | 0x8000000
.word 0x00000000
.dw disclamerEndFunc | 0x8000000
.word 0x00000000
.word 0x00000000