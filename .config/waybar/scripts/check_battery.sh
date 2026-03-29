#!/bin/bash

# Lấy dung lượng và trạng thái từ hệ thống
CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

# File tạm để tránh gửi thông báo liên tục khi cùng 1 mức pin
TEMP_FILE="/tmp/battery_notified"

if [ "$STATUS" = "Discharging" ]; then
  if [ "$CAPACITY" -le 10 ]; then
    if [ "$(cat $TEMP_FILE 2>/dev/null)" != "critical" ]; then
      notify-send -c critical "IM DYINGGG !" "$CAPACITY%" -i "/usr/share/icons/Papirus/48x48/status/battery-000.svg"
      echo "critical" >$TEMP_FILE
    fi
  elif [ "$CAPACITY" -le 25 ]; then
    if [ "$(cat $TEMP_FILE 2>/dev/null)" != "warning" ]; then
      notify-send -c alert "Charge me !" "$CAPACITY%" -i "/usr/share/icons/Papirus/48x48/status/battery-020.svg"
      echo "warning" >$TEMP_FILE
    fi
  fi
elif [ "$STATUS" = "Charging" ]; then
  # Reset file tạm khi đang sạc
  echo "charging" >$TEMP_FILE
fi
