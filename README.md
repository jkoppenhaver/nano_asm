# Software Needed
## Assembler (avra)
### Build From Source (Recomended)
1. `sudo apt install make build-essentials -y`
1. `git clone https://github.com/hsoft/avra`
1. `cd avra`
1. `make`
1. `sudo make install`
### Apt Repo
1. `sudo apt install avra`
1. Copy m328pdef.inc into your working directory
## Loader (AVRdude)
### Build From Source
1. Download at [AVRdude Website](http://download.savannah.gnu.org/releases/avrdude/).
1. The apt version of AVRdude works for me so you are on your own.
1. ???
### Apt Repo
1. `sudo apt install avrdude -y`
# Helpful Documents
* [ATmega328P Datasheet](http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf)
 * Instruction Set Summary on page 281
 * Register (Memory) Summary on page 275
 * I/O Ports on page 58
 * General Purpose Registers on page 12
* [Arduino Nano Graphical Pinout](http://www.lehelmatyus.com/wp-content/uploads/2016/12/arduino-nano-pins.png)

# Running Code
## Assemble
`avra <file>.asm`
## Flash hex file to chip
`avrdude -p m328p -c arduino -P <USBCOMPORT> -b 115200 -U flash:w:<filename>.hex`
```
AVRdude Flags
-p Chip - The Arduino and Arduino nano use a atmega328p or just m328p
-c Programmer - The Arduino nanos use the Arduino as the programmer instead of an external programmer
-P Port - This will probably look something like /dev/ttyUSB0
-b Baud Rate - The Arduino uses 115200 bps
-D Disable Auto Erase - (Optional)  AVRdude erases the flash section before it writes to it.  This flag stops that so anything that is not overwritten will retain its value.
-U Memory Operation: Perform a write(w) to the flash memory(flash) section of the chip.  The last part of this flag is the source file.
```
