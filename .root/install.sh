#!/bin/bash
set -euxo pipefail

# Arch Linux install script for srsbsns
# git clone https://github.com/pineman/dotfiles and run like `./install stage1`

stage1() {
  # Assume $DISK is a partition of type Linux
  DISK=
  BOOT=
  cryptsetup luksFormat "$DISK"
  cryptsetup open "$DISK" root
  mkfs.ext4 /dev/mapper/root
  mount /dev/mapper/root /mnt
  mkdir -p /mnt/boot
  mount $BOOT /mnt/boot
  echo 'Server = https://ftp.rnl.tecnico.ulisboa.pt/pub/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
  pacstrap /mnt base base-devel vim sudo git fd ccache networkmanager openssh linux-lts intel-ucode linux-firmware --noconfirm
  cp $(basename "$0") /mnt/install.sh
  chmod +x /mnt/install.sh
  arch-chroot /mnt /install.sh stage2
}

stage2() {
  passwd
  echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel
  useradd -U -G wheel -m -u 1000 pineman
  passwd pineman
  sudo -u pineman -i /install.sh stage3
}

stage3() {
  rm -f .bash*
  git init
  git remote add origin https://github.com/pineman/dotfiles.git
  git fetch --all
  git pull origin main
  git branch -D master
  git submodule update --init
  cd .root
  sudo bootctl install
  ./system-files.sh
  sudo sed -i 's/#pt_PT.UTF-8 UTF-8/pt_PT.UTF-8 UTF-8/g' /etc/locale.gen
  sudo sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
  sudo sed -i 's%#Server = http://ftp.rnl.tecnico%Server = http://ftp.rnl.tecnico%g' /etc/pacman.d/mirrorlist
  sudo locale-gen
  sudo timedatectl set-ntp true
  sudo timedatectl set-timezone Europe/Lisbon
  sudo umount /etc/resolv.conf
  sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
  sudo systemctl enable iptables systemd-resolved NetworkManager sshd
  sudo systemctl disable nftables
  sudo mkdir /var/tmp/{ccache,aur}
  sudo chown -R pineman: /var/tmp/{ccache,aur}
  echo srsbsns | sudo tee /etc/hostname
  cd /tmp
  git clone https://aur.archlinux.org/yay-bin --depth 1
  cd yay-bin
  makepkg -si --noconfirm
  cd ~/.root
  ./packages.sh
  sudo mkinitcpio -P
  dd if=/dev/zero of=/swapfile bs=1M count=16384 status=progress
  chmod 0600 /swapfile
  mkswap -U clear /swapfile
  swapon /swapfile
  genfstab -U / | sudo tee -a /etc/fstab
  echo 'get hibernation swapfile offset and place into boot loader entries command line args. run ./system-files.sh to update'; read
  git remote remove origin
  #vim .ssh/id_25519
  #chmod 0400 .ssh/id_25519
  #git remote add origin git@github.com:pineman/dotfiles.git
}

"$@"
