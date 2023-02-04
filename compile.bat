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
%perl-path% "tools\abcde\abcde.pl" -cm abcde::Atlas "build\rh-atlus.gba" "src\script.txt"

tools\4bmpp.exe -p gfx/RhythmGames/NightWalk/beba58_night1_intro.bmp
tools\4bmpp.exe -p gfx/RhythmGames/KarateMan/BE0480_karateman_tiles.bmp
tools\4bmpp.exe -p gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bmp
tools\4bmpp.exe -p gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles.bmp

tools\DSDecmp.exe -c lz10 gfx/RhythmGames/NightWalk/beba58_night1_intro.bin gfx/RhythmGames/NightWalk/beba58_night1_intro
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/KarateMan/BE0480_karateman_tiles.bin gfx/RhythmGames/KarateMan/BE0480_karateman_tiles
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bin gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles
tools\DSDecmp.exe -c lz10 gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles.bin gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles

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