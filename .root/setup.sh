#!/bin/bash
set -euxo pipefail
if ! [ "$(id -u)" = 0 ]; then
  echo "run as root"
  exit 1
fi
dircolors ~/.dircolors > ~/.ls_colors; chown pineman: ~/.ls_colors
fd -I -H -t f \
-x sh -c '
  echo syncing {}
  mkdir -p /etc/{//}
  unison -batch -silent {} /etc/{}' . etc
unison -batch -silent -fat boot/loader /boot/loader
yay -Qqs | tail -n +2 > $(cat /etc/hostname)-pkglist.txt
chown -R pineman: .
