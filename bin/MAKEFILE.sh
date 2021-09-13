#!/bin/bash
#sh MAKEFILE

echo "$(date)"
# Print the effective node_modules folder to standard out.
global_node_modules="$(npm root --global)"
echo "Global packages installed in: ${global_node_modules}"


# Print the folder where npm will install executables.
npm bin

#pm2 describe token > /dev/null
#RUNNING=$?
#if [ "${RUNNING}" -ne 0 ]; then
  export NODE_ENV="prod"
  pm2 start ${global_node_modules}/twilio_turn/token.js
#else
#  pm2 stop token
#  pm2 delete token
#  pm2 start token.js
#fi;

#pm2 start ${global_node_modules}/twilio_turn/token.js
echo "----server started------"
#pm2 describe token
# pm2 monit twilio_turn
# pm2 logs twilio_turn  --line 30
