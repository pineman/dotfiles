#!/bin/bash
set -euxo pipefail
if ! [ "$(id -u)" = 0 ]; then
  echo "run as root"
  exit 1
fi
fd -I -H -t f . etc -x sh -c '
  echo overwriting /{}
  mkdir -p /{//}
  cp -f {} /{}'
rm -rf /boot/loader/loader.conf /boot/loader/entries/*
cp -rf boot/loader/loader.conf boot/loader/entries /boot/loader
cp us-esc-caps.map.gz /usr/share/kbd/keymaps/i386/qwerty/
chown -R pineman: .
dircolors ~pineman/.dircolors > ~pineman/.ls_colors
chown pineman: ~pineman/.ls_colors
#locale-gen
#timedatectl set-ntp true
#timedatectl set-timezone Europe/Lisbon
#ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
#systemctl enable iptables ip6tables systemd-resolved NetworkManager sshd bluetooth --now
#systemctl disable nftables
#mkdir /var/tmp/{ccache,aur}
#chown -R pineman: /var/tmp/{ccache,aur}
