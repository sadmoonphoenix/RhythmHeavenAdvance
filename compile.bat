@echo off

:check
if exist "ROM/rh-jpn.gba" (
	goto tools
) else (
	goto nofile
)

:tools
del "ROM\rh-atlus.gba"
copy "ROM\rh-jpn.gba" "ROM\rh-atlus.gba"
perl "tools\abcde\abcde.pl" -cm abcde::Atlas "ROM\rh-atlus.gba" "src\script.txt"

tools\4bmpp.exe -p src/Graphics/RhythmGames/NightWalk/beba58_night1_intro.bmp
tools\4bmpp.exe -p src/Graphics/RhythmGames/KarateMan/BE0480_karateman_tiles.bmp
tools\4bmpp.exe -p src/Graphics/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bmp

tools\DSDecmp.exe -c lz10 src/Graphics/RhythmGames/NightWalk/beba58_night1_intro.bin src/Graphics/RhythmGames/NightWalk/beba58_night1_intro
tools\DSDecmp.exe -c lz10 src/Graphics/RhythmGames/KarateMan/BE0480_karateman_tiles.bin src/Graphics/RhythmGames/KarateMan/BE0480_karateman_tiles
tools\DSDecmp.exe -c lz10 src/Graphics/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bin src/Graphics/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles

tools\armips.exe tools/ASM/compile.asm
echo If no error was found during any of the steps, it should now be compiled. (Press any key to recompile!)
pause > nul
clear
goto tools

:nofile
echo Couldn't find a Rhythm Tengoku (Rev 0) ROM inside the ROM folder, please follow the instruction in there
echo Press any key after putting the ROM or leave the program.
pause > nul
goto check