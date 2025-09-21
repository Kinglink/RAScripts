#!/bin/bash
# Rebuilds CDDATA.000 from cddata_unpacked/ into exported/CDDATA.000
# Usage: ./rebuild_cddata.sh

BMS_SCRIPT="./quickbms/tokyo_xtreme_racer_zero.bms"
INPUT_DIR="./modified"
OUTPUT_DIR="./finished"
OUTPUT_FILE="$OUTPUT_DIR/"

if [ ! -f "$BMS_SCRIPT" ]; then
  echo "❌ Cannot find $BMS_SCRIPT"
  exit 1
fi

if [ ! -d "$INPUT_DIR" ]; then
  echo "❌ Cannot find $INPUT_DIR"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

"./quickbms/quickbms.exe" -w -r "$BMS_SCRIPT" "$INPUT_DIR" "$OUTPUT_FILE"

echo "✅ Rebuilt CDDATA.000 to $OUTPUT_FILE"
echo "⚠ Reminder: Open Apache and replace the old CDDATA.000 in your ISO with this new one."
