; This file imports all of the data to the final ROM,
; and does some binhacks that you can toggle using the flags.

.gba
.open "build/rh-atlus.gba","build/rh-eng.gba", 0x08000000

_skiprhythmtest equ 0
_debug equ 0
_debugmenu equ 0
_oamluaconsolemessages equ 0
_spriteluaconsolemessages equ 0
_autoplay equ 0 ; EXPERIMENTAL (VERY GLITCHY)

.if _skiprhythmtest ==1
.warning "Rhythm Test will be skipped, do NOT use for release!"
.endif
.if _debug ==1
.warning "Debug flag enabled! This will result in every part of the game already unlocked, do NOT use for release!"
.endif
.if _debugmenu ==1
.warning "Debug Menu enabled, do NOT use for release!"
.endif
.if _oamluaconsolemessages ==1
.warning "OAM Log Enabled, while not deadly, should be disabled because it might cause lag, or/and more..."
.endif
.if _spriteluaconsolemessages ==1
.warning "Sprite Log Enabled, while not deadly, should be disabled because it might cause lag, or/and more..."
.endif
.if _autoplay ==1
.warning "Auto-Play Enabled, do NOT use for release!"
.endif

.include "src/relocate.asm"

.include "gfx/Font/font.asm"
.include "gfx/RhythmGames/RatRace/ratrace.asm"
.include "gfx/RhythmGames/NightWalk/nightwalk.asm"
.include "gfx/RhythmGames/KarateMan/karateman.asm"
.include "gfx/RhythmGames/TheClappyTrio/clappy.asm"
.include "gfx/RhythmGames/TheSnappyTrio/snappy.asm"
.include "gfx/RhythmGames/Polyrhythm/polyrhythm.asm"
.include "gfx/RhythmGames/BouncyRoad/bouncy.asm"
.include "gfx/RhythmGames/ResultScreen/result.asm"
.include "gfx/RhythmGames/PowerCalligraphy/power.asm"
.include "gfx/RhythmGames/TapTrial/tap.asm"
.include "gfx/RhythmGames/MarchingOrders/marching.asm"
.include "gfx/RhythmGames/MarchingOrders2/marching2.asm"
.include "gfx/RhythmGames/SneakySpirits/sneaky.asm"
.include "gfx/HealthSafety/healthsafety.asm"
.include "gfx/Studio/studio.asm"
.include "gfx/MainMenu/mainmenu.asm"
.include "gfx/RhythmToys/rhythmtoys.asm"
.include "gfx/RhythmArchives/archives.asm"
.include "gfx/GameSelect/gameselect.asm"
.include "gfx/Options/options.asm"
.include "gfx/Common/common.asm"

.include "sfx/DrumLessons/drumlessons.asm"
; .include "sfx/Remix3/remix3.asm"
; .include "sfx/Remix5/remix5.asm"
; .include "sfx/TempoUp/RhythmTweezers/tweezers.asm"
; .include "sfx/SpaceDance/space.asm"

.include "src/DebugMenu/debugmenu.asm"

.include "src/asm_relocate.asm"
.include "src/asm.asm"

.close