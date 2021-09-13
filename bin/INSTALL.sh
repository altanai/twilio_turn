#!/bin/bash
#sh INSTALL
#echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
#. ~/.bashrc
#mkdir ~/local
#mkdir ~/node-latest-install
#cd ~/node-latest-install
#curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
#./configure --prefix=~/local
#make install # ok, fine, this step probably takes more than 30 seconds...
#curl https://www.npmjs.org/install.sh | sh

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs
node --version
npm --version
npm install pm2@latest -g

apt update && apt install sudo curl && curl -sL https://raw.githubusercontent.com/Unitech/pm2/master/packager/setup.deb.sh | sudo -E bash -

#openssl x509 -outform der -in your-cert.pem -out your-cert.crt



npm install -g npm@latest
npm update
npm install

# audit Fix Auto and list modules
npm audit fix
npm list -g --depth 0
npm list
pm2 update

#Make file executable
chmod +x MAKEFILE.sh
#symlink
npm link twilio_turn

