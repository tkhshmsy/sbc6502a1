# fig-FORTH

forked from [https://github.com/jefftranter/6502/tree/master/asm/fig-forth](https://github.com/jefftranter/6502/tree/master/asm/fig-forth)

fig-FORTH is a FORTH language interpreter.  
This is a implementation for 6502 which is known as fig6502.

For sbc6502a1, patched followings.
* loaded on $0380
* entry point is $0380
* use KBD and DSP via PIA(6521)

## Reference
* Jeff Tranter's
  * [https://github.com/jefftranter/6502/tree/master/asm/fig-forth](https://github.com/jefftranter/6502/tree/master/asm/fig-forth)
* FORTH
  * [wikipedia](https://en.wikipedia.org/wiki/Forth_(programming_language))
  * [https://www.forth.org/](https://www.forth.org/)
    * [fig-FORTH](https://www.forth.org/fig-forth/contents.html)
      * [6502 source code(PDF)](http://www.forth.org/fig-forth/fig-forth_6502.pdf)
* [https://dwheeler.com/6502/](https://dwheeler.com/6502/)

## Example
make S-rec file and load it with jmon

```
A000R

A000: D8

JMON MONITOR 1.3.9 BY JEFF TRANTER                                                                                   
? 
LOADING

LOADED
? INVALID COMMAND. TYPE '?' FOR HELP
? G 0380

fig-FORTH  1.0

: LOOPTEST 10 0 DO I . LOOP ; OK

LOOPTEST 0 1 2 3 4 5 6 7 8 9 OK

```