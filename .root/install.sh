#!/bin/bash
set -euxo pipefail

# Arch Linux install script for srsbsns
# git clone https://github.com/pineman/dotfiles and run like `./install stage1`

stage1() {
  # Assume $DISK is a partition of type Linux
  DISK=/dev/nvme0n1p5
  BOOT=/dev/nvme0n1p1
  umount -R /mnt || true
  mkfs.ext4 $DISK
  mount $DISK /mnt
  mkdir -p /mnt/boot
  mount $BOOT /mnt/boot
  echo 'Server = https://ftp.rnl.tecnico.ulisboa.pt/pub/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
  pacstrap /mnt base base-devel vim sudo git fd ccache networkmanager openssh terminus-font amd-ucode linux-lts linux-zen linux-firmware --noconfirm
  genfstab -U /mnt | sudo tee -a /mnt/etc/fstab
  cp $(basename "$0") /mnt/install.sh
  chmod +x /mnt/install.sh
  arch-chroot /mnt /install.sh stage2
  umount -R /mnt
}

stage2() {
  bootctl install
  systemctl enable iptables systemd-resolved NetworkManager sshd
  sed -i 's/#pt_PT.UTF-8 UTF-8/pt_PT.UTF-8 UTF-8/g' /etc/locale.gen
  sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
  sed -i 's%#Server = http://ftp.rnl.tecnico%Server = http://ftp.rnl.tecnico%g' /etc/pacman.d/mirrorlist
  locale-gen
  echo cronos > /etc/hostname
  passwd
  echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel
  useradd -U -G wheel -m -u 1000 pineman
  passwd pineman
  mkdir /var/tmp/{ccache,aur}
  chown -R pineman: /var/tmp/{ccache,aur}
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
  cd ~/.root
  ./system-files.sh
}

stage4() {
  sudo rm -f /etc/resolv.conf
  sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
  sudo timedatectl set-ntp true
  sudo timedatectl set-timezone Europe/Lisbon
  ./packages.sh
  echo 'setup hibernation'
  echo 'copy keepass'
  echo 'setup ssh key'
  git remote remove origin
  git remote add origin git@github.com:pineman/dotfiles.git
}

"$@"
