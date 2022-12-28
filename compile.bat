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