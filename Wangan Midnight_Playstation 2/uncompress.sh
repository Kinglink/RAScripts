#!/bin/bash
# 1. Unzip Wangan Midnight ISO into ./extracted_iso
# 2. Extract CDDATA.000 from the ISO into ./cddata_unpacked

ISO_FILE="iso/Wangan Midnight (Japan).iso"
ISO_OUT="./extracted_iso"
BMS_SCRIPT="./quickbms/tokyo_xtreme_racer_zero.bms"
CDDATA_FILE="$ISO_OUT/CDDATA.000"
CDDATA_OUT="./cddata_unpacked"
SEVENZ="/c/Program Files/7-Zip/7z.exe"
QUICKBMS="./quickbms/quickbms.exe"

echo "=== Step 1: Extracting ISO to $ISO_OUT ==="
rm -rf "$ISO_OUT"
mkdir -p "$ISO_OUT"
"$SEVENZ" x "$ISO_FILE" -o"$ISO_OUT"

if [ ! -f "$CDDATA_FILE" ]; then
    echo "❌ CDDATA.000 not found in $ISO_OUT"
    exit 1
fi

echo "=== Step 2: Extracting CDDATA.000 to $CDDATA_OUT ==="
rm -rf "$CDDATA_OUT"
mkdir -p "$CDDATA_OUT"
"$QUICKBMS" "$BMS_SCRIPT" "$CDDATA_FILE" "$CDDATA_OUT"

echo "✅ Done! Files are in $CDDATA_OUT"
