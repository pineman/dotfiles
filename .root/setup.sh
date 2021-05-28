#!/bin/bash
set -euxo pipefail
if ! [ "$(id -u)" = 0 ]; then
  echo "run as root"
  exit 1
fi
dircolors ~/.dircolors > ~/.ls_colors; chown pineman: ~/.ls_colors
(cd etc && fd -I -H -t f -x sh -c '
  echo syncing {}
  mkdir -p /etc/{//}
  unison -batch -silent {} /etc/{}')
unison -batch -silent -fat boot/loader /boot/loader
cp us-esc-caps.map.gz /usr/share/kbd/keymaps/i386/qwerty/
yay -Qqs | tail -n +2 > $(cat /etc/hostname)-pkglist.txt
chown -R pineman: .
