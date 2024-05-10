#!/bin/bash
set -e

CC65_HOME=/usr/local/share/cc65

ca65 -g -l wozmon.lst -o wozmon.o wozmon/wozmon.s
ld65 -C ${CC65_HOME}/cfg/none.cfg -vm -m wozmon.map -o wozmon.bin wozmon.o
