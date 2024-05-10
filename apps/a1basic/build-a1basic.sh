#!/bin/bash
set -e

CC65_HOME=/usr/local/share/cc65

ca65 -g -l a1basic.lst -o  a1basic.o  a1basic/a1basic.s
ld65 -C ${CC65_HOME}/cfg/none.cfg -vm -m  a1basic.map -o  a1basic.bin  a1basic.o
