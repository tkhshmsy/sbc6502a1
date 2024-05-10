#!/bin/bash
set -e

MSBASIC_BIN=./msbasic/msbasic/msbasic/tmp/osi.bin
KRUSADER_BIN=./krusader/krusader/ROM/65C02.rom.bin
JMON_BIN=./jmon/jmon.bin
A1ASM_BIN=./a1asm/a1asm/A1AE0C.BIN
VTL02_BIN=./vtl02/vtl02ca2.bin
WOZMON_BIN=./wozmon/wozmon.bin

BINS=( \
    "${MSBASIC_BIN}" \
    "${KRUSADER_BIN}" \
    "${JMON_BIN}" \
    "${A1ASM_BIN}" \
    "${VTL02_BIN}" \
    "${WOZMON_BIN}" \
)

for BIN in "${BINS[@]}"
do
    if [ ! -e "${BIN}" ]; then
        echo "Error: ${BIN} not found."
        exit 1
    fi
done

# Bank 0 - for BASIC
objcopy -I binary -O ihex --change-address 0x2000 ${MSBASIC_BIN} ./msbasic.hex
## the binary of 'Krusader' contains a1basic and wozmon too.
objcopy -I binary -O ihex --change-address 0x6000 ${KRUSADER_BIN} ./krusader.hex

# Bank 1 - for Assembler
objcopy -I binary -O ihex --change-address 0xa000 ${JMON_BIN} ./jmon.hex
objcopy -I binary -O ihex --change-address 0xe000 ${A1ASM_BIN} ./a1asm.hex
objcopy -I binary -O ihex --change-address 0xf000 ${VTL02_BIN} ./vtl02ca2.hex
objcopy -I binary -O ihex --change-address 0xff00 ${WOZMON_BIN} ./wozmon.hex

srec_cat \
./msbasic.hex -Intel \
./krusader.hex -Intel \
./jmon.hex -Intel \
./a1asm.hex -Intel \
./vtl02ca2.hex -Intel \
./wozmon.hex -Intel \
-o ./ROM.hex -Intel -address-length=2
