# sbc6502a1 How to develop

Generally, the development for 8bit MPUs is done by Assembler.  
But, C language is available for 6502.

['cc65'](https://github.com/cc65/cc65) contains C Compiler, Assembler, Linker for 6502 MPU.  

Let's custom cc65 for sbc6502a1.

## Build cc65

Here is a patch and build-script to add new target sbc6502a1.

```bash
## download, patch and build
$ cd develop/cc65
$ ./build-cc65.sh
## install
$ cd cc65
$ sudo make PREFIX=/usr/local install
```

### Detail of the patch

this patch is refer to the configurations for KIM-1.

* asminc/sbc6502a1.inc
  * common include file for ca65 assembler
    * RAMSTART is entry point of code
    * KBD, KBDRDY is come from the address of PIA
    * RESET is reset vector to start/return wozmon
    * ECHO is the routine of wozmon to send 1 character via PIA
* cfg/sbc6502a1.cfg
  * configurations for ld65 linker
    * memory map is defined by the circuit of sbc6502a1 PCB.
      * RAM is 32KB from 0x0000 to 0x7FFF
      * ROM is 8KB+8KB, but reserve 24KB from 0xA000 to 0xFFFF
* libsrc/sbc6502a1/*.s
  * library routines used from C, mainly to support wozmons' routines and PIA.
  * crt0.s
    * startup routine
    * clear BCD Math mode, prepare stack, call main() and return to wozmon.
  * ctype.s
    * set character type.
  * getkey.s
    * int getkey()
      * return character code.
  * kbhit.s
    * unsigned char kbhit()
      * return key pressed(=1) or not(=0).
      * if pressed, the result is keep until getkey() or read().
  * read.s
    * read()
      * read from KBD.
  * write.s
    * write()
      * output to DSP.
* src/ca65/main.c
* src/cc65/main.c
* src/common/target.c
* src/common/target.h
* target/Makefile
* targettest/Makefile
  * add new target sbc6502a1
  * In 'src/common/target.c', TargetMap[] requires SORTED list.

## using Assembler ca65

### Assemble and Link

For example, simple 'Hello, world!' (saved as 'hello.s')

```assembler
.include        "sbc6502a1.inc"

    .segment    "STARTUP"   ; no use but avoid ld65's warning
    .segment    "CODE"
    .org        $0300       ; start at $0300
main:
    cld                     ; clear BCD Math mode
    ldy         #0          ; Y = 0
loop:
    lda         message,y   ; A = message[Y]
    beq         done        ; if A == $00 then goto done
    jsr         ECHO        ; ECHO A, subroutine in wozmon
    iny                     ; Y++
    jmp         loop        ; goto loop
done:
    jmp         RESET       ; exit to RESET

    .segment    "RODATA"
message:
    .byte       $0D, $0A, "Hello, world!", $0D, $0A, $00

    .segment    "ONCE"      ; no use but avoid ld65's warning
    .segment    "DATA"      ; no use
```

Assemble and link,

```bash
$ export PLATFORM=sbc6502a1
## assemble
$ ca65 -t ${PLATFORM} -l hello.lst hello.s
## link
$ ld65 -t ${PLATFORM} -L /usr/local/share/cc65 -m hello.map -o hello hello.o 
```

Here, you gets 'hello' binary.

## using C Compiler cc65

### Compile and Link

For example, simple 'Hello, world!' (saved as 'hello.c')

```c
#include <stdio.h>

int main(void)
{
  printf("Hello, world!\n");
  return;
}
```

Compile and link,

```bash
## use cl65 to compile, assemble and link.
$ export PLATFORM=sbc6502a1
$ CC65_HOME=/usr/local/share/cc65 cl65 -O -vm -m hello.map -t ${PLATFORM} hello.c

## OR you can do each step separately.
### compile to make assembly code
$ cc65 -t ${PLATFORM} -O hello.c
### assemble to make object file
$ ca65 -t ${PLATFORM} -l hello.lst hello.s
### link all
$ ld65 -t ${PLATFORM} -L /usr/local/share/cc65/lib -o hello -m hello.map hello.o ${PLATFORM}.lib
```
Here, you gets 'hello' binary.

## Deploy into sbc6502a1
sbc6502a1 has no storage device but only serial comm.  
To deploy the program via serial, sending as IntelHex or MotorolaHex( called S-record ) formatted file is general way.  
'jmon' which is in example ROM is supported to load and run S-record file.

To make S-record file, here is 2 way. you can select one of them.
```bash
# convert hello(binary) to hello.srec(S-record)
# load address is 0x0300, and start address is 0x0300

## with srec_cat from 'srecord'
$ srec_cat hello -binary -offset 0x0300 -o hello.srec -Execution_Start_Address 0x0300

## with objcopy from 'binutils'
$ objcopy -I binary -O srec --change-addresses 0x0300 --set-start 0x0300 hello hello.srec
```

To use jmon, you need to close JP1 with example ROM image ( ROM-rev1.hex ).  
Then, boot the sbc6502a1 and open minicom.

At boot, wozmon is running. To run jmon, type 'A000R<CR>'

```
A000R

JMON MONITOR 1.3.9 BY JEFF TRANTER
? 
```

jmon is started. Type 'J' to ready to receive,

```
LOADING
```

And send S-record file from another terminal.
If the system clock is slow, you may need to send SLOWLY.

```
$ cat hello.srec > /dev/ttyUSB0
```

After sending, automatically run the program, and exit to wozmon.

```
LOADED
Hello, World!

\
```
