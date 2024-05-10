#!/bin/bash
set -e

CC65_HOME=/usr/local/share/cc65

ca65 -g -l TinyBasic.lst --feature labels_without_colons -o TinyBasic.o tinybasic/TinyBasic.asm
ld65 -C ${CC65_HOME}/cfg/none.cfg -vm -m TinyBasic.map -o TinyBasic.bin TinyBasic.o

objcopy -I binary -O srec --change-address 0x7600 TinyBasic.bin ./tinybasic.srec
