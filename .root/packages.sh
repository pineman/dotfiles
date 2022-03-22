#!/bin/bash
set -euxo pipefail
packages=(
  # System
  arch-install-scripts
  pacman-contrib
  kernel-modules-hook
  man-db
  # Utilities
  zsh
  neovim
  nvimpager-git
  ripgrep
  sd
  htop-vim
  dfc
  ncdu
  git-delta
  terminus-font
  tlp
  tlp-rdw
  mlocate
  backblaze-b2-bin
  rclone
  direnv
  fasd
  physlock
  parallel
  openbsd-netcat
  # Graphical
  sway
  xorg-xwayland
  mako
  i3status
  ttf-font-icons
  ttf-droid
  pipewire-pulse
  pipewire-jack
  pipewire-media-session
  polkit-gnome
  chromium
  firefox
  alacritty
  foot
  thunar
  gnome-keyring
  blueman
  gammastep
  swayidle
  ttc-iosevka
  wl-clipboard
  keepassxc
  brightnessctl
  alsa-utils
  qalculate-gtk
  wlr-randr
  bemenu-wayland
  grimshot
  tk
  telegram-desktop
  ydotool
  network-manager-applet
  pavucontrol
  wev
  libva-intel-driver
  libva-utils
  mpv
  yt-dlp
  play-with-mpv-git
  # Dev
  jq
  wireshark-qt
  visual-studio-code-bin
  docker
)
yay -S --noconfirm --needed "${packages[@]}"
echo 'pineman' | sudo chsh -s /bin/zsh pineman
sudo systemctl enable docker tlp linux-modules-cleanup fstrim.timer bluetooth ydotool
sudo gpasswd -a pineman docker
mkdir ~/.local/log
yay -S --noconfirm --needed --asdeps gvfs tumbler thunar-volman thunar-archive-plugin file-roller ffmpegthumbnailer
#yay -S --noconfirm --needed virt-manager qemu
#yay -S --noconfirm --needed --asdeps ebtables dnsmasq
pip install dtrx

code --install-extension marcoms.oceanic-plus
code --install-extension golang.Go
code --install-extension eamodio.gitlens
code --install-extension asvetliakov.vscode-neovim

yay -S --noconfirm --needed google-cloud-sdk terraform kubectl helm openconnect networkmanager-openconnect openvpn networkmanager-openvpn
#kubectl krew install exec-as
