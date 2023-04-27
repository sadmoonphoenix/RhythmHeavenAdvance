#!/bin/bash

function package_install_debian () {
    packages=""
    if [[ $(dpkg -l perl) != *"ii  perl"* ]]
    then
        packages+="perl"
    fi
    if [[ $(dpkg -l mono-runtime) != *"ii  mono-runtime"* ]]
    then
        packages+="mono-runtime"
    fi

    if [[ $packages != "" ]]
    then
        echo "Installing missing packages: $packages"
        if [[ $(id -u) != "0" ]]
        then
            echo "This step requires root access"
            sudo apt install $packages
        else
            apt install $packages
        fi
    fi
}

function package_check_linux () {
    systeminfo=$(uname -a)
    if [[ $systeminfo == *"Debian"* ]]
    then
        package_install_debian
    fi
}

echo "You must have a system wide installation of Perl and Mono"

package_check_linux

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

echo "-- Compile Audio (Unimplemented, skipping) --"

# ffmpeg -y -i "sfx/DrumLessons/one.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/one.pcm" -loglevel error
# ffmpeg -y -i "sfx/DrumLessons/two.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/two.pcm" -loglevel error
# ffmpeg -y -i "sfx/DrumLessons/three.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/three.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/6FCCE8_remix5_music_0.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/6FCCE8_remix5_music_0.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/703D60_remix5_music_1.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/703D60_remix5_music_1.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/70A898_remix5_music_2.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/70A898_remix5_music_2.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/716DA4_remix5_music_3.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/716DA4_remix5_music_3.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/7251F8_remix5_music_4.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/7251F8_remix5_music_4.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/730FCC_remix5_music_5.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/730FCC_remix5_music_5.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/737894_remix5_music_6.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/737894_remix5_music_6.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/73E77C_remix5_music_7.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/73E77C_remix5_music_7.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/744E60_remix5_music_8.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/744E60_remix5_music_8.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/74A9A4_remix5_music_9.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/74A9A4_remix5_music_9.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/751808_remix5_music_10.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/751808_remix5_music_10.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/75870C_remix5_music_11.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/75870C_remix5_music_11.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/75E670_remix5_music_12.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/75E670_remix5_music_12.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/765294_remix5_music_13.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/765294_remix5_music_13.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/76BE38_remix5_music_14.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/76BE38_remix5_music_14.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/772F3C_remix5_music_15.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/772F3C_remix5_music_15.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/774F60_remix5_music_16.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/774F60_remix5_music_16.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/7770BC_remix5_music_17.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/7770BC_remix5_music_17.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/778BB4_remix5_music_18.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/778BB4_remix5_music_18.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/77FE60_remix5_music_19.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/77FE60_remix5_music_19.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/784644_remix5_music_20.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/784644_remix5_music_20.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/78C590_remix5_music_21.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/78C590_remix5_music_21.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix5/7912A0_remix5_music_22.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/7912A0_remix5_music_22.pcm" -loglevel error

# ffmpeg.exe -y -i "sfx/Remix3/64b0b8_remix3_0.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/64b0b8_remix3_0.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/654188_remix3_1.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/654188_remix3_1.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/65783c_remix3_2.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/65783c_remix3_2.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/65c083_remix3_3.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/65c083_remix3_3.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/661bb7_remix3_4.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/661bb7_remix3_4.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/66699c_remix3_5.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/66699c_remix3_5.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/66fc92_remix3_6.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/66fc92_remix3_6.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/67b7b9_remix3_7.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/67b7b9_remix3_7.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/67ce68_remix3_8.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/67ce68_remix3_8.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/685fb1_remix3_9.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/685fb1_remix3_9.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/68b861_remix3_10.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/68b861_remix3_10.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/690e26_remix3_11.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/690e26_remix3_11.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/692868_remix3_12.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/692868_remix3_12.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/69858b_remix3_13.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/69858b_remix3_13.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/69ad4b_remix3_14.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/69ad4b_remix3_14.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/6a10ec_remix3_15.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6a10ec_remix3_15.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/6a90fe_remix3_16.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6a90fe_remix3_16.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/6b0af1_remix3_17.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6b0af1_remix3_17.pcm" -loglevel error
# ffmpeg.exe -y -i "sfx/Remix3/6c3a59_remix3_18.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6c3a59_remix3_18.pcm" -loglevel error

# Rhythm Tweezers (Tempo Up)
# ffmpeg -y -i "sfx/SpaceDance/voices/and1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/and1.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/and2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/and2.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/down1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/down1.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/down2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/down2.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/lets1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/lets1.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/lets2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/lets2.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/pa1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pa1.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/pa2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pa2.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/pose1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pose1.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/pose2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pose2.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/punch1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/punch1.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/punch2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/punch2.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/sit1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/sit1.pcm" -loglevel error
# ffmpeg -y -i "sfx/SpaceDance/voices/sit2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/sit2.pcm" -loglevel error

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
