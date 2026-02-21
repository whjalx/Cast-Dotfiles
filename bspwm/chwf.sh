#!/bin/bash
FONDOS=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14)
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
feh --bg-fill /home/jcast/wallpapers/img/f$INDEX.jpg
wal -n -i  /home/jcast/wallpapers/img/f$INDEX.jpg
killall -q polybar; polybar main & 

