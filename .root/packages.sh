#!/bin/bash
set -euxo pipefail
packages=(
  # System
  arch-install-scripts
  pacman-contrib
  pkgfile
  kernel-modules-hook
  man-db
  man-pages
  nano
  systemd-resolvconf
  # Utilities
  zsh
  zsh-completions
  bash-completion
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
  strace
  acpi
  nmap
  traceroute
  ddcci-driver-linux-dkms
  ddcutil
  bluez
  bluez-utils
  # Graphical
  sway-hidpi-git
  xorg-xwayland-hidpi-git
  mako
  i3status
  ttf-font-icons
  ttf-droid
  pipewire-pulse
  pipewire-jack
  pipewire-media-session
  xdg-desktop-portal-wlr
  pamixer
  pavucontrol
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
  qt5-wayland
  brightnessctl
  alsa-utils
  qalculate-gtk
  wlr-randr
  bemenu-wayland
  grimshot
  tk
  telegram-desktop
  network-manager-applet
  wev
  libva-intel-driver
  libva-utils
  mpv
  yt-dlp
  play-with-mpv-git
  eog
  playerctl
  wf-recorder
  wtype
  # Dev
  jq
  wireshark-qt
  visual-studio-code-bin
  docker
  docker-compose
  pigz
  docker-rootless-extras-bin
  rootlesskit-bin
  podman
  catatonit
  podman-compose-git
  podman-dnsname
  #podman-docker
  shellcheck-bin
)
yay -S --noconfirm --needed "${packages[@]}"
yay -S --noconfirm --needed --asdeps gvfs tumbler thunar-volman thunar-archive-plugin file-roller ffmpegthumbnailer fuse2
echo 'pineman' | sudo chsh -s /bin/zsh pineman
sudo systemctl enable docker tlp linux-modules-cleanup fstrim.timer bluetooth
systemctl --user enable playerctld
sudo gpasswd -a pineman docker
sudo gpasswd -a pineman wireshark
mkdir ~/.local/log
pip install dtrx
#yay -S --noconfirm --needed virt-manager qemu
#yay -S --noconfirm --needed --asdeps ebtables dnsmasq

code --install-extension marcoms.oceanic-plus
code --install-extension golang.Go
code --install-extension eamodio.gitlens
code --install-extension asvetliakov.vscode-neovim

./work.sh
