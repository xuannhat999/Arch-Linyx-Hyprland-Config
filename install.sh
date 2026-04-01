#!/bin/bash

# Dừng script nếu có lỗi xảy ra
set -e

echo "--- Bắt đầu cài đặt Dotfiles ---"

# 1. Cập nhật hệ thống
sudo pacman -Syu --noconfirm

# 2. Cài đặt các package cơ bản từ kho chính (Pacman)
PACKAGES=(
  "neovim"
  "stow"
  "git"
  "kitty"
  "waybar"
  "hyprland"
  "wiremix"
  "bluetui"
  "papirus-icon-theme"
  "rofi"
  "rofi-calc"
  "yazi"
  "mako"
  "libreoffice-fresh"
  "starship"
)

echo "Đang cài đặt các package từ Pacman..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# 3. Cài đặt AUR Helper (nếu chưa có)
if ! command -v yay &>/dev/null; then
  echo "Đang cài đặt yay..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay && makepkg -si --noconfirm
  cd -
fi

# 4. Cài đặt các package từ AUR
AUR_PACKAGES=(
  "catppuccin-gtk-theme-mocha"
  "wifitui"
  "brave-bin"
  "android_studio"
)

echo "Đang cài đặt các package từ AUR..."
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"
echo "--- Cài đặt hoàn tất! ---"
