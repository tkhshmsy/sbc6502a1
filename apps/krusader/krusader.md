# Krusader

Krusader is the monitor with symbolic assembler and disassembler for 6502.

For sbc6502a1, it is no need to modifiy, same as the original.  
Using [the binary](https://github.com/st3fan/krusader/tree/master/ROM) from git, 
* loaded on $f000 - $ff00
* entry point is $f000
* it includes a1basic and krusader's mini-monitor(= modified wozmon).
  * a1basic $e000 - $efff
  * mini-monitor $ff00 - $ffff


## Reference
* Ken's Rather Useless Symbolic Assembly Development Environment for the Replica 1
  * [https://github.com/st3fan/krusader](https://github.com/st3fan/krusader)
* Original ? (invalid link)
  * [http://school.anhb.uwa.edu.au/personalpages/kwessen/apple1/Krusader.htm](http://school.anhb.uwa.edu.au/personalpages/kwessen/apple1/Krusader.htm)

## Example
```
F000R

F000: A9
KRUSADER 65C02 BY KEN WESSEN 1.3
? N
000        LDA #'A'
001 LOOP   JSR $FFEF
002        CLC
003        ADC #$1
004        CMP #'Z'+1
005        BNE LOOP
006        RTS
007 
? A
0300-030C
? R $0300
ABCDEFGHIJKLMNOPQRSTUVWXYZ
? 

```