#!/bin/bash

echo "You must have a system wide installation of Perl and Mono"

function checkzenity {
    if ! command -v zenity &> /dev/null
    then
        echo "Zenity is not installed. Falling back to terminal interface"
        interface=0
    else
        echo "Zenity is installed."
        interface=1

if [[ $XDG_CURRENT_DESKTOP == *"KDE"* ]]
then
    if ! command -v kdialog &> /dev/null
    then
        echo "KDialog is not installed. Will try to fall back to Zenity"
        checkzenity
    else
        echo "Kdialog is installed."
        interface=2
    fi
else
    checkzenity
   
FILE=rh-jpn.gba

function nofile {
    case $interface in
        0) read -p "Couldn't find a Rhythm Tengoku ROM, please place a Rev. 0 ROM named \"rh-jpn.gba\" in the root of the project.";;
        1) FILE=zenity --error --text="Compilation failed. Press OK to try again.";;
        2) FILE=kdialog --warningyesno "Compilation failed. Press OK to try again." --title "Rhythm Heaven Advance patcher";;
    esac 
    check
}

function fail {
    rm -f build/rh-atlus.gba
    case $interface in
        0) read -p "Building failed! (Press enter to recompile!)";;
        1) FILE=zenity --file-selection --title="Please select a Rhythm Tengoku ROM.";;
        2) FILE=kdialog --title "Please select a Rhythm Tengoku ROM." --getopenfilename . '*.gba';;
    esac
    clear
    check
}

function tools {
    case $interface in
        0) echo "-- Remove Existing Build Directory, if needed --";;
        1) zenity --notification --window-icon="info" --text="Removing existing build directory if needed.";;
        2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Removing existing build directory if needed.";;
    esac
    rm -rf build
    mkdir build
    case $interface in
        0) echo "-- Creating Build Directory --";;
        1) zenity --notification --window-icon="info" --text="Creating build directory.";;
        2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Creating build directory.";;
    esac
    cp $FILE build/rh-atlus.gba
}

function check {
    if [ -e "$FILE" ];
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
                case $interface in
                    0) echo "-- File Passed Checks --";;
                    1) zenity --notification --window-icon="info" --text="Rhythm Tengoku ROM passed checksums!";;
                    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Rhythm Tengoku ROM passed checksums!";;
                esac
                tools
            else
                case $interface in
                    0) echo "-- File Failed Checks --";;
                    1) zenity --error --text="Rhythm Tengoku ROM failed checksums or was not found!";;
                    2) kdialog --title "Rhythm Heaven Advance patcher" --error "Rhythm Tengoku ROM failed checksums or was not found!";;
                esac
                nofile
            fi
        fi
    else
         case $interface in
                    0) echo "-- File Failed Checks --";;
                    1) zenity --error --text="Rhythm Tengoku ROM failed checksums or was not found!";;
                    2) kdialog --title "Rhythm Heaven Advance patcher" --error "Rhythm Tengoku ROM failed checksums or was not found!";;
                esac
        nofile
    fi
}

check

case $interface in
    0) echo "-- Compile Text --";;
    1) zenity --notification --window-icon="info" --text="Compiling text";;
    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Compiling text";;
esac

perl "tools/abcde/abcde.pl" -cm abcde::Atlas "build/rh-atlus.gba" "src/script.txt"

case $interface in
    0) echo "-- Compile Bitmap --";;
    1) zenity --notification --window-icon="info" --text="Compiling bitmaps";;
    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Compiling bitmaps";;
esac

for file in $(cat src/bitmaps_to_compile.md | sed 1,1d)
do
    tools/lin/4bmpp -p $file
done

case $interface in
    0) echo "-- Compile Graphics --";;
    1) zenity --notification --window-icon="info" --text="Compiling graphics";;
    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Compiling graphics";;
esac

for file in $(cat src/graphics_to_compile.md | sed 1,1d)
do
    mono tools/win/DSDecmp.exe -c lz10 $file.bin $file
done

case $interface in
    0) echo "-- Compile Tile Maps --";;
    1) zenity --notification --window-icon="info" --text="Compiling tile maps";;
    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Compiling tile maps";;
esac

for file in $(cat src/tilemaps_to_compile.md | sed 1,1d)
do
    mono tools/win/rhcomp.exe $file
done

case $interface in
    0) echo "-- Compile Audio --";;
    1) zenity --notification --window-icon="info" --text="Compiling audio";;
    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Compiling audio";;
esac

for file in $(cat src/sounds_to_compile.md | sed 1,1d)
do
  echo $file
  ffmpeg -y -i $file.wav -acodec pcm_s8 -ar 13379 -ac 1 -f s8 $file.pcm -loglevel error
done

case $interface in
    0) echo "-- Compile Code --";;
    1) zenity --notification --window-icon="info" --text="Finalising compilation";;
    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Finalising compilation";;
esac

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

case $interface in
    0) echo "-- Done! --";;
    1) zenity --notification --window-icon="info" --text="Done!";;
    2) kdialog --title "Rhythm Heaven Advance patcher" --passivepopup "Done!";;
esac
exit
