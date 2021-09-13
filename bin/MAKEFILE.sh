#!/bin/bash
#sh MAKEFILE

#echo "$(date)"
# Print the effective node_modules folder to standard out.
global_node_modules="$(npm root --global)"
echo "Global packages installed in: ${global_node_modules}"

npm install -g npm@latest
npm update
npm install

# audit Fix Auto and list modules
npm audit fix
npm list -g --depth 0
npm list
pm2 update

# Print the folder where npm will install executables.
npm bin

npm run prod
pm2 describe twilio_turn > /dev/null
RUNNING=$?
if [ "${RUNNING}" -ne 0 ]; then
  pm2 start  --name twilio_turn  --log-date-format 'DD-MM HH:mm:ss.SSS'
else
  pm2 stop twilio_turn
  pm2 delete twilio_turn
  pm2 start twilio_turn
fi;

echo "----server started------"
 pm2 describe twilio_turn
# pm2 monit twilio_turn
# pm2 logs twilio_turn  --line 30
