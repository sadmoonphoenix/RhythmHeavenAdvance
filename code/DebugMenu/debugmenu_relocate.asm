; tanooki_monkey_entrypoint:
; .import "src/Misc/DebugMenu/tanooki_monkey_entrypoint.bin"

; .align 8
; tanooki_monkey_text:
; .import "src/Misc/DebugMenu/tanooki_monkey_text.bin"

; _9DDBE8_dmenu_entries:
; .import "src/Misc/DebugMenu/9DDBE8_dmenu_entries.bin"

.org 0x08FF0000

; --- START TEXT ---
TanookiMonkeyName:
.sjis "Ｔａｎｏｏｋｉ　＆　Ｍｏｎｋｅｙ"

SamuraiDrum1:
.sjis "Ｕｎｕｓｅｄ　Ｌｅｓｓｏｎ　１"

SamuraiDrum2:
.sjis "Ｕｎｕｓｅｄ　Ｌｅｓｓｏｎ　２"

SamuraiDrum3:
.sjis "Ｕｎｕｓｅｄ　Ｌｅｓｓｏｎ　３"

; --- END TEXT ---

.align 4
DebugMenuEntries:
; -- Engine Code
.dw 0x089D6F44
; -- Text Code
.dw 0x08059F84

; -- Engine Code
.dw 0x089D6C8C
; -- Text Code
.dw 0x08059F6C

; -- Engine Code
.dw 0x089D6BA4
; -- Text Code
.dw 0x08059F54

; -- Engine Code
.dw 0x089D69E0
; -- Text Code
.dw 0x08059F40

; -- Engine Code
.dw 0x089D6804
; -- Text Code
.dw 0x08059F34

; -- Engine Code
.dw 0x089D74FC
; -- Text Code
.dw 0x08059F24

; -- Engine Code
.dw 0x089D712C
; -- Text Code
.dw 0x08059F14

; -- Engine Code
.dw 0x089D7408
; -- Text Code
.dw 0x08059F04

; -- Engine Code
.dw 0x089D7220
; -- Text Code
.dw 0x08059EF4

; -- Engine Code
.dw 0x089D671C
; -- Text Code
.dw 0x08059EE4

; -- Engine Code
.dw 0x089D7038
; -- Text Code
.dw 0x08059ED4

; -- Engine Code
.dw 0x089D6628
; -- Text Code
.dw 0x08059EC4

; -- Engine Code
.dw 0x089D2764
; -- Text Code
.dw 0x08059EB4

; -- Engine Code
.dw 0x089D6088
; -- Text Code
.dw 0x08059EA8

; -- Engine Code
.dw 0x089D7314
; -- Text Code
.dw 0x08059E9C

; -- Engine Code
.dw 0x089D5DC4
; -- Text Code
.dw 0x08059E88

; -- Engine Code
.dw 0x089D5EAC
; -- Text Code
.dw 0x08059E74

; -- Engine Code
.dw 0x089D5F94
; -- Text Code
.dw 0x08059E5C

; -- Engine Code
.dw 0x089D4C8C
; -- Text Code
.dw 0x08059E44

; -- Engine Code
.dw 0x089D4D74
; -- Text Code
.dw 0x08059E2C

; -- Engine Code
.dw 0x089D4E5C
; -- Text Code
.dw 0x08059E14

; -- Engine Code
.dw 0x089D4F44
; -- Text Code
.dw 0x08059DF8

; -- Engine Code
.dw 0x089D502C
; -- Text Code
.dw 0x08059DDC

; -- Engine Code
.dw 0x089D51FC
; -- Text Code
.dw 0x08059DC0

; -- Engine Code
.dw 0x089D5114
; -- Text Code
.dw 0x08059DAC

; -- Engine Code
.dw 0x089D52E4
; -- Text Code
.dw 0x08059D98

; -- Engine Code
.dw 0x089D53CC
; -- Text Code
.dw 0x08059D7C

