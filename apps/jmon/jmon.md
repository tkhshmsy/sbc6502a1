# jmon

forked from [https://github.com/jefftranter/6502/tree/master/asm/jmon](https://github.com/jefftranter/6502/tree/master/asm/jmon)

jmon is a monitor program by Jeff Tranter.  
This monitor is made for Replica-1 and other 6502 based computers.

For sbc6502a1, patched followings.
* loaded on $a000 (8KB)
* entry point is $a000
* no includes mini-assembler

run build-jmon.sh to make binary.

## Reference
* Jeff Tranter's
  * [https://github.com/jefftranter/6502/tree/master/asm/jmon](https://github.com/jefftranter/6502/tree/master/asm/jmon)

## Example
```
A000R

A000: D8

JMON MONITOR 1.3.9 BY JEFF TRANTER
? ?
JMON MONITOR 1.3.9 BY JEFF TRANTER
BREAKPOINT  B <N OR ?> <ADDRESS>
COPY        C <START> <END> <DEST>
DUMP        D <START>
ACI MENU    E
FILL        F <START> <END> <DATA>...
GO          G <ADDRESS>
HEX TO DEC  H <ADDRESS>
BASIC       I
LOAD S REC  J
CHECKSUM    K <START> <END>
CLR SCREEN  L
CFFA1 MENU  M
INFO        N
OPTIONS     O
LOOP        P <ADDRESS>
REGISTERS   R
SEARCH      S <START> <END> <DATA>...
TEST        T <START> <END>
UNASSEMBLE  U <START>
VERIFY      V <START> <END> <DEST>
WRITE S REC W <START> <END> <GO>
WOZ MON     $
WRITE       : <ADDRESS> <DATA>...
MATH        = <ADDRESS> +/- <ADDRESS>
TRACE       .
HELP        ?
? N
         COMPUTER: INVALID RECORD
         CPU TYPE: 65C02
RAM DETECTED FROM: $0000 TO $7FFF
       NMI VECTOR: $0F00
     RESET VECTOR: $FF00
   IRQ/BRK VECTOR: $0000
         ACI CARD: NOT PRESENT
       CFFA1 CARD: NOT PRESENT
   MULTI I/O CARD: NOT PRESENT
     KRUSADER ROM: NOT PRESENT
       WOZMON ROM: PRESENT
? 

```