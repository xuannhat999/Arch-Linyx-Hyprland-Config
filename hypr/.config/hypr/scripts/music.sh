#!/bin/bash

# Class cụ thể của YouTube Music PWA
CLASS="brave-cinhimbnkkaeohfgghhklpknlkffjgod-Default"
SPECIAL_WS="special:music"
SPECIAL_NAME="music"
# Lấy tên workspace hiện tại
CURRENT_WS=$(hyprctl activewindow -j | jq -r '.workspace.name // empty')
# Kiểm tra xem client YouTube Music có đang chạy không
CLIENT_EXISTS=$(hyprctl clients | grep -q "class: $CLASS" && echo "true" || echo "false")

if [ "$CLIENT_EXISTS" = "true" ]; then
  # Nếu đang ở đúng workspace music -> chuyển về workspace thường (toggle out)
  if [ "$CURRENT_WS" = "$SPECIAL_WS" ]; then
    hyprctl dispatch togglespecialworkspace "$SPECIAL_NAME"
  else
    # Nếu đang ở workspace khác -> nhảy vào workspace music
    hyprctl dispatch togglespecialworkspace "$SPECIAL_NAME"
  fi
else
  # Nếu client chưa tồn tại:
  if [ "$CURRENT_WS" = "$SPECIAL_WS" ]; then
    # Đang ở workspace music nhưng app chưa mở -> Chỉ mở app, không toggle đi đâu cả
    brave --app-id=cinhimbnkkaeohfgghhklpknlkffjgod &
  else
    # Đang ở workspace thường và app chưa mở -> Toggle vào rồi mở app
    hyprctl dispatch togglespecialworkspace "$SPECIAL_NAME"
    brave --app-id=cinhimbnkkaeohfgghhklpknlkffjgod &
  fi
fi