; -- Engine Code
.dw 0x089D54B4
; -- Text Code
.dw 0x08059D60

; -- Engine Code
.dw 0x089D559C
; -- Text Code
.dw 0x08059D40

; -- Engine Code
.dw 0x089D5684
; -- Text Code
.dw 0x08059D28

; -- Engine Code
.dw 0x089D576C
; -- Text Code
.dw 0x08059D10

; -- Engine Code
.dw 0x089D5854
; -- Text Code
.dw 0x08059CF8

; -- Engine Code
.dw 0x089D593C
; -- Text Code
.dw 0x08059CE0

; -- Engine Code
.dw 0x089D5A24
; -- Text Code
.dw 0x08059CC8

; -- Engine Code
.dw 0x089D5B0C
; -- Text Code
.dw 0x08059CB0

; -- Engine Code
.dw 0x089D5BF4
; -- Text Code
.dw 0x08059C98

; -- Engine Code
.dw 0x089D5CDC
; -- Text Code
.dw 0x08059C80

; -- Engine Code
.dw 0x089D48EC
; -- Text Code
.dw 0x08059C6C

; -- Engine Code
.dw 0x089D4464
; -- Text Code
.dw 0x08059C4C

; -- Engine Code
.dw 0x089D454C
; -- Text Code
.dw 0x08059C2C

; -- Engine Code
.dw 0x089D4634
; -- Text Code
.dw 0x08059C0C

; -- Engine Code
.dw 0x089D4804
; -- Text Code
.dw 0x08059BEC

; -- Engine Code
.dw 0x089D80D0
; -- Text Code
.dw 0x08059BE0

; -- Engine Code
.dw 0x089D42A0
; -- Text Code
.dw 0x08059BD8

; -- Engine Code
.dw 0x089D40D0
; -- Text Code
.dw 0x08059BCC

; -- Engine Code
.dw 0x089D6440
; -- Text Code
.dw 0x08059BA8

; -- Engine Code
.dw 0x089D6534
; -- Text Code
.dw 0x08059B84

; -- Engine Code
.dw 0x089D3E18
; -- Text Code
.dw 0x08059B74

; -- Engine Code
.dw 0x089D68F8
; -- Text Code
.dw 0x08059B64

; -- Engine Code
.dw 0x089D3C48
; -- Text Code
.dw 0x08059B54

; -- Engine Code
.dw 0x089CDAD8
; -- Text Code
.dw 0x08059B3C

; -- Engine Code
.dw 0x089D3A6C
; -- Text Code
.dw 0x08059B1C

; -- Engine Code
.dw 0x089D3984
; -- Text Code
.dw 0x08059AFC

; -- Engine Code
.dw 0x089D35FC
; -- Text Code
.dw 0x08059AEC

; -- Engine Code
.dw 0x089D3268
; -- Text Code
.dw 0x08059ADC

; -- Engine Code
.dw 0x089D3174
; -- Text Code
.dw 0x08059AC8

; -- Engine Code
.dw 0x089D2F98
; -- Text Code
.dw 0x08059AB8

; -- Engine Code
.dw 0x089D2DD4
; -- Text Code
.dw 0x08059AA4

; -- Engine Code
.dw 0x089D2C04
; -- Text Code
.dw 0x08059A94

; -- Engine Code
.dw 0x089DE05C
; -- Text Code
.dw 0x08059A7C

; -- Engine Code
.dw 0x089D2A34
; -- Text Code
.dw 0x08059A74

; -- Engine Code
.dw 0x089D2940
; -- Text Code
.dw 0x08059A64

; -- Engine Code
.dw 0x089D2858
; -- Text Code
.dw 0x08059A58

; -- Engine Code
.dw 0x089D2670
; -- Text Code
.dw 0x08059A44

; -- Engine Code
.dw 0x089D24A0
; -- Text Code
.dw 0x08059A34

