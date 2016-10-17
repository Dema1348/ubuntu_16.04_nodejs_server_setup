# Ubuntu 16.04 Server Initialization for Node.js Apps
This script makes it easy to set up an Ubuntu server for Node.js applications

## Usage
Copy-paste the following line into your terminal as superuser

```
sudo curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init.sh
```

Options

-d domain, eg: -d example.com

-s SSL, flag (no flag = no SSL)

-e email, needed if SSL flag, '-s', is used

-p port, if not specified, defaults to 3000


## Example 
The domain is test.example.com and an SSL certificate is wanted, for which an email is required. The port will default to 3000 since the '-p' option isn't used
```
sudo curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init.sh -d test.example.com -s -e test@example.com
```

## Important
If you are using the SSL (-s) option, make sure that your domain points to both ipv4 and ipv6 addresses or letsencrypt will be unable to issue you the certificate

**It might take some time (even hours) for the DNS servers to point to your server**

This has been tested to work on Ubuntu 16.04


## What is Being Installed
Node.js, npm, build essentials, git, nginx, letsencrypt, pm2 (via npm)


## Thank you (& More Info)
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-16-04
