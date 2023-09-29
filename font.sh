#!/usr/bin/env bash
nerd_ver="3.0.2"

GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.com/}"

# https://github.com/ryanoasis/nerd-fonts
install_nerd() {
  local font_name="$1"
  local font_pkg="${font_name}.tar.xz"
  wget "${GITHUB_PROXY}https://github.com/ryanoasis/nerd-fonts/releases/download/v$nerd_ver/$font_pkg"
  local target_dir="/storage/emulated/0/fonts/$font_name"
  if [ ! -e "$target_dir" ]; then
    mkdir -p "$target_dir"
    tar -Jxvf "$font_pkg" -C "$target_dir"
  fi
  rm -f "$font_pkg"

  fc-cache -f -v
}

set_font() {
  font_name="$1"
  echo "font.ttf=/storage/emulated/0/fonts/$font_name.ttf" > ~/.termux/font.ttf
}
# install_nerd JetBrainsMono
install_nerd SourceCodePro
set_font "SauceCodeProNerdFontMono-Regular"

fc-cache -fv