; -- Engine Code
.dw 0x089D21DC
; -- Text Code
.dw 0x08059A28

; -- Engine Code
.dw 0x089D23AC
; -- Text Code
.dw 0x08059A18

; -- Engine Code
.dw 0x089D1F18
; -- Text Code
.dw 0x08059A04

; -- Engine Code
.dw 0x089D1C6C
; -- Text Code
.dw 0x080599F4

; -- Engine Code
.dw 0x089D6258
; -- Text Code
.dw 0x080599E4

; -- Engine Code
.dw 0x089D15F0
; -- Text Code
.dw 0x080599D8

; -- Engine Code
.dw 0x089D18CC
; -- Text Code
.dw 0x080599C8

; -- Engine Code
.dw 0x089D19C0
; -- Text Code
.dw 0x080599B4

; -- Engine Code
.dw 0x089D132C
; -- Text Code
.dw 0x080599A4

; -- Engine Code
.dw 0x089D14FC
; -- Text Code
.dw 0x08059990

; -- Engine Code
.dw 0x089D1068
; -- Text Code
.dw 0x08059984

; -- Engine Code
.dw 0x089D1238
; -- Text Code
.dw 0x08059974

; -- Engine Code
.dw 0x089D0DA4
; -- Text Code
.dw 0x08059960

; -- Engine Code
.dw 0x089D0F74
; -- Text Code
.dw 0x08059948

; -- Engine Code
.dw 0x089D0AE0
; -- Text Code
.dw 0x08059934

; -- Engine Code
.dw 0x089D081C
; -- Text Code
.dw 0x08059924

; -- Engine Code
.dw 0x089D09EC
; -- Text Code
.dw 0x08059910

; -- Engine Code
.dw 0x089D0540
; -- Text Code
.dw 0x080598FC

; -- Engine Code
.dw 0x089D0634
; -- Text Code
.dw 0x080598E4

; -- Engine Code
.dw 0x089D0358
; -- Text Code
.dw 0x080598D8

; -- Engine Code
.dw 0x089D044C
; -- Text Code
.dw 0x080598C8

; -- Engine Code
.dw 0x089D0188
; -- Text Code
.dw 0x080598B0

; -- Engine Code
.dw 0x089D634C
; -- Text Code
.dw 0x08059898

; -- Engine Code
.dw 0x089CFED0
; -- Text Code
.dw 0x0805988C

; -- Engine Code
.dw 0x089D0728
; -- Text Code
.dw 0x0805987C

; -- Engine Code
.dw 0x089DD47C
; -- Text Code
.dw 0x08059864

; -- Engine Code
.dw 0x089CDE20
; -- Text Code
.dw 0x0805984C

; -- Engine Code
.dw 0x089CDF08
; -- Text Code
.dw 0x08059834

; -- Engine Code
.dw 0x089CDC24
; -- Text Code
.dw 0x08059818

; -- Engine Code
.dw 0x089D85B4
; -- Text Code
.dw 0x08059800

; -- Engine Code
.dw 0x089CFC1C
; -- Text Code
.dw 0x080597E4

; -- Engine Code
.dw 0x089D7634
; -- Text Code
.dw 0x080597CC

; -- Engine Code
.dw 0x089D77E4
; -- Text Code
.dw 0x080597B0

; -- Engine Code
.dw 0x089D7964
; -- Text Code
.dw 0x08059794

; -- Engine Code
.dw 0x089D7C18
; -- Text Code
.dw 0x08059778

; -- Engine Code
.dw 0x089CD2CC
; -- Text Code
.dw 0x08059760

; -- Engine Code
.dw 0x089CFD60
; -- Text Code
.dw 0x08059744

; -- Engine Code
.dw 0x089CDA0C
; -- Text Code
.dw 0x08059728

; -- Engine Code
.dw 0x089DD8AC
; -- Text Code
.dw 0x0805970C

; -- Engine Code
.dw 0x089DD8EC
; -- Text Code
.dw 0x080596EC

