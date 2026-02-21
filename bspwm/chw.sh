#!/bin/bash
FONDOS=(1 1 1 1)
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
#swww img /home/jcast/wallpapers/f$INDEX.gif
swww img /home/jcast/wallpapers/gif/f$INDEX.gif --transition-type grow --transition-duration 0.8 --transition-fps 144 --transition-step 20
wal -n -i /home/jcast/wallpapers/gif/f$INDEX.gif

