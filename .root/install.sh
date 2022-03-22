#!/bin/bash
set -euxo pipefail

# Arch Linux install script for srsbsns
# Run from live ISO like `curl -O ... | bash install.sh stage1` or git clone
stage1() {
  # Assume $DISK is a partition of type Solaris Root
  DISK=/dev/nvme0n1p6
  BOOT=/dev/nvme0n1p2
  cryptsetup luksFormat "$DISK"
  cryptsetup open "$DISK" root
  curl -s https://eoli3n.github.io/archzfs/init | bash
  zpool create -f -o ashift=13 \
    -o autotrim=on \
    -O acltype=posixacl \
    -O xattr=sa \
    -O normalization=formD \
    -O compression=lz4 \
    -O relatime=on \
    -O canmount=off \
    -O mountpoint=legacy \
    -O devices=off \
    -R /mnt \
    nvm /dev/mapper/root
  zfs create -o mountpoint=/ nvm/root
  zpool set bootfs=nvm/root nvm
  zfs create -o mountpoint=/home nvm/home
  zfs create -V 20G nvm/docker
  sleep 10
  zpool export nvm
  zpool import -d /dev/mapper/root -R /mnt nvm
  mkfs.ext4 /dev/zvol/nvm/docker
  mkdir -p /mnt/var/lib/docker
  mount /dev/zvol/nvm/docker /mnt/var/lib/docker
  mkdir -p /mnt/boot
  mount $BOOT /mnt/boot
  echo 'Server = https://ftp.rnl.tecnico.ulisboa.pt/pub/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
  pacstrap /mnt base base-devel vi sudo git fd ccache networkmanager openssh linux-lts intel-ucode linux-firmware --noconfirm
  genfstab -U /mnt >> /mnt/etc/fstab
  cp $(basename "$0") /mnt/install.sh
  chmod +x /mnt/install.sh
  arch-chroot /mnt /install.sh stage2
}

stage2() {
  echo 'root:root' | chpasswd
  echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel
  useradd -U -G wheel -m -u 1000 pineman
  echo 'pineman:pineman' | chpasswd
  sudo -u pineman -i /install.sh stage3
}

stage3() {
  sudo bootctl install
  rm -f .bash*
  git init
  git remote add origin https://github.com/pineman/dotfiles.git
  git fetch --all
  git pull origin main
  git branch -D master
  git submodule update --init
  cd .root
  ./system-files.sh
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
  yay -S --noconfirm linux-lts-headers
  yay -S --noconfirm zfs-dkms
  sudo mkinitcpio -P
  sudo zfs snapshot -r nvm@install
}

"$@"
