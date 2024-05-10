# TinyBasic

forked from [https://github.com/jefftranter/6502/tree/master/asm/tinybasic](https://github.com/jefftranter/6502/tree/master/asm/tinybasic)

For sbc6502a1, no need to modify.
* loaded on $7600
* entry point is $7600

## Reference
* Jeff Tranter's
  * [https://github.com/jefftranter/6502/tree/master/asm/tinybasic](https://github.com/jefftranter/6502/tree/master/asm/tinybasic)
* TinyBASIC
  * [wikipedia](https://en.wikipedia.org/wiki/Tiny_BASIC)
  * [Itty Bitty Computers & TinyBasic](http://www.ittybittycomputers.com/IttyBitty/TinyBasic/index.htm)
    * [source code](http://www.ittybittycomputers.com/IttyBitty/TinyBasic/TinyBasic.asm)

## Example
make S-rec file and load it with jmon

```
JMON MONITOR 1.3.9 BY JEFF TRANTER
? 
LOADING

LOADED

Open License Monitor, by Bill O'Neill V0.2.2
TINY BASIC - Copyright, Tom Pitman
Boot (C/W)? 
Boot (C/W)? C
>10 PRINT "HELLO WORLD"
>90 END
>RUN

HELLO WORLD

>

```