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
cp -rf boot/loader/loader.conf boot/loader/entries /boot/loader
cp us-esc-caps.map.gz /usr/share/kbd/keymaps/i386/qwerty/
yay -Qqs | tail -n +2 > $(cat /etc/hostname)-pkglist.txt
chown -R pineman: .
dircolors ~/.dircolors > ~/.ls_colors; chown pineman: ~/.ls_colors

code --install-extension golang.Go
