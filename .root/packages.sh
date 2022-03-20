#!/bin/bash
set -euxo pipefail
packages=(
  man-db
  zsh
  neovim
  nvimpager-git
  ripgrep
  sd
  htop-vim
  sway
  xorg-xwayland
  mako
  i3status
  chromium
  alacritty
  thunar
  gnome-keyring
  blueman
  gammastep
  swayidle
  visual-studio-code-bin
  docker
  git-delta
  terminus-font
  ttf-font-icons
  arch-install-scripts
  pacman-contrib
  ttf-droid
  pipewire-jack
  pipewire-media-session
  tlp
  kernel-modules-hook
  mlocate
  ttc-iosevka
  wl-clipboard
  keepassxc
)
yay -S --noconfirm --needed "${packages[@]}"
code --install-extension marcoms.oceanic-plus
code --install-extension vscodevim.vim
code --install-extension golang.Go
code --install-extension eamodio.gitlens

