#!/bin/bash
set -euxo pipefail

locale-gen
timedatectl set-ntp true
timedatectl set-timezone Europe/Lisbon
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl enable iptables ip6tables systemd-resolved NetworkManager sshd --now
systemctl disable nftables
mkdir /var/tmp/{ccache,aur}
chown -R pineman: /var/tmp/{ccache,aur}
cd /tmp
git clone https://aur.archlinux.org/yay-bin --depth 1
cd yay-bin
makepkg -si
cd
