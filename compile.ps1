@echo off

# clean this out

$script:perl_path="perl"

if (Test-Path -Path "tools\win\perl.exe" -PathType Leaf) {
	Write-Output "Found perl override, using that for compilation."
	$script:perl_path="tools\win\perl.exe"
}



function Confirm-ROMExistence {
  if (Test-Path -Path "rh-jpn.gba" -PathType Leaf) {
    Start-ROMCompilation
  } else {
    Show-NoFileError
  }
}

function Start-ROMCompilation {
  New-Item -Path . -Name "build" -ItemType "directory"
  Copy-Item "rh-jpn.gba" -Destination "build"

  Write-Output "-- Compile Text --"

  $perl_path "tools\abcde\abcde.pl" -cm abcde::Atlas "build\rh-atlus.gba" "src\script.txt"

  echo -- Compile Bitmap --

  setlocal EnableDelayedExpansion
  for /f "skip=1 delims=" %%f in (src/bitmaps_to_compile.md) do (
    set "file=%%f"
    tools\win\4bmpp.exe -p !file!
  )
  endlocal

  echo -- Compile Graphics --

  setlocal EnableDelayedExpansion
  for /f "skip=1 delims=" %%f in (src/graphics_to_compile.md) do (
    set "file=%%f"
    tools\win\DSDecmp.exe -c lz10 !file!.bin !file!
  )
  endlocal

  echo -- Compile Tile Maps ---

  setlocal EnableDelayedExpansion
  for /f "skip=1 delims=" %%f in (src/tilemaps_to_compile.md) do (
    set "file=%%f"
    tools\win\rhcomp.exe !file!
  )
  endlocal

  echo -- Compile Audio --

  setlocal EnableDelayedExpansion
  for /f "skip=1 delims=" %%f in (src/sounds_to_compile.md) do (
    set "file=%%f"
    echo !file!
    ffmpeg -y -i !file!.wav -acodec pcm_s8 -ar 13379 -ac 1 -f s8 !file!.pcm -loglevel error
  )
  endlocal

  echo -- Compile Code --

  tools\win\armips.exe src/main.asm
  if %ERRORLEVEL% NEQ 0 (
      goto fail
  )

  color 0f
  echo Building complete (Press any key to recompile!)
  del "build\rh-atlus.gba"

  pause > nul

  cls
  goto check

}

:nofile
echo Couldn't find a Rhythm Tengoku ROM, please place one in the root of the project to continue.
pause
goto check

:fail
color 4f

echo Building failed (Press any key to recompile!)
del "build\rh-atlus.gba"

pause > nul

color 0f
cls
goto check
