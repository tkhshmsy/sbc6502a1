# sbc6502a1 firmware

## Quick Install
ROM and PIA Communicator are required to run sbc6502a1.

### ROM

make ROM with ROM writer.

```bash
## using T48 (TL866-3G) on Ubuntu
$ sudo apt-get install build-essential pkg-config git libusb-1.0-0-dev
### get from repository
$ git clone https://gitlab.com/DavidGriffith/minipro/
$ cd minipro
$ git checkout 0.7
$ make
### install as dpkg
$ sudo apt-get install fakeroot debhelper dpkg-dev
$ fakeroot dpkg-buildpackage -b -us -uc
$ sudo apt install ../minipro_0.4-1_amd64.deb
## write the example image for W27C512
$ minipro -p W27C512@DIP28 -f ihex -w ROM-rev1.hex
```

### PIA Communicator
write 'PIA Communicator' into Arduino Nano.

* Original repository:  https://github.com/jblang/pia_communicator

```bash
### on Ubuntu
$ sudo apt install binutils-avr gcc-avr avr-libc avrdude
### get from repository
$ git submodule update -i
$ cd firmware/pia_communicator
### edit Makefile for your environment, and install
$ vim Makefile
$ make
$ make install
```

### Boot

1. install ROM and PIA Communicator into sbc6502a1 PCB.
2. choose JP1, open for Bank0 and close for Bank1.
3. close JP2.
4. connect HostPC with USB cable via ArduinoNano's USBport.
   1. so JP2 close, sbc6502a1 is powered from ArduinoNano.
   2. "wozmon" will start.
5. start minicom on HostPC.
6. Enjoy !

```bash
$ minicom -b 115200 -D /dev/ttyUSB0
```

## Contents of "ROM-rev1.hex"

this image is the example.

all contained programs are from other repositories.

* BANK0 (JP1 open)
  * A000 - OSI BASIC 1.0 Rev 3.2
    * 8KB, start: BD0D
    * Microsoft BASIC Interpreter with 6 digit floating point
  * E000 - TinyBASIC 0.2.2
    * 2KB, start: E000
    * TinyBASIC Interpreter
  * F000 - VTL02 C
    * 1KB, start: F000
    * VTL02 Interpreter
  * FF00 - wozmon
    * start: FF00, RESET
* BANK1 (JP1 close)
  * A000 - jmon
    * 8KB, start: A000
    * Assembler/Disassembler monitor, support SRecord format
  * E000 - a1basic
    * 4KB, start: E000
    * Apple1 Integer BASIC Interpreter
  * F000 - Krusader 1.3
    * 4KB, start: F000
    * Assembler/Disassembler monitor
  * FF00 - Krusader's minimonitor
    * start: FF00, RESET
    * modified wozmon
