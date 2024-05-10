#!/bin/bash
set -e

CC65_HOME=/usr/local/share/cc65

cd msbasic
patch -p1 < ../msbasic-sbc6502a1.patch
make
cd ..
