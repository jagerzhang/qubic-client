#!/bin/bash

# desc: 获取本地网卡IP
# usage: get_ip_of_interface [eth0]
get_ip_of_interface()
{
   local iface=${1:-eth0}
   /sbin/ip addr | grep "$iface$" 2>/dev/null | \
   awk -F '[/ ]+' '/inet / {print $3}'
   # 返回grep的状态，可用于判断$iface是否存在
   return ${PIPESTATUS[1]}
}
 
local_addr=$(get_ip_of_interface ${IFNAME:-eth0})

cat >/opt/appsettings.json <<EOF
{
    "Settings": {
        "baseUrl": "https://mine.qubic.li/",
        "amountOfThreads": ${THREADS:-4},
        "alias": "${ALIAS:-$local_addr}",
        "accessToken": "${TOKEN:-eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjliNGRhMjE4LTMxMTctNGZiZC1hMTA3LWU1NDdiM2FiYTM5MCIsIk1pbmluZyI6IiIsIm5iZiI6MTcwOTA5NjYwMCwiZXhwIjoxNzQwNjMyNjAwLCJpYXQiOjE3MDkwOTY2MDAsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.kxhLFKwDHDsyQhVt2GChj1ROzupM7QcFdT0LbX14XmDp09RvpN54T4sGRF7dvHf7bZOagc_nEMR6wkN3SofOUQ}",
        "autoupdateEnabled": ${AUTO_UPDATE_ENABLED:-true}
    }
}
EOF

exec "$@"
