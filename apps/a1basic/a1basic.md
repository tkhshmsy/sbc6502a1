# a1basic

forked from [https://github.com/jefftranter/6502/tree/master/asm/a1basic](https://github.com/jefftranter/6502/tree/master/asm/a1basic)

a1basic is known as 'Apple 1 BASIC', one of the integer BASIC interpreter.  
The original is written by Woz with hand assembly, today, disassembled source codes are there.  
an One of them, [Jeff Tranter's modified code](https://github.com/jefftranter/6502/tree/master/asm/a1basic) based [Eric Smith's disassembled](http://www.brouhaha.com/~eric/retrocomputing/apple/apple1/basic/) is re-written for cc65/ca65.

For sbc6502a1, it is no need to modifiy, same as the original.
* loaded on $e000 - $efff (4KB)
* entry point is $e000
* user memory limit is $0800 - $1000 (4KB)
  * to expand these, modify 1998L and 2000L of 'a1basic.s'

run build-a1basic.sh to make binary.

# Reference
* Jeff Tranter's
  * [https://github.com/jefftranter/6502/tree/master/asm/a1basic](https://github.com/jefftranter/6502/tree/master/asm/a1basic)
* Eric Smith's
  * [http://www.brouhaha.com/~eric/retrocomputing/apple/apple1/basic/](http://www.brouhaha.com/~eric/retrocomputing/apple/apple1/basic/)
  * [https://github.com/brouhaha/a1basic](https://github.com/brouhaha/a1basic)

# Example
```basic
E000R

E000: 4C
>10 FOR I = 0 TO 10
>20 PRINT "HELLO WORLD"
>30 NEXT I
>90 END
>RUN
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

>
```