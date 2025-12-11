# !/bin/bash

nmcli -t -f IN-USE,SSID,SIGNAL,SECURITY,CHAN device wifi list \
| jq -R -s '
  split("\n")[:-1]
  | map(split(":"))
  | map({
      in_use: (.[0] == "*"),
      ssid: .[1],
      signal: (.[2] | tonumber),
      security: (
        if .[3] == "" then
          []
        else
          .[3] | split(" ")
        end
      ),
      channel: (.[4] | tonumber)
    })
'
