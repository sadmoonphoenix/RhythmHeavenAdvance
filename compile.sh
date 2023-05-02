#!/bin/bash

echo "You must have a system wide installation of Perl, Mono and FFmpeg. See the README"


function nofile {
    read -p "Couldn't find a Rhythm Tengoku ROM, please place a Rev. 0 ROM named \"rh-jpn.gba\" in the root of the project."
    check
}

function fail {
    rm -f build/rh-atlus.gba
    read -p "Building failed! (Press enter to recompile!)"

    clear
    check
}

function tools {
    echo "-- Remove Existing Build Directory, if needed"
    rm -rf build
    mkdir build
    echo "-- Made Build Directory --"
    cp rh-jpn.gba build/rh-atlus.gba
}

function check {
    if [ -e "rh-jpn.gba" ];
    then 
        if ! [ $(uname -o) == "Darwin" ]
        then
            if $(md5sum -c md5sum.txt --status)
            then
                echo "-- File Passed Checks --"
                tools
            else
                echo "-- File Failed Checks --"
                nofile
            fi
        else
            if $(md5 md5sum.txt)
            then
                echo "-- File Passed Checks --"
                tools
            else
                echo "-- File Failed Checks --"
                nofile
            fi
        fi
    else
        echo "-- File Failed Checks --"
        nofile
    fi
}

check

echo "-- Compile Text --"

perl "tools/abcde/abcde.pl" -cm abcde::Atlas "build/rh-atlus.gba" "src/script.txt"

echo "-- Compile Bitmap --"
echo "Waiting..."
bitmapToDo=$(wc -l src/bitmaps_to_compile.md)
bitmapCounter=1
for file in $(cat src/bitmaps_to_compile.md | sed 1,1d)
do
    echo "\e[1A\e[KProccessing... ($bitmapCounter/$bitmapToDo) $file"
    tools/lin/4bmpp -p $file
    bitmapCounter=$((bitmapCounter+1))
done
echo "\e[1A\e[Kecho "\e[1A\e[KProccessing... Done"

echo "-- Compile Graphics --"
echo "Waiting..."
graphicToDo=$(wc -l src/graphics_to_compile.md)
graphicCounter=1
for file in $(cat src/graphics_to_compile.md | sed 1,1d)
do
    echo "\e[1A\e[KProccessing... ($graphicCounter/$graphicToDo) $file"
    mono tools/win/DSDecmp.exe -c lz10 $file.bin $file
    graphicCounter=$((graphicCounter+1))
done
echo "\e[1A\e[Kecho "\e[1A\e[KProccessing... Done"

echo "-- Compile Tile Maps --"
echo "Waiting..."
tileToDo=$(wc -l src/tilemaps_to_compile.md)
tileCounter=1
for file in $(cat src/tilemaps_to_compile.md | sed 1,1d)
do
    echo "\e[1A\e[KProccessing... ($tileCounter/$tileToDo) $file"
    mono tools/win/rhcomp.exe $file
    tileCounter=$((graphicCounter+1))
done
echo "\e[1A\e[Kecho "\e[1A\e[KProccessing... Done"

echo "-- Compile Audio --"
echo "Waiting..."
audioToDo=$(wc -l src/sounds_to_compile.md)
audioCounter=1
for file in $(cat src/sounds_to_compile.md | sed 1,1d)
do
  echo "\e[1A\e[KProccessing... ($audioCounter/$audioToDo) $file"
  ffmpeg -y -i $file.wav -acodec pcm_s8 -ar 13379 -ac 1 -f s8 $file.pcm -loglevel error
  audioCounter=$((audioCounter+1))
done
echo "\e[1A\e[Kecho "\e[1A\e[KProccessing... Done"

echo "-- Compile Code --"

if ! [ $(uname -o) == "Darwin" ]
then
    armips=tools/lin/armips
else
    armips=tools/osx/armips
fi

chmod a+x $armips
if ! $armips src/main.asm
then
    fail
fi

rm -f build/rh-atlus.gba
read -p "Building complete! (Press enter to recompile!)"

clear
check
