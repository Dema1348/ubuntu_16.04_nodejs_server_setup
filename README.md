# Read Me
Copy-paste the following line into your terminal as superuser

```
sudo curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init.sh
```

Options

-d domain, eg: -d example.com

-s SSL, flag (no flag = no SSL)

-p port, if not specified, defaults to 3000

-e email, needed if SSL flag, '-s', is present

Example: domain is test.example.com and request SSL certificate
```
sudo curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init.sh -d test.example.com -s
```


# Important Notes
If you are using the SSL (-s) option, make sure that your domain points to both ipv4 and ipv6 addresses or letsencrypt will be unable to issue you the certificate

You must run the command as superuser

This has been tested to work on Ubuntu 16.0.4

If you encounter any issues please create one here


# Thank you
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-16-04
