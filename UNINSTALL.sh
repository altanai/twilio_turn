#!/bin/bash
#sh UNINSTALL

npm unlink                   # No more command installed
npm uninstall `ls -1 node_modules | tr '/\n' ' '`

npm cache clear

sudo npm uninstall npm -g

sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/bin/node*
sudo rm -rf /usr/local/include/node*

sudo apt-get purge nodejs npm
sudo apt autoremove
