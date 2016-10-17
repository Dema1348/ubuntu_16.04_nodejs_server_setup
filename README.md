# Read Me
Copy-paste the following line of code into your terminal as superuser

git clone https://github.com/marcotriglia/ubuntu-node-init.git && chmod 755 ubuntu-node-init/init.sh && ./ubuntu-node-init/init.sh

Options

-d domain, eg: -d example.com

-s ssl, flag (no flag = no ssl)

-p port, if not specified, defaults to 3000


If you encounter any issues please create one here

# Important Note
If you are using the ssl (-s) option, make sure that your domain points to both the ipv4 AND ipv6 addresses or letsencrypt will be unable to issue you the certificate
