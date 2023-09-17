#!/bin/bash
set -euxo pipefail

# Arch Linux install script from live USB
# git clone https://github.com/pineman/dotfiles and run like `./install stage1`

BOOT=/dev/nvme0n1p1
ROOT=/dev/nvme0n1p5
stage1() {
  umount -R /mnt || true
  mkfs.ext4 $ROOT
  mount $ROOT /mnt
  mkdir -p /mnt/boot
  mount $BOOT /mnt/boot
  echo 'Server = https://ftp.rnl.tecnico.ulisboa.pt/pub/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
  pacstrap /mnt base base-devel vim sudo git fd networkmanager openssh terminus-font amd-ucode linux-lts linux-zen linux-firmware --noconfirm
  genfstab -U /mnt | sudo tee -a /mnt/etc/fstab
  cp $(basename "$0") /mnt/install.sh
  chmod +x /mnt/install.sh
  arch-chroot /mnt /install.sh stage2
  umount -R /mnt
}

stage2() {
  dd if=/dev/zero of=/swapfile bs=1G count=16 status=progress
  chmod 0600 /swapfile
  mkswap -U clear /swapfile
  swapon /swapfile
  echo '/swapfile none swap defaults 0 0' >> /etc/fstab
  bootctl install
  systemctl enable iptables systemd-resolved NetworkManager sshd
  sed -i 's/#pt_PT.UTF-8 UTF-8/pt_PT.UTF-8 UTF-8/g' /etc/locale.gen
  sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
  locale-gen
  sed -i 's%#Server = http://ftp.rnl.tecnico%Server = http://ftp.rnl.tecnico%g' /etc/pacman.d/mirrorlist
  echo cronos > /etc/hostname
  passwd
  echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel
  useradd -U -G wheel -m -u 1000 pineman
  passwd pineman
  mkdir /var/tmp/aur
  chown -R pineman: /var/tmp/aur
  sudo -u pineman -i /install.sh stage3
}

stage3() {
  rm -f .bash*
  git init
  git remote add origin https://github.com/pineman/dotfiles.git
  git fetch --all
  git checkout main
  git submodule update --init
  cd /tmp
  git clone https://aur.archlinux.org/yay-bin --depth 1
  cd yay-bin
  makepkg -si --noconfirm
  system-files
}

stage4() {
  # Run on newly booted system
  sudo rm -f /etc/resolv.conf
  sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
  sudo timedatectl set-ntp true
  sudo timedatectl set-timezone Europe/Lisbon
  packages
  git remote remove origin
  git remote add origin git@github.com:pineman/dotfiles.git
  echo 'copy keepass, setup ssh key'
}

system-files() {
  fd -I -H -t f . etc -x sh -c '
    echo overwriting /{}
    sudo mkdir -p /{//}
    sudo cp -f {} /{}'
  sudo rm -rf /boot/loader/loader.conf /boot/loader/entries/*
  sudo cp -rf boot/loader/loader.conf boot/loader/entries /boot/loader
  offset=$(sudo filefrag -v /swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')
  sudo sed -i "s%#ROOT#%$ROOT%g" /boot/loader/entries/*
  sudo sed -i "s%#OFFSET#%$offset%g" /boot/loader/entries/*
  sudo cp us-esc-caps.map.gz /usr/share/kbd/keymaps/i386/qwerty/
  dircolors ~/.dircolors > ~/.ls_colors
}

packages() {
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
    ripgrep
    sd
    dfc
    ncdu
    git-delta
    backblaze-b2-bin
    rclone
    fasd
    parallel
    openbsd-netcat
    strace
    nmap
    traceroute
    trash-cli
    imagemagick
    plocate
    moreutils
    tree
    sysstat
    speedtest-cli
    scc
    tmux
    inotify-tools
    # Graphical
    tk
    radeontop
    sway
    xorg-xwayland
    xorg-xhost
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
    pinta
    gimp
    inkscape
    rmlint
    rmlint-shredder
    transmission-gtk
    dragon-drop
    libva-mesa-driver
    libva-utils
    extramaus
    physlock
    ddcci-driver-linux-dkms
    ddcutil
    bluez
    bluez-utils
    ifuse
    usbutils
    baobab
    # Dev
    entr
    jq
    gron
    wireshark-qt
    visual-studio-code-bin
    docker
    docker-compose
    pigz
    shellcheck-bin
    flyctl-bin
    rlwrap
    python-pip
    pandoc-bin
    asdf-vm
    # for erlang
    webkit2gtk
    wxwidgets-gtk3
  )
  yay -S --noconfirm --needed "${packages[@]}"
  echo 'pineman' | sudo chsh -s /bin/zsh pineman
  sudo systemctl enable linux-modules-cleanup fstrim.timer bluetooth plocate-updatedb.timer keyd
  sudo gpasswd -a pineman docker
  sudo gpasswd -a pineman wireshark
  sudo gpasswd -a pineman seat
  gsettings set 'org.gnome.desktop.interface' font-name 'sans 10'
  mkdir -p ~/.local/log
  pip install dtrx
  yay -U htop-vim-3.2.1-1-x86_64.pkg.tar.zst
  # VSCode and JetBrains settings synced using their respective sync plugins
}

"${@:-system-files}"
