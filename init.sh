#!/bin/bash

# TODO: Set up Git for user (ask name and email)
# TODO: Create new user

# Options
# d - domain (optional): specify domain name (otherwise connect using ip address)
# s - ssl (flag, optional): get ssl certificate and configure server to use it (MUST HAVE DOMAIN)
# p - port (optional): specify what port you want to use

#Check if the script is being run as root
if [ "$(whoami)" != "root" ]; then
	echo "You must run this script as root.";
	exit 1;
fi

# Go to home directory
cd ~

# Set defaults
domain="";
ssl=false;
port=3000;

# Get option arguments
while getopts d::sp::f flag; do
  case $flag in
	d)
	  domain=$OPTARG;
	  ;;
	s)
	  ssl=true;
	  ;;
	p)
	  port=$OPTARG;
	  ;;
	?)
	  exit;
	  ;;
  esac
done
shift $(( OPTIND - 1 ));

# TODO: Trim domain

# TODO: Validate domain

# If domain is empty, make sure ssl is set to false
if [ -z "$domain" ] && $ssl; then
	printf "A domain is required in order to set up SSL\n"
	ssl=false;
	exit; # Comment this line out to continue executing with ssl set to false
fi

printf "\nStarting Script\n\n"

# Update and upgrade OS
apt-get update
apt-get -y upgrade

# Get git
apt-get install -y git

# Get node and install it
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get -y install nodejs build-essential nginx letsencrypt

# Install pm2
npm install -g pm2

# Clone git repo with code
git clone https://github.com/marcotriglia/ubuntu-node-init.git

# Check if repo was cloned successfully
# if [ -L "ubuntu-node-init" ]; then
#   printf "FATAL ERROR: Unable to clone git repository.\n"
#   exit;
# fi

# Stop nginx
systemctl stop nginx

# Replace placeholders in nginx config files with right variables
sed -i "s/your_domain_name/$domain/g" ubuntu-node-init/default*
sed -i "s/your_port/$port/g" ubuntu-node-init/default*

# Add non-ssh nginx
if [ -z "$domain" ]; then
  mv "ubuntu-node-init/default-ip" "/etc/nginx/sites-available/default";
else 
  mv "ubuntu-node-init/default" "/etc/nginx/sites-available/default";
fi

# Get letsencrypt if ssh flag is true
letsencrypt certonly --standalone -d $domain --agree-tos -n --email example@domain.com

# Add ssh nginx if flag is true
if [ -n "$domain" ] && $ssl; then
  mv "ubuntu-node-init/default-ssl" /etc/nginx/sites-enabled/default
fi

# Restart Nginx
systemctl start nginx

# Allow traffic to Nginx through firewall
ufw allow 'Nginx Full'

# Move needed files out of git directory (it will be deleted later)
mv ubuntu-node-init/hello.js hello.js

# Clean up
rm nodesource_setup.sh
rm -r ubuntu-node-init

# Start hello.js via pm2
pm2 start hello.js

printf "\nInitialization successful\n\n"
