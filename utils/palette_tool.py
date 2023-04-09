# Shaffy

import struct
import sys

def read_palette_file(filename):
    colors = []
    with open(filename, 'rb') as f:
        # Skip RIFF header
        f.read(12)

        # Read "data" chunk
        f.read(8) # Skip "data" signature and chunk size
        version = struct.unpack('<H', f.read(2))[0]
        assert version == 0x0300, 'Invalid PAL version'
        color_count = struct.unpack('<H', f.read(2))[0]
        for i in range(color_count):
            r, g, b, flags = struct.unpack('<BBBB', f.read(4))
            assert flags == 0, 'Invalid PAL color flags'
            colors.append((r, g, b))

    return colors


def write_palette_file(colors, filename):
    # Open file for writing
    with open(filename, 'wb') as f:
        # Write RIFF header
        f.write(struct.pack('<4sI4s', b'RIFF', 4 + 4 + 4 + 2 + 2 + 4 * len(colors), b'PAL ',))

        # Write "data" chunk
        f.write(struct.pack('<4sI2H', b'data', 2 + 2 + 4 * len(colors), 0x0300, len(colors)))
        for color in colors:
            f.write(struct.pack('<3Bb', *color, 0))
            
def read_palette_file_15bit(filename):
    colors = []
    with open(filename, 'rb') as f:
        while True:
            data = f.read(2)
            if not data:
                break
            color = struct.unpack('<H', data)[0]
            r = (color & 31) << 3
            g = ((color >> 5) & 31) << 3
            b = ((color >> 10) & 31) << 3
            colors.append((r, g, b))
    return colors

def write_palette_file_15bit(colors, filename):
    with open(filename, 'wb') as f:
        for r, g, b in colors:
            color = (((r >> 3) & 31) | (((g >> 3) & 31) << 5) | (((b >> 3) & 31) << 10))
            f.write(struct.pack('<H', color))

def main(input_file_path):
    file_type = input_file_path.split(".")[-1]
    
    if file_type == "pal":
        output_file_type = "agp"
    elif file_type == "agp":
        output_file_type = "pal"
    else:
        print("Invalid file type")
        return
        
    output_file_path = ".".join(input_file_path.split(".")[:-1]) + "." + output_file_type
        
    if output_file_type == "agp":
        colors = read_palette_file(input_file_path)
        write_palette_file_15bit(colors, output_file_path)
    else:
        colors = read_palette_file_15bit(input_file_path)
        write_palette_file(colors, output_file_path)

        
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python palette_tool.py [input_file_path]")
    else:
        input_file_path = sys.argv[1]
        main(input_file_path)