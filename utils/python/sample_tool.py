import os
import sys

def print_and_create_asm_files(folder):
    with open("aaa_relocate.asm", "w") as f:
        for root, dirs, files in os.walk(folder):
            for file in files:
                if file.endswith(".pcm"):
                    pcm_path = os.path.join(root, file)
                    filesize = os.path.getsize(pcm_path)
                    filesize_hex = hex(filesize)
                    asm_path = os.path.splitext(pcm_path)[0] + ".asm"
                    print(pcm_path)
                    
                    asm_content  = '''.align 2
{filename}:
.import "Directory/{filename}.pcm"

.align 4
sampleinfo_{filename}:
.dw {filesize}
.dw 22050
.dw 60
.dw 0x0
.dw 0x0
.dw {filename} | 0x8000000

.align 4
instrumentheader_{filename}:
.dw 0x007F3C41
.dw sampleinfo_{filename} | 0x8000000
.dw 0x007F0000 ; unk (initial)
.dw 0x00000000 ; sustain
.dw 0x007f0000 ; attack
.dw 0x00000000 ; decay
.dw 0x00000000 ; fade
.dw 0x00600000 ; release

'''
                    asm_content = asm_content.format(filename=os.path.splitext(file)[0], filesize=filesize_hex)
                    
                    f.write(asm_content)
                    
if len(sys.argv) > 1:
    target_folder = sys.argv[1]
else:
    target_folder = os.getcwd() 

print_and_create_asm_files(target_folder)
