#!/bin/bash
set -euxo pipefail
if ! [ "$(id -u)" = 0 ]; then
  echo "run as root"
  exit 1
fi
yay -Qqs &> pkglist.txt
fd -I -H -t f -E setup.sh -E pinecone.conf -E srsbsns.conf -E srsbsns-lts.conf -E swayshell.desktop -E pkglist.txt \
-x sh -c '
  echo syncing {}
  mkdir -p /etc/{//}
  unison -batch -silent {} /etc/{}'
chown -R pineman: .
dircolors ~/.dircolors > ~/.ls_colors; chown pineman: ~/.ls_colors
cp pinecone.conf /boot/loader/entries/
#cp srsbsns.conf srsbsns-lts.conf /boot/loader/entries/
#cp swayshell.desktop /usr/share/wayland-sessions/
