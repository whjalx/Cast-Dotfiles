#!/bin/bash
ram=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2+$4 "%"}')
disk=$(df -h / | awk 'NR==2 {print $4 " libres"}')
notif="0 notificaciones"

eww update ram="$ram" cpu="$cpu" disk="$disk" notif="$notif"

