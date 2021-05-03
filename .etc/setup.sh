#!/bin/bash
set -euxo pipefail
if ! [ "$(id -u)" = 0 ]; then
  echo "run as root"
  exit 1
fi
fd -t f -E setup.sh -E srsbsns.conf -E swayshell.desktop -x sh -c '
  mkdir -p /etc/{//}
  rm /etc/{}
  ln {} /etc/{}'
cp srsbsns.conf /boot/loader/entries/
cp swayshell.desktop /usr/share/wayland-sessions/
dircolors ~/.dircolors > ~/.ls_colors; chown pineman: ~/.ls_colors