; -- Engine Code
.dw 0x089DD86C
; -- Text Code
.dw 0x080596D4

; -- Engine Code
.dw 0x089CDA0C
; -- Text Code
.dw 0x08059728

; -- Engine Code
.dw 0x089D6D74
; -- Text Code
.dw 0x080596B8

; -- Engine Code
.dw 0x089D6E5C
; -- Text Code
.dw 0x0805969C

; -- Engine Code
.dw 0x089DE0C8
; -- Text Code
.dw 0x0805968C
; Tanooki & Monkey
; -- Engine Code
.dw TanookiMonkeyScript | 0x8000000
; -- Text Code
.dw TanookiMonkeyName | 0x8000000
; Unused Lesson 1
; -- Engine Code
.dw SamuraiDrum1Script | 0x8000000
; -- Text Code
.dw SamuraiDrum1 | 0x8000000
; Unused Lesson 2
; -- Engine Code
.dw SamuraiDrum2Script | 0x8000000
; -- Text Code
.dw SamuraiDrum2 | 0x8000000
; Unused Lesson 3
; -- Engine Code
.dw SamuraiDrum3Script | 0x8000000
; -- Text Code
.dw SamuraiDrum3 | 0x8000000
; End
.dw 0x00000000
.dw 0x00000000
; --- END

; Tanooki & Monkey Debug Load Sequence

; Entrypoint Script
TanookiMonkeyEntrypoint:
.import "code/DebugMenu/entrypoint.bin"
.dw TanookiMonkeyBeatScript | 0x8000000
TanookiMonkeyScript:
; Load Function
.dw 0x0801D86D
.dw TanookiMonkeyEntrypoint | 0x8000000
.dw 0x0801D8D9
.dw 0x00000000
.dw 0x00000000
.dw 0x00000000
; This stangely looks like a size entry, I have no idea how it works...
.dw 0x0000FFFF
; Beatscript Script
TanookiMonkeyBeatScript:
; Load Drum Game
.dw 0x00000204
.dw 0x08017189
.dw 0x089e0378
; Goto 0xa30ae8
.dw 0x0000000D
.dw 0x08a30ae8
.dw 0x00000000
; End
.dw 0x00000001
.dw 0x00000000
.dw 0x00000000

; Samurai Drum 1 Debug Load Sequence

; Entrypoint Script
SamuraiDrum1Entrypoint:
.import "code/DebugMenu/entrypoint.bin"
.dw 0x089d2fd8
SamuraiDrum1Script:
; Load Function
.dw 0x0801D86D
.dw SamuraiDrum1Entrypoint | 0x8000000
.dw 0x0801D8D9
.dw 0x00000000
.dw 0x00000000
.dw 0x00000000
; This stangely looks like a size entry, I have no idea how it works...
.dw 0x0000FFFF

; Samurai Drum 2 Debug Load Sequence

; Entrypoint Script
SamuraiDrum2Entrypoint:
.import "code/DebugMenu/entrypoint.bin"
.dw 0x089D3384
SamuraiDrum2Script:
; Load Function
.dw 0x0801D86D
.dw SamuraiDrum2Entrypoint | 0x8000000
.dw 0x0801D8D9
.dw 0x00000000
.dw 0x00000000
.dw 0x00000000
; This stangely looks like a size entry, I have no idea how it works...
.dw 0x0000FFFF

; Samurai Drum 3 Debug Load Sequence

; Entrypoint Script
SamuraiDrum3Entrypoint:
.import "code/DebugMenu/entrypoint.bin"
.dw 0x089D3F34
SamuraiDrum3Script:
; Load Function
.dw 0x0801D86D
.dw SamuraiDrum3Entrypoint | 0x8000000
.dw 0x0801D8D9
.dw 0x00000000
.dw 0x00000000
.dw 0x00000000
; This stangely looks like a size entry, I have no idea how it works...
.dw 0x0000FFFF