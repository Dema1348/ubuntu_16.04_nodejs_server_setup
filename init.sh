#!/bin/bash

#Check if the script is being run as root
if [ "$(whoami)" != "root" ]; then
	echo "You must run this script as root."
	exit 1
fi

# Go to home directory
cd ~

printf "\nStarting Script\n\n"
apt-get update
apt-get -y upgrade
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get -y install nodejs build-essential nginx letsencrypt
npm install -g pm2

# Clone git repo with code
git clone https://github.com/marcotriglia/ubuntu-node-init.git
mv ubuntu-node-init/hello.js hello.js

# Clean up
rm nodesource_setup.sh
rm -r ubuntu-node-init


printf "\nInitialization successful\n\n"
