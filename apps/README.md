# sbc6502a1 How to build applications

At this repository, many codes are forked from [https://github.com/jefftranter/6502](https://github.com/jefftranter/6502).  
These are for mainly Replica-1 and any other 6502 computers, and other codes are too. 

There are some differences from sbc6502a1, so it is necessary to modify to run on it.

## Customizing For sbc6502a1

Because of the ISA of 6502 MPU, 'Relative jump/branch' operations are very limited, it is difficult to create 'relocatable code'.

Therefore, executable binaries depends on its located address.  
When modifying existing code, the addresses are often modified.

For sbc6502a1,
* RAM area is 32KB
  * 0x0000 - 0x7FFF : 32KB
  * It is recommended to use from around $0300 due to various buffers and stack areas.
* 2 ROM areas are available.
  * 0xA000 - 0xBFFF : 8KB
  * 0xE000 - 0xFFFF : 8KB

To be compatible with Apple1, input and output is performed via the PIA in $D010.  
* Output(DSP)
  * It is recommended to use the wozmon's routine.
* Input(KBD)
  * Operate the PIA directly.

To build binaries, here uses 'ca65'(Assembler) and 'cc65'(C compiler) from 'cc65' package.  
For customizing 'cc65', refer to [develop/README.md](../develop/README.md).

## Contents

* For building BIN (for ROM.hex)
  * [A1-ASSEMBLER](./a1asm/)
  * [Apple1 BASIC](./a1basic/)
  * [jmon](./jmon/)
  * [Krusader](./krusader/)
  * [OSI BASIC](./msbasic/)
  * [VTL02](./vtl02/)
  * [wozmon](./wozmon/)
  * make-ROM.sh : script for making ROM image
* For building BIN and Srec (not for ROM)
  * [fig-FORTH](./fig-forth/)
  * [TinyBASIC](./tinybasic/)
