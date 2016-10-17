# Read Me
Copy-paste the following line into your terminal as superuser

```
curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init
```

Options

-d domain, eg: -d example.com

-s SSL, flag (no flag = no ssl)

-p port, if not specified, defaults to 3000

eg. 
```
curl -sL http://bit.ly/2dHzYgA -o init.sh && chmod 755 init.sh && ./init.sh -d test.example.com -s
```


# Important Notes
If you are using the SSL (-s) option, make sure that your domain points to both the ipv4 AND ipv6 addresses or letsencrypt will be unable to issue you the certificate

This has been tested to work on Ubuntu 16.0.4

If you encounter any issues please create one here


# Thank you
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-16-04
