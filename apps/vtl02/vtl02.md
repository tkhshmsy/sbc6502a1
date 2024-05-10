# vtl02

VTL is 'Very Tiny Language' which is a very simple language interpreter for MC6800 by Frank McCoy. Its size is only 768 bytes !

VTL02 is the implementation for 6502 by Michael T. Barry, on year 2012.

VTL02CA2 is for Apple2 of VTL02 version C, by Klaus Dormann. Also VTL02SG is the extended of it.

For sbc6502a1, modified from VTL02CA2.
* loaded on $f000 (1KB+)
* entry point is $f000
* using KBD and DSP via PIA(6521) instead of ACIA(UART, 6551).

run build-vtl02c.sh to make binary.

# Reference
* VTL02
  * [https://github.com/barrym95838/6502-Assembly](https://github.com/barrym95838/6502-Assembly)
* VTL02CA2
  * [https://github.com/Klaus2m5/VTL02](https://github.com/Klaus2m5/VTL02)

```
F000R

F000: A9
OK
1000 A=1
1010 ?=A
1020 ?=""
1030 A=A+1
1040 #=A<10*1010
#=1
1
2
3
4
5
6
7
8
9

OK
```