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
