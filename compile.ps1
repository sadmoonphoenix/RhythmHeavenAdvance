Write-Host -BackgroundColor Black -ForegroundColor White

$script:perl_path="perl"
$script:ffmpeg_path="ffmpeg"

if (Test-Path -Path "tools\win\perl.exe" -PathType Leaf) {
	Write-Host "Found perl override, using that for compilation."
	$script:perl_path="tools\win\perl.exe"
}

if (Test-Path -Path "tools\win\ffmpeg.exe" -PathType Leaf) {
	Write-Host "Found FFmpeg override, using that for compilation."
	$script:ffmpeg_path="tools\win\ffmpeg.exe"
}

function Invoke-BuildFailure {
  Write-Host "Building failed (Press any key to recompile!)" -BackgroundColor Red -ForegroundColor White
  Remove-Item -Path "build\rh-atlus.gba"
  $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
  Write-Host -BackgroundColor Black -ForegroundColor White
  Clear-Host
  Confirm-ROMExistence
}

function Start-ROMCompilation {
  if (Test-Path -Path "build" -PathType Container) {
    Remove-Item -Path "build" -Recurse
  }
  New-Item -Path . -Name "build" -ItemType "directory" | out-null
  Copy-Item "rh-jpn.gba" -Destination "build\rh-atlus.gba"

  Write-Host "-- Compile Text --"
  & $perl_path "tools\abcde\abcde.pl" -cm abcde::Atlas "build\rh-atlus.gba" "src\script.txt"

  Write-Host "-- Compile Bitmap --"
  foreach ($file in Get-Content -Path .\src\bitmaps_to_compile.md | Select-Object -Skip 1) {
    & .\tools\win\4bmpp.exe -p $file
  }

  Write-Host "-- Compile Graphics --"
  foreach ($file in Get-Content -Path .\src\graphics_to_compile.md | Select-Object -Skip 1) {
    & .\tools\win\DSDecmp.exe -c lz10 "$file.bin" $file
  }

  Write-Host "-- Compile Tile Maps --"
  foreach ($file in Get-Content -Path .\src\tilemaps_to_compile.md | Select-Object -Skip 1) {
    & .\tools\win\rhcomp.exe $file
  }

  Write-Host "-- Compile Audio --"
  foreach ($file in Get-Content -Path .\src\sounds_to_compile.md | Select-Object -Skip 1) {
    & $ffmpeg_path -y -i "$file.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "$file.pcm" -loglevel error 
  }

  Write-Host "-- Compile Code --"
  & tools\win\armips.exe src\main.asm
  # Theres probably a way to do this on one line but oh well
  if ($LASTEXITCODE -ne 0) {
    Invoke-BuildFailure
  }

  Write-Host "Building complete (Press any key to recompile!)" -BackgroundColor Black -ForegroundColor White
  Remove-Item -Path "build\rh-atlus.gba"
  $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp")
  Clear-Host
  Confirm-ROMExistence
}

function Show-NoFileError {
  Write-Host "Couldn't find a Rhythm Tengoku ROM, please place one in the root of the project to continue."
  Write-Host "Press any key to continue..."
  $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
  Clear-Host
  Confirm-ROMExistence
}

function Confirm-ROMExistence {
  if (Test-Path -Path "rh-jpn.gba" -PathType Leaf) {
    Start-ROMCompilation
  } else {
    Show-NoFileError
  }
}

Confirm-ROMExistence