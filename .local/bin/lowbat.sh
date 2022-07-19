#!/bin/sh

BatteryDir="/sys/class/power_supply/BAT0"
MinPercent=15
while :; do
  read -r BatStatus < "$BatteryDir/status"
  read -r BatPercent < "$BatteryDir/capacity"
  if [ "$BatStatus" = "Discharging" ] && [ $BatPercent -le $MinPercent ]; then
    logger "Critical battery threshold reached: hibernating."
    notify-send -u critical "Critical battery threshold reached: hibernating." -i "battery" -a "lowbat.sh"
    systemctl hibernate
  fi
  sleep 60
done 

