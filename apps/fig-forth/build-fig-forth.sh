#!/bin/bash
set -e

CC65_HOME=/usr/local/share/cc65

cd fig-forth
patch -p1 < ../fig6502-sbc6502a1.patch
cd ..

ca65 -g -l fig6502.lst -o fig6502.o fig-forth/fig6502.asm
ld65 -C ${CC65_HOME}/cfg/none.cfg -vm -m fig6502.map -o fig6502.bin fig6502.o

objcopy -I binary -O srec --change-address 0x0380 fig6502.bin ./fig6502.srec
