#!/bin/bash
FONDOS=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
INDEX_FILE="/tmp/fondo_index"

# Leer índice
if [ -f "$INDEX_FILE" ]; then
    INDEX=$(cat "$INDEX_FILE")
else
    INDEX=0
fi

# Siguiente índice
INDEX=$(( (INDEX + 1) % ${#FONDOS[@]} ))
echo $INDEX > "$INDEX_FILE"

# Cambiar fondo con transición circular
swww img /home/jcast/wallpapers/f$INDEX.jpg --transition-type grow --transition-duration 0.8 --transition-fps 144 --transition-step 20
wal -n -i  /home/jcast/wallpapers/f$INDEX.jpg


