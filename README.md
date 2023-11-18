# Rhythm Heaven Advance
![Rhythm Heaven Advance](images/logo.svg?raw=true "Rhythm Heaven Advance")

This repository is for the unofficial English localisation of Rhythm Tengoku, **Rhythm Heaven Advance**.

**There is no full release yet**, you can compile it yourself though.
Project's Discord (*playtesting* builds available there): https://discord.gg/VnCKdW8VBJ

# Installation
You will need:
* A legally obtained ROM of Rhythm Tengoku **(Rev 0)** (CRC32: `349D7025`)
* An IPS patcher (like this one: https://www.marcrobledo.com/RomPatcher.js/)

And you just patch your ROM!


# Contribution
Everyone can contribute! So if you want to contribute, please join our [Discord server](https://discord.gg/VnCKdW8VBJ) where we need the helping hands for now in:
* Proof-reading
* Graphic Designers
* Voice Actors
* Playtesters

# Building
You'll need a legally obtained ROM of Rhythm Tengoku (Rev 0) (CRC32: 349D7025) for all systems.

### Windows
If you want to be able to edit the audio files on Windows you'll need to have FFmpeg and Perl on the root of project or in your PATH. These will be automagically installed for you.

1. Open a command prompt.
2. Download the Rhythm Heaven Advance repository.
	```batch
	git clone https://github.com/ShaffySwitcher/RhythmHeavenAdvance
	cd RhythmHeavenAdvance
	```
	or you could also just download the source directly from GitHub [here](https://github.com/ShaffySwitcher/RhythmHeavenSilver/archive/refs/heads/master.zip) (not recommended).
3. Put a Rhythm Tengoku (Rev 0) (CRC32: `349D7025`) ROM named "rh-jpn.gba" at the root of the project.
4. Compile.
	```batch
	compile.bat
	```
	or by simply clicking on "compile.bat" with your mouse.
	
If compiling worked you should have an ROM of Rhythm Heaven Advance into the "build" folder called "rh-eng.gba"!
	
### Dependencies
On Linux & macOS you need to install Perl, Mono, FFmpeg, and Git. These will be automagically installed for you.

On Linux systems, you can install them from your native package manager if you haven't already:
### Linux & macOS

1. Open a terminal.
2. Download the Rhythm Heaven Advance repository.
	```bash
	git clone https://github.com/ShaffySwitcher/RhythmHeavenAdvance
	cd RhythmHeavenAdvance
	```
	or you could also just download the source directly from GitHub [here](https://github.com/ShaffySwitcher/RhythmHeavenAdvance/archive/refs/heads/master.zip) (not recommended).
3. Put a Rhythm Tengoku (Rev 0) (CRC32: `349D7025`) ROM named "rh-jpn.gba" at the root of the project.
4. Compile.
    ```bash 
    chmod +x compile.sh; ./compile.sh
    ```
    or
    ```bash
    ./compile.sh
    ```
    
If compiling worked you should have an ROM of Rhythm Heaven Advance into the "build" folder called "rh-eng.gba"!

# Credits
*T.B.D.*

# Contact
If you have any questions feel free to join the [Discord server](https://discord.gg/VnCKdW8VBJ), or contact to me directly on Discord! (Shaffy#3991)

# Links
Rhythm Heaven Advance's Official Website (W.I.P.): https://shaffy.fr/advance/
