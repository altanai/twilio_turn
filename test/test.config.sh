#!/bin/bash

rm package-lock.json
git stash
git pull origin master
apt-get update

# reclaim ownership
sudo chown -R $USER node_modules/twilio_turn/
set npm path
npm config set prefix "node_modules"
