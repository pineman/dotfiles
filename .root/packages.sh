#!/bin/bash
set -euxo pipefail

packages=(
  # System
  arch-install-scripts
  pacman-contrib
  pkgfile
  fakepkg
  kernel-modules-hook
  man-db
  man-pages
  nano
  systemd-resolvconf
  wireless-regdb
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
  backblaze-b2-bin
  rclone
  direnv
  fasd
  physlock
  parallel
  openbsd-netcat
  strace
  #bcc
  #bcc-tools
  #python-bcc
  acpi
  nmap
  traceroute
  ddcci-driver-linux-dkms
  bluez
  bluez-utils
  trash-cli
  imagemagick
  plocate
  moreutils
  tree
  ifuse
  usbutils
  sysstat
  # Graphical
  sway
  xorg-xwayland
  mako
  noto-fonts
  noto-fonts-cjk
  noto-fonts-extra
  ttf-apple-emoji
  ttf-dejavu
  pipewire-pulse
  pipewire-jack
  pipewire-alsa
  wireplumber
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
  gvfs-mtp
  gvfs-gphoto2
  ntfs-3g
  exfatprogs
  gparted
  tumbler
  ffmpegthumbnailer
  thunar-volman
  thunar-archive-plugin
  file-roller
  gnome-keyring
  blueman
  gammastep
  #python-xdg
  swayidle
  #sway-mpris-idle-inhibit
  #sway-video-idle-inhibit
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
  mpv
  mpv-mpris
  vlc
  yt-dlp
  ristretto
  playerctl
  wf-recorder
  wtype
  zathura
  zathura-pdf-poppler
  waybar
  otf-font-awesome
  wdisplays
  gnome-font-viewer
  gucharmap
  dconf-editor
  mousepad
  pinta
  gimp
  inkscape
  rmlint
  rmlint-shredder
  transmission-gtk
  dragon-drop
  # Dev
  jq
  gron
  wireshark-qt
  visual-studio-code-bin
  #docker
  #docker-compose
  pigz
  shellcheck-bin
  flyctl-bin
  rlwrap
  python-pip
  #rbenv
  #ruby-build
)
yay -S --noconfirm --needed "${packages[@]}"
echo 'pineman' | sudo chsh -s /bin/zsh pineman
sudo systemctl enable linux-modules-cleanup fstrim.timer bluetooth plocate-updatedb.timer
systemctl --user enable playerctld
#sudo gpasswd -a pineman docker
sudo gpasswd -a pineman wireshark
sudo gpasswd -a pineman seat
gsettings set 'org.gnome.desktop.interface' font-name 'sans 10'
mkdir ~/.local/log
pip install dtrx
code --install-extension marcoms.oceanic-plus
code --install-extension asvetliakov.vscode-neovim

