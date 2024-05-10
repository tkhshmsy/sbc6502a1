#!/bin/bash
set -e

CC65_HOME=/usr/local/share/cc65

git submodule update -i
cd VTL02
patch -p1 < ../vtl02-sbc6502a1.patch
cd ..

ca65 -g -l vtl02ca2.lst -o  vtl02ca2.o  VTL02/vtl02ca2.a65
ld65 -C ${CC65_HOME}/cfg/none.cfg -vm -m  vtl02ca2.map -o  vtl02ca2.bin  vtl02ca2.o
