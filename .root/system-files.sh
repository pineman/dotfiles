#!/bin/bash
set -euxo pipefail

fd -I -H -t f . etc -x sh -c '
  echo overwriting /{}
  sudo mkdir -p /{//}
  sudo cp -f {} /{}'
sudo rm -rf /boot/loader/loader.conf /boot/loader/entries/*
sudo cp -rf boot/loader/loader.conf boot/loader/entries /boot/loader
offset=$(sudo filefrag -v /swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')
sudo sed -i "s/#OFFSET#/$offset/g" /boot/loader/entries/*
sudo cp us-esc-caps.map.gz /usr/share/kbd/keymaps/i386/qwerty/
dircolors ~/.dircolors > ~/.ls_colors

