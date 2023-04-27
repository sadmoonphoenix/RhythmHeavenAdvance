#!/bin/bash

echo "Notice: The following programs must be installed system-wide: Mono, Perl, Wine (hopefully to be replaced with binaries soon)"

function check {
    if [ -e "rh-jpn.gba" ];
    then 
        tools
    else
        nofile
    fi
}

function tools {
    mkdir build
    cp rn-jpn.gba build/rh-atlus.gba
}

echo "-- Compile Text --"

perl "tools/abcde/abcde.pl" -cm abcde::Atlas "build/rh-atlus.gba" "src/script.txt"

echo "-- Compile Bitmap --"


wine tools/4bmpp.exe -p gfx/RhythmGames/NightWalk/beba58_night1_intro.bmp
wine tools/4bmpp.exe -p gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bmp
wine tools/4bmpp.exe -p gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles.bmp

echo "-- Compile Graphics --"

mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/NightWalk/beba58_night1_intro.bin gfx/RhythmGames/NightWalk/beba58_night1_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/KarateMan/BE0480_karateman_tiles.bin gfx/RhythmGames/KarateMan/BE0480_karateman_tiles
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/KarateMan/BE9F5C_karateman_intro.bin gfx/RhythmGames/KarateMan/BE9F5C_karateman_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles.bin gfx/RhythmGames/TheClappyTrio/BF16B4_clappy_intro_tiles
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/TheClappyTrio/C61654_clappy_obj.bin gfx/RhythmGames/TheClappyTrio/C61654_clappy_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles.bin gfx/RhythmGames/TheSnappyTrio/BF374C_snappy_intro_tiles
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/BouncyRoad/BEE430_bouncy_intro.bin gfx/RhythmGames/BouncyRoad/BEE430_bouncy_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/ResultScreen/CD4A50_result_tile.bin gfx/RhythmGames/ResultScreen/CD4A50_result_tile
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/PowerCalligraphy/BF8A30_power_intro.bin gfx/RhythmGames/PowerCalligraphy/BF8A30_power_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/Polyrhythm/c00010_polyrhythm_intro_obj.bin gfx/RhythmGames/Polyrhythm/c00010_polyrhythm_intro_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/Polyrhythm/c0212c_polyrhythm_intro_bg.bin gfx/RhythmGames/Polyrhythm/c0212c_polyrhythm_intro_bg
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/Polyrhythm/C781AC_polyrhythm_obj.bin gfx/RhythmGames/Polyrhythm/C781AC_polyrhythm_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/TapTrial/C26340_tap_intro.bin gfx/RhythmGames/TapTrial/C26340_tap_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/MarchingOrders/BFA204_marching_intro.bin gfx/RhythmGames/MarchingOrders/BFA204_marching_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/SneakySpirits/BE0FF8_sneaky_intro.bin gfx/RhythmGames/SneakySpirits/BE0FF8_sneaky_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/MarchingOrders2/BFC8F4_marching2_intro.bin gfx/RhythmGames/MarchingOrders2/BFC8F4_marching2_intro
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/TempoUp/KarateMan/karateman_extra_tiles.bin gfx/RhythmGames/TempoUp/KarateMan/karateman_extra_tiles
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/QuizShow/C7C8E0_quizshow_obj.bin gfx/RhythmGames/QuizShow/C7C8E0_quizshow_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/QuizShow/C7D2AC_quizshow_bg.bin gfx/RhythmGames/QuizShow/C7D2AC_quizshow_bg
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/RhythmTweezers/BEE62C_tweezers_intro_obj.bin gfx/RhythmGames/RhythmTweezers/BEE62C_tweezers_intro_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/RatRace/C21F88_ratrace_intro_obj.bin gfx/RhythmGames/RatRace/C21F88_ratrace_intro_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/NinjaBodyguard/C22EE4_bodyguard_intro_obj.bin gfx/RhythmGames/NinjaBodyguard/C22EE4_bodyguard_intro_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/NinjaBodyguard/C23A3C_bodyguard_intro_bg.bin gfx/RhythmGames/NinjaBodyguard/C23A3C_bodyguard_intro_bg
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/TheBonOdori/BE75B8_bonodori_intro_obj.bin gfx/RhythmGames/TheBonOdori/BE75B8_bonodori_intro_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmGames/TossTeam/C2A208_tossteam_intro_obj.bin gfx/RhythmGames/TossTeam/C2A208_tossteam_intro_obj
mono tools/DSDecmp.exe -c lz10 gfx/GameSelect/CC9854_gameselect_bg.bin gfx/GameSelect/CC9854_gameselect_bg
mono tools/DSDecmp.exe -c lz10 gfx/GameSelect/CC9148_gameselect_obj.bin gfx/GameSelect/CC9148_gameselect_obj
mono tools/DSDecmp.exe -c lz10 gfx/HealthSafety/D1AD4C_healthsafety_tile.bin gfx/HealthSafety/D1AD4C_healthsafety_tile
mono tools/DSDecmp.exe -c lz10 gfx/MainMenu/CCB298_mainmenu_tile.bin gfx/MainMenu/CCB298_mainmenu_tile
mono tools/DSDecmp.exe -c lz10 gfx/Studio/CD5D64_studio_bgtile.bin gfx/Studio/CD5D64_studio_bgtile
mono tools/DSDecmp.exe -c lz10 gfx/Options/C76CA4_options_tile.bin gfx/Options/C76CA4_options_tile
mono tools/DSDecmp.exe -c lz10 gfx/RhythmArchives/CC77A4_archives_bgtile.bin gfx/RhythmArchives/CC77A4_archives_bgtile
mono tools/DSDecmp.exe -c lz10 gfx/RhythmToys/RapMachine/CDBACC_rapmachine_bg.bin gfx/RhythmToys/RapMachine/CDBACC_rapmachine_bg
mono tools/DSDecmp.exe -c lz10 gfx/RhythmToys/ConfessionMachine/CDD0D4_confessionmachine_bg.bin gfx/RhythmToys/ConfessionMachine/CDD0D4_confessionmachine_bg
mono tools/DSDecmp.exe -c lz10 gfx/RhythmToys/CatMachine/CDA118_catmachine_bg.bin gfx/RhythmToys/CatMachine/CDA118_catmachine_bg
mono tools/DSDecmp.exe -c lz10 gfx/RhythmToys/CD8388_rhythmtoys_obj.bin gfx/RhythmToys/CD8388_rhythmtoys_obj
mono tools/DSDecmp.exe -c lz10 gfx/RhythmToys/CD8DA0_rhythmtoys_bg.bin gfx/RhythmToys/CD8DA0_rhythmtoys_bg
mono tools/DSDecmp.exe -c lz10 gfx/EndlessGames/CC3B7C_endlessgames_obj.bin gfx/EndlessGames/CC3B7C_endlessgames_obj
mono tools/DSDecmp.exe -c lz10 gfx/EndlessGames/CC4670_endlessgames_bg.bin gfx/EndlessGames/CC4670_endlessgames_bg
mono tools/DSDecmp.exe -c lz10 gfx/DrumLessons/CC5E8C_drumlessons_obj.bin gfx/DrumLessons/CC5E8C_drumlessons_obj
mono tools/DSDecmp.exe -c lz10 gfx/DrumLessons/CC6914_drumlessons_bg.bin gfx/DrumLessons/CC6914_drumlessons_bg
mono tools/DSDecmp.exe -c lz10 gfx/Perfect/CCC138_perfect_bg.bin gfx/Perfect/CCC138_perfect_bg

