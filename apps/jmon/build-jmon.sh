#!/bin/bash
set -e

CC65_HOME=/usr/local/share/cc65

PLATFORM=APPLE1

cd jmon
patch -p1 < ../jmon-sbc6502a1.patch
cd ..

ca65 -D ${PLATFORM} -g -l jmon.lst -o jmon.o jmon/jmon.s
ld65 -C ${CC65_HOME}/cfg/none.cfg -vm -m jmon.map -o jmon.bin jmon.o
