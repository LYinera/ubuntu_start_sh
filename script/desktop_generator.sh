#!/bin/bash
OUT_PUT_PATH="$1"
BIN_PATH="$2"
PNG_PATH="$3"
APP_NAME="$4"
source ./progress.sh

echo "[Desktop Entry]" > $OUT_PUT_PATH
echo "Name=$APP_NAME" >> $OUT_PUT_PATH
echo "Exec=$BIN_PATH" >> $OUT_PUT_PATH
echo "Icon=$PNG_PATH" >> $OUT_PUT_PATH
echo "Terminal=false" >> $OUT_PUT_PATH
echo "Type=Application" >> $OUT_PUT_PATH
echo "StartupNotify=true" >> $OUT_PUT_PATH


