@echo off

:test
if exist "ROM/rh-jpn.gba" (
	goto tools
) else (
	goto nofile
)

:tools
del "ROM\rh-atlus.gba"
copy "ROM\rh-jpn.gba" "ROM\rh-atlus.gba"
perl "tools\abcde\abcde.pl" -cm abcde::Atlas "ROM\rh-atlus.gba" "src\script.txt"
tools\armips.exe asm/compile.asm

echo Done, this script only and ONLY assemble the graphics and text into the ROM, if the graphics were updated, then it will not update them, you should compile them again. (Press any key to recompile!)
pause > nul
goto tools

:nofile
echo Couldn't find a Rhythm Tengoku (Rev 0) ROM inside the ROM folder, please follow the instruction in there
echo Press any key after putting the ROM or leave the program.
pause > nul
goto test