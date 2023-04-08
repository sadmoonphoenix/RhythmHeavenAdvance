@echo off

set perl-path="perl"

if exist "tools/perl.exe" (
	echo Found perl override, using that for compilation.
	set perl-path="tools/perl.exe"
)

:check
if exist "rh-jpn.gba" (
	goto tools
) else (
	goto nofile
)

:tools
mkdir build
copy "rh-jpn.gba" "build\rh-atlus.gba"

echo -- Compile Text --

%perl-path% "tools\abcde\abcde.pl" -cm abcde::Atlas "build\rh-atlus.gba" "src\script.txt"

echo -- Compile Bitmap --

tools\4bmpp.exe -p gfx/RhythmGames/NightWalk/beba58_night1_intro.bmp
tools\4bmpp.exe -p gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bmp
tools\4bmpp.exe -p gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles.bmp

echo -- Compile Graphics --

tools\DSDecmp.exe -c lz10 gfx/RhythmGames/NightWalk/beba58_night1_intro.bin gfx/RhythmGames/NightWalk/beba58_night1_intro
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/KarateMan/BE0480_karateman_tiles.bin gfx/RhythmGames/KarateMan/BE0480_karateman_tiles
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/KarateMan/BE9F5C_karateman_intro.bin gfx/RhythmGames/KarateMan/BE9F5C_karateman_intro
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bin gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles.bin gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/BouncyRoad/BEE430_bouncy_intro.bin gfx/RhythmGames/BouncyRoad/BEE430_bouncy_intro
tools\DSDecmp.exe -c lz10 gfx/HealthSafety/D1AD4C_healthsafety_tile.bin gfx/HealthSafety/D1AD4C_healthsafety_tile
tools\DSDecmp.exe -c lz10 gfx/MainMenu/CCB298_mainmenu_tile.bin gfx/MainMenu/CCB298_mainmenu_tile
tools\DSDecmp.exe -c lz10 gfx/Options/C76CA4_options_tile.bin gfx/Options/C76CA4_options_tile
tools\DSDecmp.exe -c lz10 gfx/Studio/CD5D64_studio_bgtile.bin gfx/Studio/CD5D64_studio_bgtile
tools\DSDecmp.exe -c lz10 gfx/RhythmArchives/CC77A4_archives_bgtile.bin gfx/RhythmArchives/CC77A4_archives_bgtile

echo -- Compile Tile Maps ---

tools\rhcomp.exe gfx/HealthSafety/D1AD4C_healthsafety_tile_map.bin
tools\rhcomp.exe gfx/Studio/CD5D64_studio_bgmap.bin
tools\rhcomp.exe gfx/RhythmArchives/CC77A4_archives_bgmap.bin

echo -- Compile Audio --

ffmpeg -y -i "sfx/DrumLessons/one.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/one.pcm" -loglevel error
ffmpeg -y -i "sfx/DrumLessons/two.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/two.pcm" -loglevel error
ffmpeg -y -i "sfx/DrumLessons/three.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/three.pcm" -loglevel error
REM Rhythm Tweezers (Tempo Up)
REM ffmpeg -y -i "sfx/SpaceDance/voices/and1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/and1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/and2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/and2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/down1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/down1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/down2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/down2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/lets1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/lets1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/lets2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/lets2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pa1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pa1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pa2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pa2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pose1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pose1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pose2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pose2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/punch1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/punch1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/punch2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/punch2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/sit1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/sit1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/sit2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/sit2.pcm" -loglevel error

echo -- Compile Code --

tools\armips.exe src/main.asm
echo If no error was found during any of the steps, it should now be compiled. (Press any key to recompile!)

del "build\rh-atlus.gba"

pause > nul
clear
goto tools

:nofile
echo Couldn't find a Rhythm Tengoku (Rev 0) ROM, please place one in the root of the project to continue.
pause
goto check