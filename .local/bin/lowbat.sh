#!/bin/bash
set -euxo pipefail

THRESHOLD=10
while :; do
  acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
    read -r status capacity
    if [ "$status" = "Discharging" -a "$capacity" -lt "$THRESHOLD" ]; then
      logger "Critical battery threshold reached: hibernating."
      notify-send -u critical "Critical battery threshold reached: hibernating." -i "battery" -a "lowbat.sh"
      systemctl hibernate
    fi
  }
  sleep 30
done