echo -- Compile Tile Maps ---

wine tools/rhcomp.exe gfx/HealthSafety/D1AD4C_healthsafety_tile_map.bin
wine tools/rhcomp.exe gfx/Studio/CD5D64_studio_bgmap.bin
wine tools/rhcomp.exe gfx/RhythmArchives/CC77A4_archives_bgmap.bin
wine tools/rhcomp.exe gfx/RhythmGames/Polyrhythm/c0212c_polyrhythm_intro_bg_map.bin
wine tools/rhcomp.exe gfx/RhythmGames/QuizShow/C7D2AC_quizshow_bg_map.bin
wine tools/rhcomp.exe gfx/RhythmGames/NinjaBodyguard/C23A3C_bodyguard_intro_bg_map.bin
# I honestly have no idea how this one works, it's not a tile map...
wine tools/rhcomp.exe gfx/Common/CCCA5C_common_tiles.bin
wine tools/rhcomp.exe gfx/RhythmToys/RapMachine/CDBACC_rapmachine_map.bin
wine tools/rhcomp.exe gfx/RhythmToys/ConfessionMachine/CDD0D4_confessionmachine_map.bin
wine tools/rhcomp.exe gfx/RhythmToys/CatMachine/CDA118_catmachine_bg_map.bin
wine tools/rhcomp.exe gfx/RhythmToys/CD8DA0_rhythmtoys_bg_map.bin
wine tools/rhcomp.exe gfx/EndlessGames/CC4670_endlessgames_bg_map.bin
wine tools/rhcomp.exe gfx/DrumLessons/CC6914_drumlessons_bg_map.bin
wine tools/rhcomp.exe gfx/Perfect/CCC138_perfect_map.bin

echo -- Compile Audio --

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

echo -- Compile Code --

if ! tools/armips src/main.asm
then
    fail
fi

rm -f build/rh-atlus.gba
read -p "Building complete! (Press enter to recompile!)"

clear
check

function nofile {
read -p "Couldn't find a Rhythm Tengoku ROM, please place one in the root of the project, then press enter."
check
}

function fail {
rm -f build/rh-atlus.gba
read -p "Building failed! (Press enter to recompile!)"

clear
check
}
