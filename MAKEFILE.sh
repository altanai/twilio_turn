#!/bin/bash
#sh MAKEFILE
rm package-lock.json
git stash
git pull origin master
apt-get update

# reclaim ownership
sudo chown -R $USER node_modules/twilio_turn/
# set npm path
# npm config set prefix "node_modules"

npm install -g npm@latest
npm update
npm install

# audit Fix Auto and list modules
npm audit fix
npm list -g --depth 0
npm list
pm2 update

#symlink
npm link

pm2 describe twilio_turn > /dev/null
RUNNING=$?
if [ "${RUNNING}" -ne 0 ]; then
  pm2 start npm --name twilio_turn start
else
  pm2 stop twilio_turn
  pm2 delete twilio_turn
  pm2 start twilio_turn
fi;



echo "$(hostname)"

echo "----server started------"
netstat -anp| grep 808
pm2 monit