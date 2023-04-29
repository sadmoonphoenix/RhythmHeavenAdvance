#!/bin/bash

echo "You must have a system wide installation of Perl and Mono"


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
for file in $(cat for_script/bitmaps_to_compile.md | sed 1,1d)
do
    tools/lin/4bmpp -p $file
done

echo "-- Compile Graphics --"
for file in $(cat for_script/graphics_to_compile.md | sed 1,1d)
do
    mono tools/win/DSDecmp.exe -c lz10 $file.bin $file
done

echo "-- Compile Tile Maps --"
for file in $(cat for_script/tilemaps_to_compile.md | sed 1,1d)
do
    mono tools/win/rhcomp.exe $file
done

echo "-- Compile Audio --"

for file in $(cat for_script/sound_to_compile.md | sed 1,1d)
do
  echo $file
  ffmpeg -y -i $file.wav -acodec pcm_s8 -ar 13379 -ac 1 -f s8 $file.pcm -loglevel error
done

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
