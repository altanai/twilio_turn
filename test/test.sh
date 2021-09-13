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

#  "scripts": {
#    "test": "echo \"Error: no test specified\" && exit 1",
#    "start": "DEBUG=* node token.js",
#    "prod": "NODE_ENV=prod node token.js",
#    "dev": "NODE_ENV=dev node token.js"
#  },
