# OSI BASIC (MS BASIC)

forked from [https://github.com/jefftranter/6502/tree/master/asm/OSI](https://github.com/jefftranter/6502/tree/master/asm/OSI)

For sbc6502a1, patched followings.
* 'OSI BASIC ver 1.0 rev 3.2' is selected.
  * for ROM and within 8KB.
* floating point calculation with 6 digits
* loaded on $a000 (8KB)
* entry point is $bd0d

run build-msbasic.sh to make binary.

## Reference
* Jeff Tranter's
  * [https://github.com/jefftranter/6502/tree/master/asm/OSI](https://github.com/jefftranter/6502/tree/master/asm/OSI)
* Original
  * [https://github.com/mist64/msbasic](https://github.com/mist64/msbasic)
  * [Create your own Version of Microsoft BASIC for 6502](https://www.pagetable.com/?p=46)

## Example
```
BD0DR

BD0D: BE
MEMORY SIZE? 32768
TERMINAL WIDTH? 40

 31999 BYTES FREE



OSI 6502 BASIC VERSION 1.0 REV 3.2

COPYRIGHT 1977 BY MICROSOFT CO.



OK

10 FOR I=0 TO 10
20 PRINT "HELLO WORLD"
30 NEXT I
90 END
RUN
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD
HELLO WORLD


OK
```