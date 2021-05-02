#!/bin/bash
set -euxo pipefail
if ! [ "$(id -u)" = 0 ]; then
  echo "run as root"
  exit 1
fi
fd -t f -E srsbsns.conf -E hardlinks.sh -x sh -c '
  mkdir -p /etc/{//}
  rm /etc/{}
  ln {} /etc/{}'
cp srsbsns.conf /boot/loader/entries/
