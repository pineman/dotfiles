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
  bcc
  bcc-tools
  python-bcc
  acpi
  nmap
  traceroute
  ddcci-driver-linux-dkms
  bluez
  bluez-utils
  jc
  trash-cli
  imagemagick
  # Graphical
  sway
  xorg-xwayland
  mako
  ttf-apple-emoji
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
  gvfs
  tumbler
  ffmpegthumbnailer
  thunar-volman
  thunar-archive-plugin
  file-roller 
  gnome-keyring
  blueman
  gammastep
  python-xdg
  swayidle
  sway-mpris-idle-inhibit
  sway-video-idle-inhibit
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
  mpv-mpris
  yt-dlp
  eog
  playerctl
  wf-recorder
  wtype
  zathura
  zathura-pdf-poppler
  waybar
  otf-font-awesome
  wdisplays
  # Dev
  jq
  wireshark-qt
  code
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
yay -S --noconfirm --needed --asdeps 
echo 'pineman' | sudo chsh -s /bin/zsh pineman
sudo systemctl enable docker tlp linux-modules-cleanup fstrim.timer bluetooth plocate-updatedb.timer
sudo systemctl mask systemd-rfkill.{socket,service}
systemctl --user enable playerctld
sudo gpasswd -a pineman docker
sudo gpasswd -a pineman wireshark
gsettings set 'org.gnome.desktop.interface' font-name 'sans 10'
mkdir ~/.local/log
pip install dtrx
#yay -S --noconfirm --needed virt-manager qemu
#yay -S --noconfirm --needed --asdeps ebtables dnsmasq

code --install-extension marcoms.oceanic-plus
code --install-extension golang.Go
code --install-extension eamodio.gitlens
code --install-extension asvetliakov.vscode-neovim

./work.sh
