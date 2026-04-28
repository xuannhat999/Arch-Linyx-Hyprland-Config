#!/bin/bash

# Class cụ thể của YouTube Music PWA từ Brave của bạn
CLASS="brave-cinhimbnkkaeohfgghhklpknlkffjgod-Default"
SPECIAL_WS="special:music"

# Kiểm tra xem cửa sổ có đang tồn tại không
if hyprctl clients | grep -q "class: $CLASS"; then
  # Nếu đã mở, chỉ cần toggle workspace
  hyprctl dispatch togglespecialworkspace music
else
  # Nếu chưa mở:
  # 1. Toggle sang special workspace trước để khi app mở lên nó nằm sẵn ở đó
  hyprctl dispatch togglespecialworkspace music
  # 2. Mở ứng dụng (sử dụng app id từ Brave của bạn)
  brave --app-id=cinhimbnkkaeohfgghhklpknlkffjgod &
fi
