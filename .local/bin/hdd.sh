#!/bin/bash
set -euxo pipefail

SNAP=$(date +%s)
zfs snapshot -r ssd/root@$SNAP ssd/docker@$SNAP ssd/home@$SNAP ssd/Documents@$SNAP
zpool import -o cachefile=none -o altroot=/hdd -N hdd || true
# TODO: does it take longer from -I @install or -i last? (alias last snapshot with name like "last")
zfs send -RI install ssd/root@$SNAP | zfs recv -u hdd/root
zfs send -RI install ssd/docker@$SNAP | zfs recv -u hdd/docker
zfs send -RI install ssd/home@$SNAP | zfs recv -u hdd/home
zfs send -RI install ssd/Documents@$SNAP | zfs recv -u hdd/Documents
zpool export hdd
