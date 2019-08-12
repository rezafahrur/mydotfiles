#!/bin/bash
DATETIME=`date`
UPTIME=`uptime | sed 's/.*up\s*//' | sed 's/,\s*[0-9]* user.*//' | sed 's/ / /g'`
VOLUME="$(amixer sget Master | grep -e 'Front Left:' | \
    sed 's/[^\[]*\[\([0-9]\{1,3\}%\).*\(on\|off\).*/\2 \1/' | sed 's/off/M/' | sed 's/on //' )"
IP="$(ip addr show wlp9s0|grep inet |head -1 | awk '{print $2}')"
SSIDNAME="$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\y -d\e -d\s -d\: -f2)"
BATTERYSTATE=$( acpi -b | awk '{ split($5,a,":"); print substr($3,0,2), $4, "["a[1]":"a[2]"]" }' | tr -d ',' )
xsetroot -name "${SSIDNAME}-${IP} | VOL ${VOLUME} | BATT ${BATTERYSTATE} | ${DATETIME}"