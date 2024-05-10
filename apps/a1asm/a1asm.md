# a1asm

A1-Assembler is online symbolic assembler for 6502 based on the SB-Assembler.

For sbc6502a1, it is no need to modifiy.
* use A1AE0C.BIN for 65C02 / $e000.
  * loaded on $e000-$efff (4KB)
  * entry point is $e000

## Reference
* [SB-Project Home](https://www.sbprojects.net/index.php)
  * [SB-Assembler](https://www.sbprojects.net/sbasm/)
    * [The A1-Assembler](https://www.sbprojects.net/sbasm/a1asm.php)
      * [Download](https://www.sbprojects.net/projects/apple1/download.php)

## Example
```
%AUTO
....
%LIST
1000 PRBYTE .EQ      $FFDC
1010 ECHO   .EQ      $FFEF
1020 CR     .EQ      $8D
1030 START
1040    JSR HELLO
1050    RTS
1060 HELLO
1070    LDX #0
1080 .1
1090    LDA .3,X
1100    BPL .2
1110    JSR ECHO
1120    INX
1130    BNE .1
1140 .2
1150    ORA #%1000.0000
1160    JMP ECHO
1170 .3
1180    .AT -/HELLO WORLD/
%SBASM
$0280.$02A0
0 ERRORS
%XEC START
HELLO WORLD
%
```