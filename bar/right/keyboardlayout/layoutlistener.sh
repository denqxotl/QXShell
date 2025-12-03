#!/bin/sh
SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
socat - UNIX-CONNECT:"$SOCKET" | while read -r line; do
  if echo "$line" | grep -q "^activelayout>>"; then
    layout=$(echo "$line" | cut -d',' -f2)
    echo "$layout"
  fi
done
