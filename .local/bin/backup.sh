#!/bin/bash
set -euxo pipefail
# setup: zfs (obv), b2-linux curl and login, .mailrc gmail config
zpool import -o cachefile=none -o altroot=/hdd -N hdd || true
last_recv=$(zfs list -H -o name -t snapshot -s creation hdd | tail -n 1 | cut -d'@' -f2)
new=$(date +%s | md5sum | cut -c1-8)
zfs snapshot -r ssd@$new
zfs send -R -I $last_recv ssd@$new | zfs recv -Fdu hdd
zpool export hdd
b2-linux sync --noProgress --keepDays 30 --threads 8 --replaceNewer /home/pineman/Documents/.zfs/snapshot/$new b2://pineman-Documents
mailx -s 'pinecone backup' joao.castropinheiro@gmail.com <<< $(journalctl _SYSTEMD_INVOCATION_ID=$(systemctl show -P InvocationID backup))
