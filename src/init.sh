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
	e)
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

# Update and upgrade OS
apt-get update
apt-get -y upgrade

# Get node and install it
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get -y install nodejs build-essential nginx letsencrypt  git

# Install pm2
npm install -g pm2

# Clone git repo with code
git clone https://github.com/marcotriglia/ubuntu_16.04_nodejs_server_setup.git

# Stop nginx
systemctl stop nginx

# Replace placeholders in nginx config files with right variables
sed -i "s/your_domain_name/$domain/g" ubuntu_16.04_nodejs_server_setup/src/res/*
sed -i "s/your_port/$port/g" ubuntu_16.04_nodejs_server_setup/src/res/*

# Add non-ssh nginx
if [ -z "$domain" ]; then
  mv "ubuntu_16.04_nodejs_server_setup/src/res/default-ip" "/etc/nginx/sites-available/default";
else 
  mv "ubuntu_16.04_nodejs_server_setup/src/res/default" "/etc/nginx/sites-available/default";
fi

# Get letsencrypt if ssh flag is true
letsencrypt certonly --standalone -d $domain --agree-tos -n --email $email

# Add ssh nginx if flag is true
if [ -n "$domain" ] && $ssl; then
  mv "ubuntu_16.04_nodejs_server_setup/src/res/default-ssl" /etc/nginx/sites-enabled/default
fi

# Update crontab
# crontab -e
# append following two lines
# 30 2 * * 1 /usr/bin/letsencrypt renew >> /var/log/le-renew.log
# 35 2 * * 1 /bin/systemctl reload nginx

# Restart Nginx
systemctl start nginx

# Allow traffic to Nginx through firewall
ufw allow 'Nginx Full'

# Move needed files out of git directory (it will be deleted later)
mv ubuntu_16.04_nodejs_server_setup/src/res/hello.js hello.js

# Clean up
rm init.sh
rm nodesource_setup.sh
rm -r ubuntu_16.04_nodejs_server_setup

# Start hello.js via pm2
pm2 start hello.js