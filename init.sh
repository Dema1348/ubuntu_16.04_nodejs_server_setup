#!/bin/bash

# Options
# p - port (optional): specify what port you want to use
# d - domain (optional): specify domain name (otherwise connect using ip address)
# s - SSL (flag, optional): get SSL certificate and configure server to use it (MUST HAVE DOMAIN)
# e - email (needed if '-s' flag is used): used to obtain your SSL certificate

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
email="";

# Get option arguments
while getopts d::sp::e::f flag; do
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
	p)
	  email=$OPTARG;
	  ;;
	?)
	  exit;
	  ;;
  esac
done
shift $(( OPTIND - 1 ));

# TODO: Trim domain

# TODO: Validate domain

# If domain is empty, make sure SSL is set to false
if [ -z "$domain" ] && $ssl; then
	printf "A domain is required in order to obtain an SSL certificate\n"
	ssl=false;
	exit; # Comment this line out to continue executing with SSL set to false
fi

# If SSL is true, make sure an email has been entered
if [ -z "$email" ] && $ssl; then
	printf "An email is required in order to obtain an SSL certificate\n"
	ssl=false;
	exit; # Comment this line out to continue executing with SSL set to false
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

# Stop nginx
systemctl stop nginx

# Replace placeholders in nginx config files with right variables
sed -i "s/your_domain_name/$domain/g" ubuntu-node-init/resources/default*
sed -i "s/your_port/$port/g" ubuntu-node-init/resources/default*
sed -i "s/your_port/$port/g" ubuntu-node-init/resources/hello.js

# Add non-ssh nginx
if [ -z "$domain" ]; then
  mv "ubuntu-node-init/resources/default-ip" "/etc/nginx/sites-available/default";
else 
  mv "ubuntu-node-init/resources/default" "/etc/nginx/sites-available/default";
fi

# Get letsencrypt if ssh flag is true
letsencrypt certonly --standalone -d $domain --agree-tos -n --email $email

# Add ssh nginx if flag is true
if [ -n "$domain" ] && $ssl; then
  mv "ubuntu-node-init/resources/default-ssl" /etc/nginx/sites-enabled/default
fi

# Restart Nginx
systemctl start nginx

# Allow traffic to Nginx through firewall
ufw allow 'Nginx Full'

# Move needed files out of git directory (it will be deleted later)
mv ubuntu-node-init/resources/hello.js hello.js

# Clean up
rm init.sh
rm nodesource_setup.sh
rm -r ubuntu-node-init

# Start hello.js via pm2
pm2 start hello.js

printf "\nInitialization successful\n\n"
