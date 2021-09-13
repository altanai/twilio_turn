#!/bin/bash
echo $(date)
global_node_modules="$(npm root --global)"
echo "Global packages installed in: ${global_node_modules}"

pm2 describe twilio_turn > /dev/null
RUNNING=$?

if [ "${RUNNING}" -ne 0 ]; then
  echo " Not even ran "
else
  echo " Running of stopped"
fi;
