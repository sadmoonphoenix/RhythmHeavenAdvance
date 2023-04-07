set dt=%DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%-%TIME:~0,2%_%TIME:~3,2%_%TIME:~6,2%
set dt=%dt: =0%

ShaffyOnly\lips.exe -CreateIPS "ShaffyOnly\patches\Rhythm Heaven Advance - %dt%.ips" rh-jpn.gba build\rh-eng.gba