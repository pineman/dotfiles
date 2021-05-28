#!/bin/bash
set -euxo pipefail

zpool import -o cachefile=none -o altroot=/hdd -N hdd || true
last_recv=$(zfs list -H -o name -t snapshot -s creation hdd | tail -n 1 | cut -d'@' -f2)
#new=$(perl -l -e 'print ++$ARGV[0]' $last_recv)
new=$(ruby -e 'puts ARGV[0].succ' $last_recv)
zfs snapshot -r ssd@$new
zfs send -R -I $last_recv ssd@$new | zfs recv -Fdu hdd
backblaze-b2 sync --noProgress --keepDays 30 --threads 8 --replaceNewer /home/pineman/Documents/.zfs/snapshot/$new b2://pineman-Documents
zpool export hdd
