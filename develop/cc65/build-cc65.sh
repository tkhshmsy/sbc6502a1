#!/bin/bash
set -e

git submodule update -i
cd cc65
patch -p1 < ../cc65-sbc6502a1.patch
make -s -j4

echo "Done."
echo "to install, \"cd cc65 && sudo make PREFIX=/usr/local install\" ..."
