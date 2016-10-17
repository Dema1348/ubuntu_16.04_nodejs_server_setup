# Read Me
Copy-paste the following line of code into your terminal as superuser

curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init.sh

eg. curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init.sh -d test.example.com -s


Options

-d domain, eg: -d example.com

-s ssl, flag (no flag = no ssl)

-p port, if not specified, defaults to 3000


If you encounter any issues please create one here

# Important Note
If you are using the ssl (-s) option, make sure that your domain points to both the ipv4 AND ipv6 addresses or letsencrypt will be unable to issue you the certificate
