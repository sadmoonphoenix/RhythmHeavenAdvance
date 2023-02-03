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

tools\armips.exe src/main.asm
echo Done, this script only and ONLY assemble the graphics and text into the ROM, if the graphics were updated, then it will not update them, you should compile them again. (Press any key to recompile!)

del "build\rh-atlus.gba"

pause > nul
clear
goto tools

:nofile
echo Couldn't find a Rhythm Tengoku (Rev 0) ROM, please place one in the root of the project to continue.
pause
goto check