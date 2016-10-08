Last login: Thu Oct  6 13:02:57 on ttys000
MacBook-Pro:~ marcotriglia$ ssh root@159.203.128.12
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-38-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 packages can be updated.
0 updates are security updates.


Last login: Thu Oct  6 18:03:01 2016 from 72.211.85.80
root@ct-01:~# ls
root@ct-01:~# sudo nano /etc/nginx/sites-available/default
root@ct-01:~# cd /etc/nginx/sites-available/
root@ct-01:/etc/nginx/sites-available# ls
default  default.save
root@ct-01:/etc/nginx/sites-available# cat default
server {
    listen 80;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
root@ct-01:/etc/nginx/sites-available# nano default
root@ct-01:/etc/nginx/sites-available# sudo nginx -t
nginx: [emerg] directive "server_name" is not terminated by ";" in /etc/nginx/sites-enabled/default:6
nginx: configuration file /etc/nginx/nginx.conf test failed
root@ct-01:/etc/nginx/sites-available# nano default
root@ct-01:/etc/nginx/sites-available# sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@ct-01:/etc/nginx/sites-available# sudo systemctl restart nginx
root@ct-01:/etc/nginx/sites-available# sudo ufw allow 'Nginx Full'
Skipping adding existing rule
Skipping adding existing rule (v6)
root@ct-01:/etc/nginx/sites-available# sudo apt-get install letsencrypt
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  dialog libpython-stdlib libpython2.7-minimal libpython2.7-stdlib python python-acme
  python-cffi-backend python-chardet python-configargparse python-configobj
  python-cryptography python-dialog python-enum34 python-funcsigs python-idna
  python-ipaddress python-letsencrypt python-minimal python-mock python-ndg-httpsclient
  python-openssl python-parsedatetime python-pbr python-pkg-resources python-psutil
  python-pyasn1 python-pyicu python-requests python-rfc3339 python-six python-tz
  python-urllib3 python-zope.component python-zope.event python-zope.hookable
  python-zope.interface python2.7 python2.7-minimal
Suggested packages:
  python-letsencrypt-apache python-letsencrypt-doc python-doc python-tk python-configobj-doc
  python-cryptography-doc python-cryptography-vectors python-enum34-doc python-funcsigs-doc
  python-mock-doc python-openssl-doc python-openssl-dbg python-setuptools python-psutil-doc
  doc-base python-ntlm python2.7-doc binfmt-support
The following NEW packages will be installed:
  dialog letsencrypt libpython-stdlib libpython2.7-minimal libpython2.7-stdlib python
  python-acme python-cffi-backend python-chardet python-configargparse python-configobj
  python-cryptography python-dialog python-enum34 python-funcsigs python-idna
  python-ipaddress python-letsencrypt python-minimal python-mock python-ndg-httpsclient
  python-openssl python-parsedatetime python-pbr python-pkg-resources python-psutil
  python-pyasn1 python-pyicu python-requests python-rfc3339 python-six python-tz
  python-urllib3 python-zope.component python-zope.event python-zope.hookable
  python-zope.interface python2.7 python2.7-minimal
0 upgraded, 39 newly installed, 0 to remove and 0 not upgraded.
Need to get 5,817 kB of archives.
After this operation, 27.5 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libpython2.7-minimal amd64 2.7.12-1~16.04 [339 kB]
Get:2 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 python2.7-minimal amd64 2.7.12-1~16.04 [1,294 kB]
Get:3 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-minimal amd64 2.7.11-1 [28.2 kB]
Get:4 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libpython2.7-stdlib amd64 2.7.12-1~16.04 [1,877 kB]
Get:5 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 python2.7 amd64 2.7.12-1~16.04 [224 kB]
Get:6 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 libpython-stdlib amd64 2.7.11-1 [7,656 B]
Get:7 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python amd64 2.7.11-1 [137 kB]
Get:8 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 dialog amd64 1.3-20160209-1 [215 kB]
Get:9 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-cffi-backend amd64 1.5.2-1ubuntu1 [58.1 kB]
Get:10 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-enum34 all 1.1.2-1 [35.8 kB]
Get:11 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-idna all 2.0-3 [35.1 kB]
Get:12 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-ipaddress all 1.0.16-1 [18.0 kB]
Get:13 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pkg-resources all 20.7.0-1 [108 kB]
Get:14 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pyasn1 all 0.1.9-1 [45.1 kB]
Get:15 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-six all 1.10.0-3 [10.9 kB]
Get:16 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-cryptography amd64 1.2.3-1 [198 kB]
Get:17 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-openssl all 0.15.1-2build1 [84.1 kB]
Get:18 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-funcsigs all 0.4-2 [12.6 kB]
Get:19 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pbr all 1.8.0-4ubuntu1 [46.6 kB]
Get:20 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-mock all 1.3.0-2.1ubuntu1 [46.5 kB]
Get:21 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-ndg-httpsclient all 0.4.0-3 [25.1 kB]
Get:22 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 python-urllib3 all 1.13.1-2ubuntu0.16.04.1 [57.2 kB]
Get:23 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-chardet all 2.3.0-2 [96.3 kB]
Get:24 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-requests all 2.9.1-3 [55.6 kB]
Get:25 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-tz all 2014.10~dfsg1-0ubuntu2 [31.5 kB]
Get:26 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-rfc3339 all 1.0-4 [6,290 B]
Get:27 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-acme all 0.4.1-1 [57.0 kB]
Get:28 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-configargparse all 0.10.0-2 [20.2 kB]
Get:29 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-configobj all 5.0.6-2 [34.2 kB]
Get:30 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-dialog amd64 3.3.0-2 [65.4 kB]
Get:31 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-parsedatetime all 1.4-1 [37.6 kB]
Get:32 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-psutil amd64 3.4.2-1 [55.2 kB]
Get:33 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-zope.event all 4.2.0-1 [7,412 B]
Get:34 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-zope.interface amd64 4.1.3-1build1 [81.0 kB]
Get:35 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-zope.hookable amd64 4.0.4-4build2 [9,172 B]
Get:36 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-zope.component all 4.2.2-1 [38.5 kB]
Get:37 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-letsencrypt all 0.4.1-1 [129 kB]
Get:38 http://mirrors.digitalocean.com/ubuntu xenial/universe amd64 letsencrypt all 0.4.1-1 [10.9 kB]
Get:39 http://mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pyicu amd64 1.9.2-2build1 [179 kB]
Fetched 5,817 kB in 0s (7,735 kB/s)
Extracting templates from packages: 100%
Selecting previously unselected package libpython2.7-minimal:amd64.
(Reading database ... 65599 files and directories currently installed.)
Preparing to unpack .../libpython2.7-minimal_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython2.7-minimal:amd64 (2.7.12-1~16.04) ...
Selecting previously unselected package python2.7-minimal.
Preparing to unpack .../python2.7-minimal_2.7.12-1~16.04_amd64.deb ...
Unpacking python2.7-minimal (2.7.12-1~16.04) ...
Selecting previously unselected package python-minimal.
Preparing to unpack .../python-minimal_2.7.11-1_amd64.deb ...
Unpacking python-minimal (2.7.11-1) ...
Selecting previously unselected package libpython2.7-stdlib:amd64.
Preparing to unpack .../libpython2.7-stdlib_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython2.7-stdlib:amd64 (2.7.12-1~16.04) ...
Selecting previously unselected package python2.7.
Preparing to unpack .../python2.7_2.7.12-1~16.04_amd64.deb ...
Unpacking python2.7 (2.7.12-1~16.04) ...
Selecting previously unselected package libpython-stdlib:amd64.
Preparing to unpack .../libpython-stdlib_2.7.11-1_amd64.deb ...
Unpacking libpython-stdlib:amd64 (2.7.11-1) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for mime-support (3.59ubuntu1) ...
Setting up libpython2.7-minimal:amd64 (2.7.12-1~16.04) ...
Setting up python2.7-minimal (2.7.12-1~16.04) ...
Linking and byte-compiling packages for runtime python2.7...
Setting up python-minimal (2.7.11-1) ...
Selecting previously unselected package python.
(Reading database ... 66345 files and directories currently installed.)
Preparing to unpack .../python_2.7.11-1_amd64.deb ...
Unpacking python (2.7.11-1) ...
Selecting previously unselected package dialog.
Preparing to unpack .../dialog_1.3-20160209-1_amd64.deb ...
Unpacking dialog (1.3-20160209-1) ...
Selecting previously unselected package python-cffi-backend.
Preparing to unpack .../python-cffi-backend_1.5.2-1ubuntu1_amd64.deb ...
Unpacking python-cffi-backend (1.5.2-1ubuntu1) ...
Selecting previously unselected package python-enum34.
Preparing to unpack .../python-enum34_1.1.2-1_all.deb ...
Unpacking python-enum34 (1.1.2-1) ...
Selecting previously unselected package python-idna.
Preparing to unpack .../python-idna_2.0-3_all.deb ...
Unpacking python-idna (2.0-3) ...
Selecting previously unselected package python-ipaddress.
Preparing to unpack .../python-ipaddress_1.0.16-1_all.deb ...
Unpacking python-ipaddress (1.0.16-1) ...
Selecting previously unselected package python-pkg-resources.
Preparing to unpack .../python-pkg-resources_20.7.0-1_all.deb ...
Unpacking python-pkg-resources (20.7.0-1) ...
Selecting previously unselected package python-pyasn1.
Preparing to unpack .../python-pyasn1_0.1.9-1_all.deb ...
Unpacking python-pyasn1 (0.1.9-1) ...
Selecting previously unselected package python-six.
Preparing to unpack .../python-six_1.10.0-3_all.deb ...
Unpacking python-six (1.10.0-3) ...
Selecting previously unselected package python-cryptography.
Preparing to unpack .../python-cryptography_1.2.3-1_amd64.deb ...
Unpacking python-cryptography (1.2.3-1) ...
Selecting previously unselected package python-openssl.
Preparing to unpack .../python-openssl_0.15.1-2build1_all.deb ...
Unpacking python-openssl (0.15.1-2build1) ...
Selecting previously unselected package python-funcsigs.
Preparing to unpack .../python-funcsigs_0.4-2_all.deb ...
Unpacking python-funcsigs (0.4-2) ...
Selecting previously unselected package python-pbr.
Preparing to unpack .../python-pbr_1.8.0-4ubuntu1_all.deb ...
Unpacking python-pbr (1.8.0-4ubuntu1) ...
Selecting previously unselected package python-mock.
Preparing to unpack .../python-mock_1.3.0-2.1ubuntu1_all.deb ...
Unpacking python-mock (1.3.0-2.1ubuntu1) ...
Selecting previously unselected package python-ndg-httpsclient.
Preparing to unpack .../python-ndg-httpsclient_0.4.0-3_all.deb ...
Unpacking python-ndg-httpsclient (0.4.0-3) ...
Selecting previously unselected package python-urllib3.
Preparing to unpack .../python-urllib3_1.13.1-2ubuntu0.16.04.1_all.deb ...
Unpacking python-urllib3 (1.13.1-2ubuntu0.16.04.1) ...
Selecting previously unselected package python-chardet.
Preparing to unpack .../python-chardet_2.3.0-2_all.deb ...
Unpacking python-chardet (2.3.0-2) ...
Selecting previously unselected package python-requests.
Preparing to unpack .../python-requests_2.9.1-3_all.deb ...
Unpacking python-requests (2.9.1-3) ...
Selecting previously unselected package python-tz.
Preparing to unpack .../python-tz_2014.10~dfsg1-0ubuntu2_all.deb ...
Unpacking python-tz (2014.10~dfsg1-0ubuntu2) ...
Selecting previously unselected package python-rfc3339.
Preparing to unpack .../python-rfc3339_1.0-4_all.deb ...
Unpacking python-rfc3339 (1.0-4) ...
Selecting previously unselected package python-acme.
Preparing to unpack .../python-acme_0.4.1-1_all.deb ...
Unpacking python-acme (0.4.1-1) ...
Selecting previously unselected package python-configargparse.
Preparing to unpack .../python-configargparse_0.10.0-2_all.deb ...
Unpacking python-configargparse (0.10.0-2) ...
Selecting previously unselected package python-configobj.
Preparing to unpack .../python-configobj_5.0.6-2_all.deb ...
Unpacking python-configobj (5.0.6-2) ...
Selecting previously unselected package python-dialog.
Preparing to unpack .../python-dialog_3.3.0-2_amd64.deb ...
Unpacking python-dialog (3.3.0-2) ...
Selecting previously unselected package python-parsedatetime.
Preparing to unpack .../python-parsedatetime_1.4-1_all.deb ...
Unpacking python-parsedatetime (1.4-1) ...
Selecting previously unselected package python-psutil.
Preparing to unpack .../python-psutil_3.4.2-1_amd64.deb ...
Unpacking python-psutil (3.4.2-1) ...
Selecting previously unselected package python-zope.event.
Preparing to unpack .../python-zope.event_4.2.0-1_all.deb ...
Unpacking python-zope.event (4.2.0-1) ...
Selecting previously unselected package python-zope.interface.
Preparing to unpack .../python-zope.interface_4.1.3-1build1_amd64.deb ...
Unpacking python-zope.interface (4.1.3-1build1) ...
Selecting previously unselected package python-zope.hookable.
Preparing to unpack .../python-zope.hookable_4.0.4-4build2_amd64.deb ...
Unpacking python-zope.hookable (4.0.4-4build2) ...
Selecting previously unselected package python-zope.component.
Preparing to unpack .../python-zope.component_4.2.2-1_all.deb ...
Unpacking python-zope.component (4.2.2-1) ...
Selecting previously unselected package python-letsencrypt.
Preparing to unpack .../python-letsencrypt_0.4.1-1_all.deb ...
Unpacking python-letsencrypt (0.4.1-1) ...
Selecting previously unselected package letsencrypt.
Preparing to unpack .../letsencrypt_0.4.1-1_all.deb ...
Unpacking letsencrypt (0.4.1-1) ...
Selecting previously unselected package python-pyicu.
Preparing to unpack .../python-pyicu_1.9.2-2build1_amd64.deb ...
Unpacking python-pyicu (1.9.2-2build1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libpython2.7-stdlib:amd64 (2.7.12-1~16.04) ...
Setting up python2.7 (2.7.12-1~16.04) ...
Setting up libpython-stdlib:amd64 (2.7.11-1) ...
Setting up python (2.7.11-1) ...
Setting up dialog (1.3-20160209-1) ...
Setting up python-cffi-backend (1.5.2-1ubuntu1) ...
Setting up python-enum34 (1.1.2-1) ...
Setting up python-idna (2.0-3) ...
Setting up python-ipaddress (1.0.16-1) ...
Setting up python-pkg-resources (20.7.0-1) ...
Setting up python-pyasn1 (0.1.9-1) ...
Setting up python-six (1.10.0-3) ...
Setting up python-cryptography (1.2.3-1) ...
Setting up python-openssl (0.15.1-2build1) ...
Setting up python-funcsigs (0.4-2) ...
Setting up python-pbr (1.8.0-4ubuntu1) ...
update-alternatives: using /usr/bin/python2-pbr to provide /usr/bin/pbr (pbr) in auto mode
Setting up python-mock (1.3.0-2.1ubuntu1) ...
Setting up python-ndg-httpsclient (0.4.0-3) ...
Setting up python-urllib3 (1.13.1-2ubuntu0.16.04.1) ...
Setting up python-chardet (2.3.0-2) ...
Setting up python-requests (2.9.1-3) ...
Setting up python-tz (2014.10~dfsg1-0ubuntu2) ...
Setting up python-rfc3339 (1.0-4) ...
Setting up python-acme (0.4.1-1) ...
Setting up python-configargparse (0.10.0-2) ...
Setting up python-configobj (5.0.6-2) ...
Setting up python-dialog (3.3.0-2) ...
Setting up python-parsedatetime (1.4-1) ...
Setting up python-psutil (3.4.2-1) ...
Setting up python-zope.event (4.2.0-1) ...
Setting up python-zope.interface (4.1.3-1build1) ...
Setting up python-zope.hookable (4.0.4-4build2) ...
Setting up python-zope.component (4.2.2-1) ...
Setting up python-letsencrypt (0.4.1-1) ...
Setting up letsencrypt (0.4.1-1) ...
Setting up python-pyicu (1.9.2-2build1) ...
root@ct-01:/etc/nginx/sites-available# sudo systemctl stop nginx
root@ct-01:/etc/nginx/sites-available# cd ~
root@ct-01:~# sudo letsencrypt certonly --standalone









          ┌──────────────────────────────────────────────────────────────────────┐
          │ Enter email address (used for urgent notices and lost key recovery)  │  
          │ ┌──────────────────────────────────────────────────────────────────┐ │  
          │ │trigliamarco@gmail.com                                            │ │  
          │ └──────────────────────────────────────────────────────────────────┘ │  
          ├──────────────────────────────────────────────────────────────────────┤  
          │                     <  OK  >           <Cancel>                      │  
          └──────────────────────────────────────────────────────────────────────┘  
                                                                                    











          ┌──────────────────────────────────────────────────────────────────────┐
          │ Please read the Terms of Service at                                  │  
          │ https://letsencrypt.org/documents/LE-SA-v1.1.1-August-1-2016.pdf.    │  
          │ You must agree in order to register with the ACME server at          │  
          │ https://acme-v01.api.letsencrypt.org/directory                       │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          │                                                                      │  
          ├──────────────────────────────────────────────────────────────────────┤  
          │                     <Agree >           <Cancel>                      │  
          └──────────────────────────────────────────────────────────────────────┘  
                                                                                    










          ┌──────────────────────────────────────────────────────────────────────┐
          │ Please enter in your domain name(s) (comma and/or space separated)   │  
          │ ┌──────────────────────────────────────────────────────────────────┐ │  
          │ │                                                                  │ │  
          │ └──────────────────────────────────────────────────────────────────┘ │  
          ├──────────────────────────────────────────────────────────────────────┤  
          │                     <  OK  >           <Cancel>                      │  
          └──────────────────────────────────────────────────────────────────────┘  
                                                                                    







Please specify --domains, or --installer that will help in domain names autodiscovery

IMPORTANT NOTES:
 - If you lose your account credentials, you can recover through
   e-mails sent to trigliamarco@gmail.com.
 - Your account credentials have been saved in your Let's Encrypt
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Let's
   Encrypt so making regular backups of this folder is ideal.
root@ct-01:~# cd /etc/nginx/sites-enabled/
root@ct-01:/etc/nginx/sites-enabled# sudo nano default 
root@ct-01:/etc/nginx/sites-enabled# rm default 
root@ct-01:/etc/nginx/sites-enabled# sudo nano default
root@ct-01:/etc/nginx/sites-enabled# sudo nginx -t
nginx: [emerg] BIO_new_file("/etc/letsencrypt/live/ct.trigliamarco.com/fullchain.pem") failed (SSL: error:02001002:system library:fopen:No such file or directory:fopen('/etc/letsencrypt/live/ct.trigliamarco.com/fullchain.pem','r') error:2006D080:BIO routines:BIO_new_file:no such file)
nginx: configuration file /etc/nginx/nginx.conf test failed
root@ct-01:/etc/nginx/sites-enabled# 
root@ct-01:/etc/nginx/sites-enabled# cd /etc/letsencrypt/live
-bash: cd: /etc/letsencrypt/live: No such file or directory
root@ct-01:/etc/nginx/sites-enabled# cd /etc/
root@ct-01:/etc# ls
acpi                    group-           mailcap.order            resolvconf
adduser.conf            grub.d           manpath.config           resolv.conf
alternatives            gshadow          mdadm                    rmt
apm                     gshadow-         mime.types               rpc
apparmor                gss              mke2fs.conf              rsyslog.conf
apparmor.d              hdparm.conf      modprobe.d               rsyslog.d
apport                  host.conf        modules                  screenrc
apt                     hostname         modules-load.d           securetty
at.deny                 hosts            mtab                     security
bash.bashrc             hosts.allow      nanorc                   selinux
bash_completion         hosts.deny       network                  services
bash_completion.d       init             NetworkManager           sgml
bindresvport.blacklist  init.d           networks                 shadow
binfmt.d                initramfs-tools  newt                     shadow-
byobu                   inputrc          nginx                    shells
ca-certificates         insserv          nsswitch.conf            skel
ca-certificates.conf    insserv.conf     opt                      sos.conf
calendar                insserv.conf.d   os-release               ssh
cloud                   iproute2         overlayroot.conf         ssl
console-setup           iscsi            overlayroot.local.conf   subgid
cron.d                  issue            pam.conf                 subgid-
cron.daily              issue.net        pam.d                    subuid
cron.hourly             kbd              passwd                   subuid-
cron.monthly            kernel           passwd-                  sudoers
crontab                 kernel-img.conf  perl                     sudoers.d
cron.weekly             ldap             pm                       sysctl.conf
crypttab                ld.so.cache      polkit-1                 sysctl.d
dbus-1                  ld.so.conf       pollinate                systemd
debconf.conf            ld.so.conf.d     popularity-contest.conf  terminfo
debian_version          legal            ppp                      timezone
default                 letsencrypt      profile                  tmpfiles.d
deluser.conf            libaudit.conf    profile.d                ucf.conf
depmod.d                locale.alias     protocols                udev
dhcp                    locale.gen       python                   ufw
dictionaries-common     localtime        python2.7                updatedb.conf
discover.conf.d         logcheck         python3                  update-manager
discover-modprobe.conf  login.defs       python3.5                update-motd.d
dpkg                    logrotate.conf   rc0.d                    update-notifier
emacs                   logrotate.d      rc1.d                    vim
environment             lsb-release      rc2.d                    vtrgb
fonts                   ltrace.conf      rc3.d                    wgetrc
fstab                   lvm              rc4.d                    X11
fuse.conf               machine-id       rc5.d                    xdg
gai.conf                magic            rc6.d                    xml
groff                   magic.mime       rc.local                 zsh_command_not_found
group                   mailcap          rcS.d
root@ct-01:/etc# cd letsencrypt/
root@ct-01:/etc/letsencrypt# ls
accounts
root@ct-01:/etc/letsencrypt# ls -a
.  ..  accounts
root@ct-01:/etc/letsencrypt# cd accounts/
root@ct-01:/etc/letsencrypt/accounts# ls
acme-v01.api.letsencrypt.org
root@ct-01:/etc/letsencrypt/accounts# cd acme-v01.api.letsencrypt.org/
root@ct-01:/etc/letsencrypt/accounts/acme-v01.api.letsencrypt.org# ls
directory
root@ct-01:/etc/letsencrypt/accounts/acme-v01.api.letsencrypt.org# cd ..
root@ct-01:/etc/letsencrypt/accounts# cd ..
root@ct-01:/etc/letsencrypt# cd live
-bash: cd: live: No such file or directory
root@ct-01:/etc/letsencrypt# sudo letsencrypt certonly --standalone









          ┌──────────────────────────────────────────────────────────────────────┐
          │ Please enter in your domain name(s) (comma and/or space separated)   │  
          │ ┌──────────────────────────────────────────────────────────────────┐ │  
          │ │ct.trigliamarco.com                                               │ │  
          │ └──────────────────────────────────────────────────────────────────┘ │  
          ├──────────────────────────────────────────────────────────────────────┤  
          │                     <  OK  >           <Cancel>                      │  
          └──────────────────────────────────────────────────────────────────────┘  
                                                                                    









IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at
   /etc/letsencrypt/live/ct.trigliamarco.com/fullchain.pem. Your cert
   will expire on 2017-01-05. To obtain a new version of the
   certificate in the future, simply run Let's Encrypt again.
 - If you like Let's Encrypt, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

root@ct-01:/etc/letsencrypt# 
root@ct-01:/etc/letsencrypt# sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@ct-01:/etc/letsencrypt# sudo letsencrypt certonly --standalonesudo systemctl start nginx
usage: 
  letsencrypt [SUBCOMMAND] [options] [-d domain] [-d domain] ...

The Let's Encrypt agent can obtain and install HTTPS/TLS/SSL certificates.  By
default, it will attempt to use a webserver both for obtaining and installing
the cert. Major SUBCOMMANDS are:

  (default) run        Obtain & install a cert in your current webserver
  certonly             Obtain cert, but do not install it (aka "auth")
  install              Install a previously obtained cert in a server
  renew                Renew previously obtained certs that are near expiry
  revoke               Revoke a previously obtained certificate
  rollback             Rollback server configuration changes made during install
  config_changes       Show changes made to server config during installation
  plugins              Display information about installed plugins
letsencrypt: error: unrecognized arguments: --standalonesudo systemctl start nginx
root@ct-01:/etc/letsencrypt# sudo systemctl start nginx
root@ct-01:/etc/letsencrypt# sudo letsencrypt renew

Processing /etc/letsencrypt/renewal/ct.trigliamarco.com.conf

The following certs are not due for renewal yet:
  /etc/letsencrypt/live/ct.trigliamarco.com/fullchain.pem (skipped)
No renewals were attempted.
root@ct-01:/etc/letsencrypt# 
root@ct-01:/etc/letsencrypt# sudo crontab -e
no crontab for root - using an empty one

Select an editor.  To change later, run 'select-editor'.
  1. /bin/ed
  2. /bin/nano        <---- easiest
  3. /usr/bin/vim.basic
  4. /usr/bin/vim.tiny

Choose 1-4 [2]: 2
crontab: installing new crontab
root@ct-01:/etc/letsencrypt# sudo shutdown -r now
Connection to 159.203.128.12 closed by remote host.
Connection to 159.203.128.12 closed.
MacBook-Pro:~ marcotriglia$ ssh root@159.203.128.12
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-38-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 packages can be updated.
0 updates are security updates.


Last login: Fri Oct  7 14:45:03 2016 from 72.211.85.80
root@ct-01:~# pm2 status
[PM2] Spawning PM2 daemon with pm2_home=/root/.pm2
[PM2] PM2 Successfully daemonized
┌──────────┬────┬──────┬─────┬────────┬─────────┬────────┬─────┬─────┬──────────┐
│ App name │ id │ mode │ pid │ status │ restart │ uptime │ cpu │ mem │ watching │
└──────────┴────┴──────┴─────┴────────┴─────────┴────────┴─────┴─────┴──────────┘
 Use `pm2 show <id|name>` to get more details about an app
root@ct-01:~# exit
logout

Connection to 159.203.128.12 closed.
MacBook-Pro:~ marcotriglia$ ssh notroot@159.203.128.12
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-38-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 packages can be updated.
0 updates are security updates.


Last login: Thu Oct  6 18:01:51 2016 from 72.211.85.80
notroot@ct-01:~$ ls
hello.js  ipm-quickstart-node
notroot@ct-01:~$ cd ipm-quickstart-node/
notroot@ct-01:~/ipm-quickstart-node$ pm2 start index.js 
[PM2] Spawning PM2 daemon with pm2_home=/home/notroot/.pm2
[PM2] PM2 Successfully daemonized
[PM2] Starting /home/notroot/ipm-quickstart-node/index.js in fork_mode (1 instance)
[PM2] Done.
┌──────────┬────┬──────┬──────┬────────┬─────────┬────────┬─────┬───────────┬──────────┐
│ App name │ id │ mode │ pid  │ status │ restart │ uptime │ cpu │ mem       │ watching │
├──────────┼────┼──────┼──────┼────────┼─────────┼────────┼─────┼───────────┼──────────┤
│ index    │ 0  │ fork │ 1718 │ online │ 0       │ 0s     │ 4%  │ 21.9 MB   │ disabled │
└──────────┴────┴──────┴──────┴────────┴─────────┴────────┴─────┴───────────┴──────────┘
 Use `pm2 show <id|name>` to get more details about an app
notroot@ct-01:~/ipm-quickstart-node$ packet_write_wait: Connection to 159.203.128.12 port 22: Broken pipe
MacBook-Pro:~ marcotriglia$ ssh root@104.236.125.26
The authenticity of host '104.236.125.26 (104.236.125.26)' can't be established.
ECDSA key fingerprint is SHA256:6JcU1O2VNnRi5s1zQxEE7weeRKCS3/XdT8KBG5E3g/o.
Are you sure you want to continue connecting (yes/no)? y
Please type 'yes' or 'no': yes
Warning: Permanently added '104.236.125.26' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-38-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 packages can be updated.
0 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init
-bash: ./init: No such file or directory
root@rave2-01:~# ls
init.sh
root@rave2-01:~# ./init.sh
-bash: ./init.sh: Permission denied
root@rave2-01:~# sudo ./init.sh
sudo: ./init.sh: command not found
root@rave2-01:~# chmod x ./init.sh
chmod: invalid mode: ‘x’
Try 'chmod --help' for more information.
root@rave2-01:~# chmod --help
Usage: chmod [OPTION]... MODE[,MODE]... FILE...
  or:  chmod [OPTION]... OCTAL-MODE FILE...
  or:  chmod [OPTION]... --reference=RFILE FILE...
Change the mode of each FILE to MODE.
With --reference, change the mode of each FILE to that of RFILE.

  -c, --changes          like verbose but report only when a change is made
  -f, --silent, --quiet  suppress most error messages
  -v, --verbose          output a diagnostic for every file processed
      --no-preserve-root  do not treat '/' specially (the default)
      --preserve-root    fail to operate recursively on '/'
      --reference=RFILE  use RFILE's mode instead of MODE values
  -R, --recursive        change files and directories recursively
      --help     display this help and exit
      --version  output version information and exit

Each MODE is of the form '[ugoa]*([-+=]([rwxXst]*|[ugo]))+|[-+=][0-7]+'.

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Full documentation at: <http://www.gnu.org/software/coreutils/chmod>
or available locally via: info '(coreutils) chmod invocation'
root@rave2-01:~# whoami
root
root@rave2-01:~# sudo ./init.sh
sudo: ./init.sh: command not found
root@rave2-01:~# nano init.sh
root@rave2-01:~# chmod 1 init.sh 
root@rave2-01:~# ./init.sh 
Hello World!
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Hello World!
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Hello World!
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Get:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease [95.7 kB]
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Get:5 http://mirrors.digitalocean.com/ubuntu xenial/main Sources [868 kB]            
Get:6 http://mirrors.digitalocean.com/ubuntu xenial/restricted Sources [4,808 B]              
Get:7 http://mirrors.digitalocean.com/ubuntu xenial/universe Sources [7,728 kB]               
Get:8 http://mirrors.digitalocean.com/ubuntu xenial/multiverse Sources [179 kB]               
Get:9 http://mirrors.digitalocean.com/ubuntu xenial-updates/main Sources [194 kB]
Get:10 http://mirrors.digitalocean.com/ubuntu xenial-updates/universe Sources [99.1 kB]
Get:11 http://mirrors.digitalocean.com/ubuntu xenial-updates/multiverse Sources [3,220 B]
Get:12 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 Packages [395 kB]
Get:13 http://mirrors.digitalocean.com/ubuntu xenial-updates/main i386 Packages [390 kB]
Get:14 http://mirrors.digitalocean.com/ubuntu xenial-updates/main Translation-en [150 kB]
Get:15 http://mirrors.digitalocean.com/ubuntu xenial-updates/universe amd64 Packages [335 kB]
Get:16 http://mirrors.digitalocean.com/ubuntu xenial-updates/universe i386 Packages [331 kB]
Get:17 http://mirrors.digitalocean.com/ubuntu xenial-updates/universe Translation-en [116 kB]
Get:18 http://mirrors.digitalocean.com/ubuntu xenial-backports/main Sources [1,464 B]
Get:19 http://mirrors.digitalocean.com/ubuntu xenial-backports/universe Sources [800 B]
Get:20 http://security.ubuntu.com/ubuntu xenial-security/main Sources [42.8 kB]
Get:21 http://security.ubuntu.com/ubuntu xenial-security/universe Sources [10.2 kB]
Get:22 http://security.ubuntu.com/ubuntu xenial-security/multiverse Sources [728 B]
Get:23 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages [152 kB]
Get:24 http://security.ubuntu.com/ubuntu xenial-security/main i386 Packages [148 kB]
Get:25 http://security.ubuntu.com/ubuntu xenial-security/main Translation-en [62.9 kB]
Get:26 http://security.ubuntu.com/ubuntu xenial-security/universe amd64 Packages [44.4 kB]
Get:27 http://security.ubuntu.com/ubuntu xenial-security/universe i386 Packages [44.4 kB]
Fetched 11.5 MB in 3s (3,164 kB/s)             
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
The following packages will be upgraded:
  initramfs-tools initramfs-tools-bin initramfs-tools-core klibc-utils libklibc open-iscsi
6 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 543 kB of archives.
After this operation, 1,024 B of additional disk space will be used.
Get:1 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 open-iscsi amd64 2.0.873+git0.3b4b4500-14ubuntu3.1 [334 kB]
Get:2 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 klibc-utils amd64 2.0.4-8ubuntu1.16.04.2 [107 kB]
Get:3 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 initramfs-tools all 0.122ubuntu8.3 [8,636 B]
Get:4 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 initramfs-tools-core all 0.122ubuntu8.3 [42.6 kB]
Get:5 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 initramfs-tools-bin amd64 0.122ubuntu8.3 [9,130 B]
Get:6 http://mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libklibc amd64 2.0.4-8ubuntu1.16.04.2 [41.3 kB]
Fetched 543 kB in 0s (6,582 kB/s)
Preconfiguring packages ...
(Reading database ... 56546 files and directories currently installed.)
Preparing to unpack .../open-iscsi_2.0.873+git0.3b4b4500-14ubuntu3.1_amd64.deb ...
Unpacking open-iscsi (2.0.873+git0.3b4b4500-14ubuntu3.1) over (2.0.873+git0.3b4b4500-14ubuntu3) ...
Preparing to unpack .../klibc-utils_2.0.4-8ubuntu1.16.04.2_amd64.deb ...
Unpacking klibc-utils (2.0.4-8ubuntu1.16.04.2) over (2.0.4-8ubuntu1.16.04.1) ...
Preparing to unpack .../initramfs-tools_0.122ubuntu8.3_all.deb ...
Unpacking initramfs-tools (0.122ubuntu8.3) over (0.122ubuntu8.1) ...
Preparing to unpack .../initramfs-tools-core_0.122ubuntu8.3_all.deb ...
Unpacking initramfs-tools-core (0.122ubuntu8.3) over (0.122ubuntu8.1) ...
Preparing to unpack .../initramfs-tools-bin_0.122ubuntu8.3_amd64.deb ...
Unpacking initramfs-tools-bin (0.122ubuntu8.3) over (0.122ubuntu8.1) ...
Preparing to unpack .../libklibc_2.0.4-8ubuntu1.16.04.2_amd64.deb ...
Unpacking libklibc (2.0.4-8ubuntu1.16.04.2) over (2.0.4-8ubuntu1.16.04.1) ...
Processing triggers for systemd (229-4ubuntu10) ...
Processing triggers for ureadahead (0.100.0-19) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up open-iscsi (2.0.873+git0.3b4b4500-14ubuntu3.1) ...
Setting up libklibc (2.0.4-8ubuntu1.16.04.2) ...
Setting up klibc-utils (2.0.4-8ubuntu1.16.04.2) ...
Setting up initramfs-tools-bin (0.122ubuntu8.3) ...
Setting up initramfs-tools-core (0.122ubuntu8.3) ...
Setting up initramfs-tools (0.122ubuntu8.3) ...
update-initramfs: deferring update (trigger activated)
Processing triggers for initramfs-tools (0.122ubuntu8.3) ...
update-initramfs: Generating /boot/initrd.img-4.4.0-38-generic
W: mdadm: /etc/mdadm/mdadm.conf defines no arrays.
root@rave2-01:~# sudo apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease
Reading package lists... Done                     
root@rave2-01:~# sudo apt-get upgrade
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Hit:2 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease       
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:2 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease                        
Get:5 https://deb.nodesource.com/node_6.x xenial InRelease [3,914 B]                     
Get:6 https://deb.nodesource.com/node_6.x xenial/main Sources [761 B]
Get:7 https://deb.nodesource.com/node_6.x xenial/main amd64 Packages [964 B]
Get:8 https://deb.nodesource.com/node_6.x xenial/main i386 Packages [966 B]
Fetched 6,605 B in 0s (12.7 kB/s)
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  rlwrap
The following NEW packages will be installed:
  nodejs rlwrap
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 10.2 MB of archives.
After this operation, 50.6 MB of additional disk space will be used.
Do you want to continue? [Y/n] n
Abort.
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  binutils cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5 libalgorithm-diff-perl
  libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan2 libatomic1 libc-dev-bin
  libc6-dev libcc1-0 libcilkrts5 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-5-dev
  libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpx0 libquadmath0 libstdc++-5-dev libtsan0
  libubsan0 linux-libc-dev make manpages-dev
Suggested packages:
  binutils-doc cpp-doc gcc-5-locales debian-keyring g++-multilib g++-5-multilib gcc-5-doc
  libstdc++6-5-dbg gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
  gcc-5-multilib libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan2-dbg
  liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libmpx0-dbg libquadmath0-dbg
  glibc-doc libstdc++-5-doc make-doc
The following NEW packages will be installed:
  binutils build-essential cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan2
  libatomic1 libc-dev-bin libc6-dev libcc1-0 libcilkrts5 libdpkg-perl libfakeroot
  libfile-fcntllock-perl libgcc-5-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpx0
  libquadmath0 libstdc++-5-dev libtsan0 libubsan0 linux-libc-dev make manpages-dev
0 upgraded, 36 newly installed, 0 to remove and 0 not upgraded.
Need to get 38.3 MB of archives.
After this operation, 143 MB of additional disk space will be used.
Do you want to continue? [Y/n] n
Abort.
Initialization successful.
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease                        
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:2 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease    
Hit:3 https://deb.nodesource.com/node_6.x xenial InRelease            
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:5 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  binutils cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5 libalgorithm-diff-perl
  libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan2 libatomic1 libc-dev-bin
  libc6-dev libcc1-0 libcilkrts5 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-5-dev
  libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpx0 libquadmath0 libstdc++-5-dev libtsan0
  libubsan0 linux-libc-dev make manpages-dev rlwrap
Suggested packages:
  binutils-doc cpp-doc gcc-5-locales debian-keyring g++-multilib g++-5-multilib gcc-5-doc
  libstdc++6-5-dbg gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
  gcc-5-multilib libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan2-dbg
  liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libmpx0-dbg libquadmath0-dbg
  glibc-doc libstdc++-5-doc make-doc
The following NEW packages will be installed:
  binutils build-essential cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan2
  libatomic1 libc-dev-bin libc6-dev libcc1-0 libcilkrts5 libdpkg-perl libfakeroot
  libfile-fcntllock-perl libgcc-5-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpx0
  libquadmath0 libstdc++-5-dev libtsan0 libubsan0 linux-libc-dev make manpages-dev nodejs
  rlwrap
0 upgraded, 38 newly installed, 0 to remove and 0 not upgraded.
Need to get 48.5 MB of archives.
After this operation, 194 MB of additional disk space will be used.
Get:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libmpc3 amd64 1.0.3-1 [39.7 kB]
Get:2 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 binutils amd64 2.26.1-1ubuntu1~16.04.3 [2,310 kB]
Get:4 https://deb.nodesource.com/node_6.x xenial/main amd64 nodejs amd64 6.7.0-1nodesource1~xenial1 [10.1 MB]
Get:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libc-dev-bin amd64 2.23-0ubuntu3 [68.7 kB]
Get:5 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 linux-libc-dev amd64 4.4.0-38.57 [838 kB]
Get:6 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libc6-dev amd64 2.23-0ubuntu3 [2,084 kB]
Get:7 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libisl15 amd64 0.16.1-1 [524 kB]
Get:8 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 cpp-5 amd64 5.4.0-6ubuntu1~16.04.2 [7,660 kB]
Get:9 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 cpp amd64 4:5.3.1-1ubuntu1 [27.7 kB]
Get:10 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libcc1-0 amd64 5.4.0-6ubuntu1~16.04.2 [38.8 kB]
Get:11 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libgomp1 amd64 5.4.0-6ubuntu1~16.04.2 [55.1 kB]
Get:12 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libitm1 amd64 5.4.0-6ubuntu1~16.04.2 [27.4 kB]
Get:13 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libatomic1 amd64 5.4.0-6ubuntu1~16.04.2 [8,902 B]
Get:14 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libasan2 amd64 5.4.0-6ubuntu1~16.04.2 [264 kB]
Get:15 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 liblsan0 amd64 5.4.0-6ubuntu1~16.04.2 [105 kB]
Get:16 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libtsan0 amd64 5.4.0-6ubuntu1~16.04.2 [244 kB]
Get:17 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libubsan0 amd64 5.4.0-6ubuntu1~16.04.2 [95.4 kB]
Get:18 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libcilkrts5 amd64 5.4.0-6ubuntu1~16.04.2 [40.0 kB]
Get:19 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libmpx0 amd64 5.4.0-6ubuntu1~16.04.2 [9,762 B]
Get:20 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libquadmath0 amd64 5.4.0-6ubuntu1~16.04.2 [131 kB]
Get:21 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libgcc-5-dev amd64 5.4.0-6ubuntu1~16.04.2 [2,241 kB]
Get:22 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 gcc-5 amd64 5.4.0-6ubuntu1~16.04.2 [8,604 kB]
Get:23 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 gcc amd64 4:5.3.1-1ubuntu1 [5,244 B]
Get:24 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libstdc++-5-dev amd64 5.4.0-6ubuntu1~16.04.2 [1,430 kB]
Get:25 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 g++-5 amd64 5.4.0-6ubuntu1~16.04.2 [8,302 kB]
Get:26 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 g++ amd64 4:5.3.1-1ubuntu1 [1,504 B]
Get:27 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 make amd64 4.1-6 [151 kB]
Get:28 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libdpkg-perl all 1.18.4ubuntu1.1 [195 kB]
Get:29 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 dpkg-dev all 1.18.4ubuntu1.1 [584 kB]
Get:30 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 build-essential amd64 12.1ubuntu2 [4,758 B]
Get:31 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libfakeroot amd64 1.20.2-1ubuntu1 [25.5 kB]
Get:32 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 fakeroot amd64 1.20.2-1ubuntu1 [61.8 kB]
Get:33 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libalgorithm-diff-perl all 1.19.03-1 [47.6 kB]
Get:34 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libalgorithm-diff-xs-perl amd64 0.04-4build1 [11.0 kB]
Get:35 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libalgorithm-merge-perl all 0.08-3 [12.0 kB]
Get:36 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libfile-fcntllock-perl amd64 0.22-3 [32.0 kB]
Get:37 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 manpages-dev all 4.04-2 [2,048 kB]
Get:38 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 rlwrap amd64 0.41-1build1 [74.9 kB]
Fetched 48.5 MB in 2s (18.8 MB/s)
Extracting templates from packages: 100%
Selecting previously unselected package libmpc3:amd64.
(Reading database ... 56546 files and directories currently installed.)
Preparing to unpack .../libmpc3_1.0.3-1_amd64.deb ...
Unpacking libmpc3:amd64 (1.0.3-1) ...
Selecting previously unselected package binutils.
Preparing to unpack .../binutils_2.26.1-1ubuntu1~16.04.3_amd64.deb ...
Unpacking binutils (2.26.1-1ubuntu1~16.04.3) ...
Selecting previously unselected package libc-dev-bin.
Preparing to unpack .../libc-dev-bin_2.23-0ubuntu3_amd64.deb ...
Unpacking libc-dev-bin (2.23-0ubuntu3) ...
Selecting previously unselected package linux-libc-dev:amd64.
Preparing to unpack .../linux-libc-dev_4.4.0-38.57_amd64.deb ...
Unpacking linux-libc-dev:amd64 (4.4.0-38.57) ...
Selecting previously unselected package libc6-dev:amd64.
Preparing to unpack .../libc6-dev_2.23-0ubuntu3_amd64.deb ...
Unpacking libc6-dev:amd64 (2.23-0ubuntu3) ...
Selecting previously unselected package libisl15:amd64.
Preparing to unpack .../libisl15_0.16.1-1_amd64.deb ...
Unpacking libisl15:amd64 (0.16.1-1) ...
Selecting previously unselected package cpp-5.
Preparing to unpack .../cpp-5_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking cpp-5 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package cpp.
Preparing to unpack .../cpp_4%3a5.3.1-1ubuntu1_amd64.deb ...
Unpacking cpp (4:5.3.1-1ubuntu1) ...
Selecting previously unselected package libcc1-0:amd64.
Preparing to unpack .../libcc1-0_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libcc1-0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libgomp1:amd64.
Preparing to unpack .../libgomp1_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libgomp1:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libitm1:amd64.
Preparing to unpack .../libitm1_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libitm1:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libatomic1:amd64.
Preparing to unpack .../libatomic1_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libatomic1:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libasan2:amd64.
Preparing to unpack .../libasan2_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libasan2:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package liblsan0:amd64.
Preparing to unpack .../liblsan0_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking liblsan0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libtsan0:amd64.
Preparing to unpack .../libtsan0_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libtsan0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libubsan0:amd64.
Preparing to unpack .../libubsan0_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libubsan0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libcilkrts5:amd64.
Preparing to unpack .../libcilkrts5_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libcilkrts5:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libmpx0:amd64.
Preparing to unpack .../libmpx0_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libmpx0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libquadmath0:amd64.
Preparing to unpack .../libquadmath0_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libquadmath0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package libgcc-5-dev:amd64.
Preparing to unpack .../libgcc-5-dev_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libgcc-5-dev:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package gcc-5.
Preparing to unpack .../gcc-5_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking gcc-5 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package gcc.
Preparing to unpack .../gcc_4%3a5.3.1-1ubuntu1_amd64.deb ...
Unpacking gcc (4:5.3.1-1ubuntu1) ...
Selecting previously unselected package libstdc++-5-dev:amd64.
Preparing to unpack .../libstdc++-5-dev_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking libstdc++-5-dev:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package g++-5.
Preparing to unpack .../g++-5_5.4.0-6ubuntu1~16.04.2_amd64.deb ...
Unpacking g++-5 (5.4.0-6ubuntu1~16.04.2) ...
Selecting previously unselected package g++.
Preparing to unpack .../g++_4%3a5.3.1-1ubuntu1_amd64.deb ...
Unpacking g++ (4:5.3.1-1ubuntu1) ...
Selecting previously unselected package make.
Preparing to unpack .../archives/make_4.1-6_amd64.deb ...
Unpacking make (4.1-6) ...
Selecting previously unselected package libdpkg-perl.
Preparing to unpack .../libdpkg-perl_1.18.4ubuntu1.1_all.deb ...
Unpacking libdpkg-perl (1.18.4ubuntu1.1) ...
Selecting previously unselected package dpkg-dev.
Preparing to unpack .../dpkg-dev_1.18.4ubuntu1.1_all.deb ...
Unpacking dpkg-dev (1.18.4ubuntu1.1) ...
Selecting previously unselected package build-essential.
Preparing to unpack .../build-essential_12.1ubuntu2_amd64.deb ...
Unpacking build-essential (12.1ubuntu2) ...
Selecting previously unselected package libfakeroot:amd64.
Preparing to unpack .../libfakeroot_1.20.2-1ubuntu1_amd64.deb ...
Unpacking libfakeroot:amd64 (1.20.2-1ubuntu1) ...
Selecting previously unselected package fakeroot.
Preparing to unpack .../fakeroot_1.20.2-1ubuntu1_amd64.deb ...
Unpacking fakeroot (1.20.2-1ubuntu1) ...
Selecting previously unselected package libalgorithm-diff-perl.
Preparing to unpack .../libalgorithm-diff-perl_1.19.03-1_all.deb ...
Unpacking libalgorithm-diff-perl (1.19.03-1) ...
Selecting previously unselected package libalgorithm-diff-xs-perl.
Preparing to unpack .../libalgorithm-diff-xs-perl_0.04-4build1_amd64.deb ...
Unpacking libalgorithm-diff-xs-perl (0.04-4build1) ...
Selecting previously unselected package libalgorithm-merge-perl.
Preparing to unpack .../libalgorithm-merge-perl_0.08-3_all.deb ...
Unpacking libalgorithm-merge-perl (0.08-3) ...
Selecting previously unselected package libfile-fcntllock-perl.
Preparing to unpack .../libfile-fcntllock-perl_0.22-3_amd64.deb ...
Unpacking libfile-fcntllock-perl (0.22-3) ...
Selecting previously unselected package manpages-dev.
Preparing to unpack .../manpages-dev_4.04-2_all.deb ...
Unpacking manpages-dev (4.04-2) ...
Selecting previously unselected package rlwrap.
Preparing to unpack .../rlwrap_0.41-1build1_amd64.deb ...
Unpacking rlwrap (0.41-1build1) ...
Selecting previously unselected package nodejs.
Preparing to unpack .../nodejs_6.7.0-1nodesource1~xenial1_amd64.deb ...
Unpacking nodejs (6.7.0-1nodesource1~xenial1) ...
Processing triggers for libc-bin (2.23-0ubuntu3) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libmpc3:amd64 (1.0.3-1) ...
Setting up binutils (2.26.1-1ubuntu1~16.04.3) ...
Setting up libc-dev-bin (2.23-0ubuntu3) ...
Setting up linux-libc-dev:amd64 (4.4.0-38.57) ...
Setting up libc6-dev:amd64 (2.23-0ubuntu3) ...
Setting up libisl15:amd64 (0.16.1-1) ...
Setting up cpp-5 (5.4.0-6ubuntu1~16.04.2) ...
Setting up cpp (4:5.3.1-1ubuntu1) ...
Setting up libcc1-0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libgomp1:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libitm1:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libatomic1:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libasan2:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up liblsan0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libtsan0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libubsan0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libcilkrts5:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libmpx0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libquadmath0:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up libgcc-5-dev:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up gcc-5 (5.4.0-6ubuntu1~16.04.2) ...
Setting up gcc (4:5.3.1-1ubuntu1) ...
Setting up libstdc++-5-dev:amd64 (5.4.0-6ubuntu1~16.04.2) ...
Setting up g++-5 (5.4.0-6ubuntu1~16.04.2) ...
Setting up g++ (4:5.3.1-1ubuntu1) ...
update-alternatives: using /usr/bin/g++ to provide /usr/bin/c++ (c++) in auto mode
Setting up make (4.1-6) ...
Setting up libdpkg-perl (1.18.4ubuntu1.1) ...
Setting up dpkg-dev (1.18.4ubuntu1.1) ...
Setting up build-essential (12.1ubuntu2) ...
Setting up libfakeroot:amd64 (1.20.2-1ubuntu1) ...
Setting up fakeroot (1.20.2-1ubuntu1) ...
update-alternatives: using /usr/bin/fakeroot-sysv to provide /usr/bin/fakeroot (fakeroot) in auto mode
Setting up libalgorithm-diff-perl (1.19.03-1) ...
Setting up libalgorithm-diff-xs-perl (0.04-4build1) ...
Setting up libalgorithm-merge-perl (0.08-3) ...
Setting up libfile-fcntllock-perl (0.22-3) ...
Setting up manpages-dev (4.04-2) ...
Setting up rlwrap (0.41-1build1) ...
update-alternatives: using /usr/bin/rlwrap to provide /usr/bin/readline-editor (readline-editor) in auto mode
Setting up nodejs (6.7.0-1nodesource1~xenial1) ...
Processing triggers for libc-bin (2.23-0ubuntu3) ...
Initialization successful.
root@rave2-01:~# node -v
v6.7.0
root@rave2-01:~# npm -v
3.10.3
root@rave2-01:~# ./init.sh 
Initializing...
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease                        
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease
^Cading package lists... 12% 
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease                        
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease                        
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease      
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└─┬ pm2@2.0.18 
  ├── amp@0.3.1 
  ├── amp-message@0.1.2 
  ├── ansi-regex@2.0.0 
  ├── ansi-styles@2.2.1 
  ├── anymatch@1.3.0 
  ├── argparse@1.0.7 
  ├── arr-diff@2.0.0 
  ├── arr-flatten@1.0.1 
  ├── array-unique@0.2.1 
  ├── arrify@1.0.1 
  ├── async@1.5.2 
  ├── async-each@1.0.1 
  ├── balanced-match@0.4.2 
  ├── binary-extensions@1.6.0 
  ├── brace-expansion@1.1.6 
  ├── braces@1.8.5 
  ├── buffer-shims@1.0.0 
  ├── chalk@1.1.3 
  ├── charm@0.1.2 
  ├── chokidar@1.6.0 
  ├── cli-table2@0.2.0 
  ├── code-point-at@1.0.0 
  ├── colors@1.1.2 
  ├── commander@2.9.0 
  ├── concat-map@0.0.1 
  ├── core-util-is@1.0.2 
  ├── cron@1.1.0 
  ├── debug@2.2.0 
  ├── escape-regexp@0.0.1 
  ├── escape-string-regexp@1.0.5 
  ├── eventemitter2@1.0.5 
  ├── expand-brackets@0.1.5 
  ├── expand-range@1.8.2 
  ├── extglob@0.3.2 
  ├── fclone@1.0.9 
  ├── filename-regex@2.0.0 
  ├── fill-range@2.2.3 
  ├── for-in@0.1.6 
  ├── for-own@0.1.4 
  ├── fs.realpath@1.0.0 
  ├── gkt@1.0.0 
  ├── glob@7.1.0 
  ├── glob-base@0.3.0 
  ├── glob-parent@2.0.0 
  ├── graceful-fs@4.1.9 
  ├── graceful-readlink@1.0.1 
  ├── has-ansi@2.0.0 
  ├── inflight@1.0.5 
  ├── inherits@2.0.3 
  ├── interpret@1.0.1 
  ├── is-binary-path@1.0.1 
  ├── is-buffer@1.1.4 
  ├── is-dotfile@1.0.2 
  ├── is-equal-shallow@0.1.3 
  ├── is-extendable@0.1.1 
  ├── is-extglob@1.0.0 
  ├── is-fullwidth-code-point@1.0.0 
  ├── is-glob@2.0.1 
  ├── is-number@2.1.0 
  ├── is-posix-bracket@0.1.1 
  ├── is-primitive@2.0.0 
  ├── isarray@1.0.0 
  ├── isobject@2.1.0 
  ├── json-stringify-safe@5.0.1 
  ├── kind-of@3.0.4 
  ├── lazy@1.0.11 
  ├── lodash@3.10.1 
  ├── micromatch@2.3.11 
  ├── minimatch@3.0.3 
  ├── minimist@0.0.8 
  ├── mkdirp@0.5.1 
  ├── moment@2.15.1 
  ├── moment-timezone@0.3.1 
  ├── ms@0.7.1 
  ├── normalize-path@2.0.1 
  ├─┬ nssocket@0.6.0 
  │ └── eventemitter2@0.4.14 
  ├── number-is-nan@1.0.0 
  ├── object.omit@2.0.0 
  ├── once@1.4.0 
  ├── parse-glob@3.0.4 
  ├── path-is-absolute@1.0.0 
  ├── pidusage@1.0.8 
  ├── pm2-axon@3.0.2 
  ├─┬ pm2-axon-rpc@0.4.5 
  │ └── fclone@1.0.8 
  ├── pm2-deploy@0.3.1 
  ├── pm2-multimeter@0.1.2 
  ├── pmx@0.6.8 
  ├── preserve@0.2.0 
  ├── process-nextick-args@1.0.7 
  ├── randomatic@1.1.5 
  ├── readable-stream@2.1.5 
  ├── readdirp@2.1.0 
  ├── rechoir@0.6.2 
  ├── regex-cache@0.4.3 
  ├── repeat-element@1.1.2 
  ├── repeat-string@1.5.4 
  ├── resolve@1.1.7 
  ├── semver@5.3.0 
  ├── set-immediate-shim@1.0.1 
  ├── shelljs@0.7.3 
  ├── source-map@0.5.6 
  ├── source-map-support@0.4.3 
  ├── sprintf-js@1.0.3 
  ├── string-width@1.0.2 
  ├── string_decoder@0.10.31 
  ├── strip-ansi@3.0.1 
  ├── supports-color@2.0.0 
  ├── tv4@1.2.7 
  ├── util-deprecate@1.0.2 
  ├── vizion@0.2.13 
  ├── wrappy@1.0.2 
  └── yamljs@0.2.8 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
Initialization successful.
root@rave2-01:~# pm2 status

                        -------------

   Looking for a complete monitoring and management tool for PM2?
    _                             _        _            _
   | | _____ _   _ _ __ ___   ___| |_ _ __(_) ___ ___  (_) ___
   | |/ / _ \ | | | '_ ` _ \ / _ \ __| '__| |/ __/ __| | |/ _ \
   |   <  __/ |_| | | | | | |  __/ |_| |  | | (__\__ \_| | (_) |
   |_|\_\___|\__, |_| |_| |_|\___|\__|_|  |_|\___|___(_)_|\___/
             |___/

                          Features

                   - Real Time Dashboard
                   - CPU/Memory monitoring
                   - HTTP monitoring
                   - Event notification
                   - Custom value monitoring
                   - Real Time log display

                          Checkout

                   https://keymetrics.io/

                        -------------

[PM2] Spawning PM2 daemon with pm2_home=/root/.pm2
[PM2] PM2 Successfully daemonized
┌──────────┬────┬──────┬─────┬────────┬─────────┬────────┬─────┬─────┬──────────┐
│ App name │ id │ mode │ pid │ status │ restart │ uptime │ cpu │ mem │ watching │
└──────────┴────┴──────┴─────┴────────┴─────────┴────────┴─────┴─────┴──────────┘
 Use `pm2 show <id|name>` to get more details about an app
root@rave2-01:~# pm2

  Usage: pm2 [cmd] app


  Commands:

    start [options] <file|json|stdin|app_name|pm_id...>             start and daemonize an app
    docker:gen [options] <file|config>                              generate Dockerfile in current folder
    docker:dev [options] <file|config>                              wrap application into Docker container
    docker:dist [options] <file|config> <image_name>                wrap application into Docker container
    deploy <file|environment>                                       deploy your json
    startOrRestart <json>                                           start or restart JSON file
    startOrReload <json>                                            start or gracefully reload JSON file
    startOrGracefulReload <json>                                    start or gracefully reload JSON file
    stop [options] <id|name|all|json|stdin...>                      stop a process (to start it again, do pm2 restart <app>)
    restart [options] <id|name|all|json|stdin...>                   restart a process
    scale <app_name> <number>                                       scale up/down a process in cluster mode depending on total_number param
    snapshot                                                        snapshot PM2 memory
    profile <command>                                               profile CPU
    reload <name|all>                                               reload processes (note that its for app using HTTP/HTTPS)
    gracefulReload <name|all>                                       gracefully reload a process. Send a "shutdown" message to close all connections.
    id <name>                                                       get process id by name
    delete <name|id|script|all|json|stdin...>                       stop and delete a process from pm2 process list
    sendSignal <signal> <pm2_id|name>                               send a system signal to the target process
    ping                                                            ping pm2 daemon - if not up it will launch it
    updatePM2                                                       update in-memory PM2 with local PM2
    update                                                          (alias) update in-memory PM2 with local PM2
    install|module:install <module|git:/>                           install or update a module and run it forever
    module:update <module|git:/>                                    update a module and run it forever
    module:generate [app_name]                                      Generate a sample module in current folder
    uninstall|module:uninstall <module>                             stop and uninstall a module
    publish|module:publish                                          Publish the module you are currently on
    set <key> <value>                                               sets the specified config <key> <value>
    multiset <value>                                                multiset eg "key1 val1 key2 val2
    get [key]                                                       get value for <key>
    conf [key] [value]                                              get / set module config values
    config <key> [value]                                            get / set module config values
    unset <key>                                                     clears the specified config <key>
    link|interact [secret_key|command] [public_key] [machine_name]  linking action to keymetrics.io - command can be stop|info|delete|restart
    web                                                             launch a health API on 0.0.0.0:9615
    dump|save                                                       dump all processes for resurrecting them later
    resurrect                                                       resurrect previously dumped processes
    startup [platform]                                              auto resurrect process at startup. [platform] = ubuntu, centos, redhat, gentoo, systemd, darwin, amazon
    logrotate                                                       copy default logrotate configuration
    generate                                                        generate an ecosystem.json configuration file
    ecosystem                                                       generate an ecosystem.json configuration file
    reset <name|id|all>                                             reset counters for process
    describe <id>                                                   describe all parameters of a process id
    desc <id>                                                       (alias) describe all parameters of a process id
    info <id>                                                       (alias) describe all parameters of a process id
    show <id>                                                       (alias) describe all parameters of a process id
    list|ls [options]                                               list all processes
    l                                                               (alias) list all processes
    status                                                          (alias) list all processes
    jlist                                                           list all processes in JSON format
    prettylist                                                      print json in a prettified JSON
    monit|m                                                         launch termcaps monitoring
    flush                                                           flush logs
    reloadLogs                                                      reload all logs
    logs [options] [id|name]                                        stream logs file. Default stream all logs
    kill                                                            kill daemon
    pull <name> [commit_id]                                         updates repository for a given app
    forward <name>                                                  updates repository to the next commit for a given app
    backward <name>                                                 downgrades repository to the previous commit for a given app
    gc                                                              force PM2 to trigger garbage collection
    deepUpdate                                                      performs a deep update of PM2
    *                                                             

  Options:

    -h, --help                           output usage information
    -V, --version                        output the version number
    -v --version                         get version
    -s --silent                          hide all messages
    -m --mini-list                       display a compacted list without formatting
    -f --force                           force actions
    -n --name <name>                     set a <name> for script
    -i --instances <number>              launch [number] instances (for networked app)(load balanced)
    -l --log [path]                      specify entire log file (error and out are both included)
    -o --output <path>                   specify out log file
    -e --error <path>                    specify error log file
    -p --pid <pid>                       specify pid file
    -k --kill-timeout <delay>            delay before sending final SIGKILL signal to process
    --listen-timeout <delay>             listen timeout on application reload
    --max-memory-restart <memory>        specify max memory amount used to autorestart (in megaoctets)
    --restart-delay <delay>              specify a delay between restarts (in milliseconds)
    --env <environment_name>             specify environment to get specific env variables (for JSON declaration)
    -x --execute-command                 execute a program using fork system
    --max-restarts [count]               only restart the script COUNT times
    -u --user <username>                 define user when generating startup script
    --hp <home path>                     define home path when generating startup script
    -c --cron <cron_pattern>             restart a running process based on a cron pattern
    -w --write                           write configuration in local folder
    --interpreter <interpreter>          the interpreter pm2 should use for executing app (bash, python...)
    --interpreter-args <arguments>       interpret options (alias of --node-args)
    --log-date-format <momentjs format>  add custom prefix timestamp to logs
    --no-daemon                          run pm2 daemon in the foreground if it doesn't exist already
    --skip-env                           do not refresh environmnent on restart/reload
    --source-map-support                 force source map support
    --only <application-name>            with json declaration, allow to only act on one application
    --disable-source-map-support         force source map support
    --merge-logs                         merge logs from different instances but keep error and out separated
    --watch [paths]                      watch application folder for changes
    --ignore-watch <folders|files>       folder/files to be ignored watching, chould be a specific name or regex - e.g. --ignore-watch="test node_modules "some scripts""
    --node-args <node_args>              space delimited arguments to pass to node in cluster mode - e.g. --node-args="--debug=7001 --trace-deprecation"
    --no-color                           skip colors
    --no-vizion                          start an app without vizion feature (versioning control)
    --no-autorestart                     start an app without automatic restart
    --no-treekill                        Only kill the main process, not detached children
    --no-pmx                             start an app without pmx
    --no-automation                      start an app without pmx

  Basic Examples:

    Start an app using all CPUs available + set a name :
    $ pm2 start app.js -i 0 --name "api"

    Restart the previous app launched, by name :
    $ pm2 restart api

    Stop the app :
    $ pm2 stop api

    Restart the app that is stopped :
    $ pm2 restart api

    Remove the app from the process list :
    $ pm2 delete api

    Kill daemon pm2 :
    $ pm2 kill

    Update pm2 :
    $ npm install pm2@latest -g ; pm2 update

    More examples in https://github.com/Unitech/pm2#usagefeatures

  Deployment help:

    $ pm2 deploy help


root@rave2-01:~# nano init.sh
root@rave2-01:~# nano init.sh
root@rave2-01:~# nano init.sh
root@rave2-01:~# ls
init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:2 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                            
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease                    
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease        
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease    
Fetched 94.5 kB in 0s (132 kB/s)
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                            
Hit:3 https://deb.nodesource.com/node_6.x xenial InRelease                                    
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease          
Hit:5 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease        
Fetched 94.5 kB in 0s (174 kB/s)                               
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:3 https://deb.nodesource.com/node_6.x xenial InRelease                          
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease          
Hit:5 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease        
Fetched 94.5 kB in 0s (122 kB/s)                              
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
The following additional packages will be installed:
  dialog fontconfig-config fonts-dejavu-core libfontconfig1 libgd3 libjbig0 libjpeg-turbo8
  libjpeg8 libpython-stdlib libpython2.7-minimal libpython2.7-stdlib libtiff5 libvpx3 libxpm4
  libxslt1.1 nginx-common nginx-core python python-acme python-cffi-backend python-chardet
  python-configargparse python-configobj python-cryptography python-dialog python-enum34
  python-funcsigs python-idna python-ipaddress python-letsencrypt python-minimal python-mock
  python-ndg-httpsclient python-openssl python-parsedatetime python-pbr python-pkg-resources
  python-psutil python-pyasn1 python-pyicu python-requests python-rfc3339 python-six
  python-tz python-urllib3 python-zope.component python-zope.event python-zope.hookable
  python-zope.interface python2.7 python2.7-minimal
Suggested packages:
  python-letsencrypt-apache python-letsencrypt-doc libgd-tools fcgiwrap nginx-doc ssl-cert
  python-doc python-tk python-configobj-doc python-cryptography-doc
  python-cryptography-vectors python-enum34-doc python-funcsigs-doc python-mock-doc
  python-openssl-doc python-openssl-dbg python-setuptools python-psutil-doc doc-base
  python-ntlm python2.7-doc binfmt-support
The following NEW packages will be installed:
  dialog fontconfig-config fonts-dejavu-core letsencrypt libfontconfig1 libgd3 libjbig0
  libjpeg-turbo8 libjpeg8 libpython-stdlib libpython2.7-minimal libpython2.7-stdlib libtiff5
  libvpx3 libxpm4 libxslt1.1 nginx nginx-common nginx-core python python-acme
  python-cffi-backend python-chardet python-configargparse python-configobj
  python-cryptography python-dialog python-enum34 python-funcsigs python-idna
  python-ipaddress python-letsencrypt python-minimal python-mock python-ndg-httpsclient
  python-openssl python-parsedatetime python-pbr python-pkg-resources python-psutil
  python-pyasn1 python-pyicu python-requests python-rfc3339 python-six python-tz
  python-urllib3 python-zope.component python-zope.event python-zope.hookable
  python-zope.interface python2.7 python2.7-minimal
0 upgraded, 53 newly installed, 0 to remove and 0 not upgraded.
Need to get 8,812 kB of archives.
After this operation, 37.3 MB of additional disk space will be used.
Get:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libjpeg-turbo8 amd64 1.4.2-0ubuntu3 [111 kB]
Get:2 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libxpm4 amd64 1:3.5.11-1 [33.1 kB]
Get:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libpython2.7-minimal amd64 2.7.12-1~16.04 [339 kB]
Get:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 python2.7-minimal amd64 2.7.12-1~16.04 [1,294 kB]
Get:5 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-minimal amd64 2.7.11-1 [28.2 kB]
Get:6 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libpython2.7-stdlib amd64 2.7.12-1~16.04 [1,877 kB]
Get:7 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 python2.7 amd64 2.7.12-1~16.04 [224 kB]
Get:8 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libpython-stdlib amd64 2.7.11-1 [7,656 B]
Get:9 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python amd64 2.7.11-1 [137 kB]
Get:10 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libjbig0 amd64 2.1-3.1 [26.6 kB]
Get:11 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 dialog amd64 1.3-20160209-1 [215 kB]
Get:12 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 fonts-dejavu-core all 2.35-1 [1,039 kB]
Get:13 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 fontconfig-config all 2.11.94-0ubuntu1.1 [49.9 kB]
Get:14 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-cffi-backend amd64 1.5.2-1ubuntu1 [58.1 kB]
Get:15 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-enum34 all 1.1.2-1 [35.8 kB]
Get:16 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-idna all 2.0-3 [35.1 kB]
Get:17 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-ipaddress all 1.0.16-1 [18.0 kB]
Get:18 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pkg-resources all 20.7.0-1 [108 kB]
Get:19 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pyasn1 all 0.1.9-1 [45.1 kB]
Get:20 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-six all 1.10.0-3 [10.9 kB]
Get:21 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-cryptography amd64 1.2.3-1 [198 kB]
Get:22 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-openssl all 0.15.1-2build1 [84.1 kB]
Get:23 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-funcsigs all 0.4-2 [12.6 kB]
Get:24 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pbr all 1.8.0-4ubuntu1 [46.6 kB]
Get:25 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-mock all 1.3.0-2.1ubuntu1 [46.5 kB]
Get:26 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-ndg-httpsclient all 0.4.0-3 [25.1 kB]
Get:27 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 python-urllib3 all 1.13.1-2ubuntu0.16.04.1 [57.2 kB]
Get:28 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-chardet all 2.3.0-2 [96.3 kB]
Get:29 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-requests all 2.9.1-3 [55.6 kB]
Get:30 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-tz all 2014.10~dfsg1-0ubuntu2 [31.5 kB]
Get:31 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-rfc3339 all 1.0-4 [6,290 B]
Get:32 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-acme all 0.4.1-1 [57.0 kB]
Get:33 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-configargparse all 0.10.0-2 [20.2 kB]
Get:34 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-configobj all 5.0.6-2 [34.2 kB]
Get:35 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-dialog amd64 3.3.0-2 [65.4 kB]
Get:36 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-parsedatetime all 1.4-1 [37.6 kB]
Get:37 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-psutil amd64 3.4.2-1 [55.2 kB]
Get:38 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-zope.event all 4.2.0-1 [7,412 B]
Get:39 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-zope.interface amd64 4.1.3-1build1 [81.0 kB]
Get:40 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-zope.hookable amd64 4.0.4-4build2 [9,172 B]
Get:41 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-zope.component all 4.2.2-1 [38.5 kB]
Get:42 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 python-letsencrypt all 0.4.1-1 [129 kB]
Get:43 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/universe amd64 letsencrypt all 0.4.1-1 [10.9 kB]
Get:44 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libfontconfig1 amd64 2.11.94-0ubuntu1.1 [131 kB]
Get:45 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libjpeg8 amd64 8c-2ubuntu8 [2,194 B]
Get:46 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libtiff5 amd64 4.0.6-1 [144 kB]
Get:47 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libvpx3 amd64 1.5.0-2ubuntu1 [732 kB]
Get:48 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 libgd3 amd64 2.1.1-4ubuntu0.16.04.3 [125 kB]
Get:49 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 libxslt1.1 amd64 1.1.28-2.1 [145 kB]
Get:50 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 nginx-common all 1.10.0-0ubuntu0.16.04.2 [25.6 kB]
Get:51 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 nginx-core amd64 1.10.0-0ubuntu0.16.04.2 [428 kB]
Get:52 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates/main amd64 nginx all 1.10.0-0ubuntu0.16.04.2 [3,498 B]
Get:53 http://nyc2.mirrors.digitalocean.com/ubuntu xenial/main amd64 python-pyicu amd64 1.9.2-2build1 [179 kB]
Fetched 8,812 kB in 3s (2,354 kB/s)
Extracting templates from packages: 100%
Selecting previously unselected package libjpeg-turbo8:amd64.
(Reading database ... 65380 files and directories currently installed.)
Preparing to unpack .../libjpeg-turbo8_1.4.2-0ubuntu3_amd64.deb ...
Unpacking libjpeg-turbo8:amd64 (1.4.2-0ubuntu3) ...
Selecting previously unselected package libxpm4:amd64.
Preparing to unpack .../libxpm4_1%3a3.5.11-1_amd64.deb ...
Unpacking libxpm4:amd64 (1:3.5.11-1) ...
Selecting previously unselected package libpython2.7-minimal:amd64.
Preparing to unpack .../libpython2.7-minimal_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython2.7-minimal:amd64 (2.7.12-1~16.04) ...
Selecting previously unselected package python2.7-minimal.
Preparing to unpack .../python2.7-minimal_2.7.12-1~16.04_amd64.deb ...
Unpacking python2.7-minimal (2.7.12-1~16.04) ...
Selecting previously unselected package python-minimal.
Preparing to unpack .../python-minimal_2.7.11-1_amd64.deb ...
Unpacking python-minimal (2.7.11-1) ...
Selecting previously unselected package libpython2.7-stdlib:amd64.
Preparing to unpack .../libpython2.7-stdlib_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython2.7-stdlib:amd64 (2.7.12-1~16.04) ...
Selecting previously unselected package python2.7.
Preparing to unpack .../python2.7_2.7.12-1~16.04_amd64.deb ...
Unpacking python2.7 (2.7.12-1~16.04) ...
Selecting previously unselected package libpython-stdlib:amd64.
Preparing to unpack .../libpython-stdlib_2.7.11-1_amd64.deb ...
Unpacking libpython-stdlib:amd64 (2.7.11-1) ...
Processing triggers for libc-bin (2.23-0ubuntu3) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for mime-support (3.59ubuntu1) ...
Setting up libpython2.7-minimal:amd64 (2.7.12-1~16.04) ...
Setting up python2.7-minimal (2.7.12-1~16.04) ...
Linking and byte-compiling packages for runtime python2.7...
Setting up python-minimal (2.7.11-1) ...
Selecting previously unselected package python.
(Reading database ... 66137 files and directories currently installed.)
Preparing to unpack .../python_2.7.11-1_amd64.deb ...
Unpacking python (2.7.11-1) ...
Selecting previously unselected package libjbig0:amd64.
Preparing to unpack .../libjbig0_2.1-3.1_amd64.deb ...
Unpacking libjbig0:amd64 (2.1-3.1) ...
Selecting previously unselected package dialog.
Preparing to unpack .../dialog_1.3-20160209-1_amd64.deb ...
Unpacking dialog (1.3-20160209-1) ...
Selecting previously unselected package fonts-dejavu-core.
Preparing to unpack .../fonts-dejavu-core_2.35-1_all.deb ...
Unpacking fonts-dejavu-core (2.35-1) ...
Selecting previously unselected package fontconfig-config.
Preparing to unpack .../fontconfig-config_2.11.94-0ubuntu1.1_all.deb ...
Unpacking fontconfig-config (2.11.94-0ubuntu1.1) ...
Selecting previously unselected package python-cffi-backend.
Preparing to unpack .../python-cffi-backend_1.5.2-1ubuntu1_amd64.deb ...
Unpacking python-cffi-backend (1.5.2-1ubuntu1) ...
Selecting previously unselected package python-enum34.
Preparing to unpack .../python-enum34_1.1.2-1_all.deb ...
Unpacking python-enum34 (1.1.2-1) ...
Selecting previously unselected package python-idna.
Preparing to unpack .../python-idna_2.0-3_all.deb ...
Unpacking python-idna (2.0-3) ...
Selecting previously unselected package python-ipaddress.
Preparing to unpack .../python-ipaddress_1.0.16-1_all.deb ...
Unpacking python-ipaddress (1.0.16-1) ...
Selecting previously unselected package python-pkg-resources.
Preparing to unpack .../python-pkg-resources_20.7.0-1_all.deb ...
Unpacking python-pkg-resources (20.7.0-1) ...
Selecting previously unselected package python-pyasn1.
Preparing to unpack .../python-pyasn1_0.1.9-1_all.deb ...
Unpacking python-pyasn1 (0.1.9-1) ...
Selecting previously unselected package python-six.
Preparing to unpack .../python-six_1.10.0-3_all.deb ...
Unpacking python-six (1.10.0-3) ...
Selecting previously unselected package python-cryptography.
Preparing to unpack .../python-cryptography_1.2.3-1_amd64.deb ...
Unpacking python-cryptography (1.2.3-1) ...
Selecting previously unselected package python-openssl.
Preparing to unpack .../python-openssl_0.15.1-2build1_all.deb ...
Unpacking python-openssl (0.15.1-2build1) ...
Selecting previously unselected package python-funcsigs.
Preparing to unpack .../python-funcsigs_0.4-2_all.deb ...
Unpacking python-funcsigs (0.4-2) ...
Selecting previously unselected package python-pbr.
Preparing to unpack .../python-pbr_1.8.0-4ubuntu1_all.deb ...
Unpacking python-pbr (1.8.0-4ubuntu1) ...
Selecting previously unselected package python-mock.
Preparing to unpack .../python-mock_1.3.0-2.1ubuntu1_all.deb ...
Unpacking python-mock (1.3.0-2.1ubuntu1) ...
Selecting previously unselected package python-ndg-httpsclient.
Preparing to unpack .../python-ndg-httpsclient_0.4.0-3_all.deb ...
Unpacking python-ndg-httpsclient (0.4.0-3) ...
Selecting previously unselected package python-urllib3.
Preparing to unpack .../python-urllib3_1.13.1-2ubuntu0.16.04.1_all.deb ...
Unpacking python-urllib3 (1.13.1-2ubuntu0.16.04.1) ...
Selecting previously unselected package python-chardet.
Preparing to unpack .../python-chardet_2.3.0-2_all.deb ...
Unpacking python-chardet (2.3.0-2) ...
Selecting previously unselected package python-requests.
Preparing to unpack .../python-requests_2.9.1-3_all.deb ...
Unpacking python-requests (2.9.1-3) ...
Selecting previously unselected package python-tz.
Preparing to unpack .../python-tz_2014.10~dfsg1-0ubuntu2_all.deb ...
Unpacking python-tz (2014.10~dfsg1-0ubuntu2) ...
Selecting previously unselected package python-rfc3339.
Preparing to unpack .../python-rfc3339_1.0-4_all.deb ...
Unpacking python-rfc3339 (1.0-4) ...
Selecting previously unselected package python-acme.
Preparing to unpack .../python-acme_0.4.1-1_all.deb ...
Unpacking python-acme (0.4.1-1) ...
Selecting previously unselected package python-configargparse.
Preparing to unpack .../python-configargparse_0.10.0-2_all.deb ...
Unpacking python-configargparse (0.10.0-2) ...
Selecting previously unselected package python-configobj.
Preparing to unpack .../python-configobj_5.0.6-2_all.deb ...
Unpacking python-configobj (5.0.6-2) ...
Selecting previously unselected package python-dialog.
Preparing to unpack .../python-dialog_3.3.0-2_amd64.deb ...
Unpacking python-dialog (3.3.0-2) ...
Selecting previously unselected package python-parsedatetime.
Preparing to unpack .../python-parsedatetime_1.4-1_all.deb ...
Unpacking python-parsedatetime (1.4-1) ...
Selecting previously unselected package python-psutil.
Preparing to unpack .../python-psutil_3.4.2-1_amd64.deb ...
Unpacking python-psutil (3.4.2-1) ...
Selecting previously unselected package python-zope.event.
Preparing to unpack .../python-zope.event_4.2.0-1_all.deb ...
Unpacking python-zope.event (4.2.0-1) ...
Selecting previously unselected package python-zope.interface.
Preparing to unpack .../python-zope.interface_4.1.3-1build1_amd64.deb ...
Unpacking python-zope.interface (4.1.3-1build1) ...
Selecting previously unselected package python-zope.hookable.
Preparing to unpack .../python-zope.hookable_4.0.4-4build2_amd64.deb ...
Unpacking python-zope.hookable (4.0.4-4build2) ...
Selecting previously unselected package python-zope.component.
Preparing to unpack .../python-zope.component_4.2.2-1_all.deb ...
Unpacking python-zope.component (4.2.2-1) ...
Selecting previously unselected package python-letsencrypt.
Preparing to unpack .../python-letsencrypt_0.4.1-1_all.deb ...
Unpacking python-letsencrypt (0.4.1-1) ...
Selecting previously unselected package letsencrypt.
Preparing to unpack .../letsencrypt_0.4.1-1_all.deb ...
Unpacking letsencrypt (0.4.1-1) ...
Selecting previously unselected package libfontconfig1:amd64.
Preparing to unpack .../libfontconfig1_2.11.94-0ubuntu1.1_amd64.deb ...
Unpacking libfontconfig1:amd64 (2.11.94-0ubuntu1.1) ...
Selecting previously unselected package libjpeg8:amd64.
Preparing to unpack .../libjpeg8_8c-2ubuntu8_amd64.deb ...
Unpacking libjpeg8:amd64 (8c-2ubuntu8) ...
Selecting previously unselected package libtiff5:amd64.
Preparing to unpack .../libtiff5_4.0.6-1_amd64.deb ...
Unpacking libtiff5:amd64 (4.0.6-1) ...
Selecting previously unselected package libvpx3:amd64.
Preparing to unpack .../libvpx3_1.5.0-2ubuntu1_amd64.deb ...
Unpacking libvpx3:amd64 (1.5.0-2ubuntu1) ...
Selecting previously unselected package libgd3:amd64.
Preparing to unpack .../libgd3_2.1.1-4ubuntu0.16.04.3_amd64.deb ...
Unpacking libgd3:amd64 (2.1.1-4ubuntu0.16.04.3) ...
Selecting previously unselected package libxslt1.1:amd64.
Preparing to unpack .../libxslt1.1_1.1.28-2.1_amd64.deb ...
Unpacking libxslt1.1:amd64 (1.1.28-2.1) ...
Selecting previously unselected package nginx-common.
Preparing to unpack .../nginx-common_1.10.0-0ubuntu0.16.04.2_all.deb ...
Unpacking nginx-common (1.10.0-0ubuntu0.16.04.2) ...
Selecting previously unselected package nginx-core.
Preparing to unpack .../nginx-core_1.10.0-0ubuntu0.16.04.2_amd64.deb ...
Unpacking nginx-core (1.10.0-0ubuntu0.16.04.2) ...
Selecting previously unselected package nginx.
Preparing to unpack .../nginx_1.10.0-0ubuntu0.16.04.2_all.deb ...
Unpacking nginx (1.10.0-0ubuntu0.16.04.2) ...
Selecting previously unselected package python-pyicu.
Preparing to unpack .../python-pyicu_1.9.2-2build1_amd64.deb ...
Unpacking python-pyicu (1.9.2-2build1) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for libc-bin (2.23-0ubuntu3) ...
Processing triggers for ureadahead (0.100.0-19) ...
Processing triggers for ufw (0.35-0ubuntu2) ...
Processing triggers for systemd (229-4ubuntu10) ...
Setting up libjpeg-turbo8:amd64 (1.4.2-0ubuntu3) ...
Setting up libxpm4:amd64 (1:3.5.11-1) ...
Setting up libpython2.7-stdlib:amd64 (2.7.12-1~16.04) ...
Setting up python2.7 (2.7.12-1~16.04) ...
Setting up libpython-stdlib:amd64 (2.7.11-1) ...
Setting up python (2.7.11-1) ...
Setting up libjbig0:amd64 (2.1-3.1) ...
Setting up dialog (1.3-20160209-1) ...
Setting up fonts-dejavu-core (2.35-1) ...
Setting up fontconfig-config (2.11.94-0ubuntu1.1) ...
Setting up python-cffi-backend (1.5.2-1ubuntu1) ...
Setting up python-enum34 (1.1.2-1) ...
Setting up python-idna (2.0-3) ...
Setting up python-ipaddress (1.0.16-1) ...
Setting up python-pkg-resources (20.7.0-1) ...
Setting up python-pyasn1 (0.1.9-1) ...
Setting up python-six (1.10.0-3) ...
Setting up python-cryptography (1.2.3-1) ...
Setting up python-openssl (0.15.1-2build1) ...
Setting up python-funcsigs (0.4-2) ...
Setting up python-pbr (1.8.0-4ubuntu1) ...
update-alternatives: using /usr/bin/python2-pbr to provide /usr/bin/pbr (pbr) in auto mode
Setting up python-mock (1.3.0-2.1ubuntu1) ...
Setting up python-ndg-httpsclient (0.4.0-3) ...
Setting up python-urllib3 (1.13.1-2ubuntu0.16.04.1) ...
Setting up python-chardet (2.3.0-2) ...
Setting up python-requests (2.9.1-3) ...
Setting up python-tz (2014.10~dfsg1-0ubuntu2) ...
Setting up python-rfc3339 (1.0-4) ...
Setting up python-acme (0.4.1-1) ...
Setting up python-configargparse (0.10.0-2) ...
Setting up python-configobj (5.0.6-2) ...
Setting up python-dialog (3.3.0-2) ...
Setting up python-parsedatetime (1.4-1) ...
Setting up python-psutil (3.4.2-1) ...
Setting up python-zope.event (4.2.0-1) ...
Setting up python-zope.interface (4.1.3-1build1) ...
Setting up python-zope.hookable (4.0.4-4build2) ...
Setting up python-zope.component (4.2.2-1) ...
Setting up python-letsencrypt (0.4.1-1) ...
Setting up letsencrypt (0.4.1-1) ...
Setting up libfontconfig1:amd64 (2.11.94-0ubuntu1.1) ...
Setting up libjpeg8:amd64 (8c-2ubuntu8) ...
Setting up libtiff5:amd64 (4.0.6-1) ...
Setting up libvpx3:amd64 (1.5.0-2ubuntu1) ...
Setting up libgd3:amd64 (2.1.1-4ubuntu0.16.04.3) ...
Setting up libxslt1.1:amd64 (1.1.28-2.1) ...
Setting up nginx-common (1.10.0-0ubuntu0.16.04.2) ...
Setting up nginx-core (1.10.0-0ubuntu0.16.04.2) ...
Setting up nginx (1.10.0-0ubuntu0.16.04.2) ...
Setting up python-pyicu (1.9.2-2build1) ...
Processing triggers for libc-bin (2.23-0ubuntu3) ...
Processing triggers for systemd (229-4ubuntu10) ...
Processing triggers for ureadahead (0.100.0-19) ...
Processing triggers for ufw (0.35-0ubuntu2) ...
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└── pm2@2.0.18 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
Cloning into 'ubuntu-node-init'...
The authenticity of host 'github.com (192.30.253.112)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? no 
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
rm: cannot remove 'ubuntu-node-init.git': No such file or directory
Initialization successful.
root@rave2-01:~# nano init.sh
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Fetched 94.5 kB in 0s (147 kB/s)
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease    
Fetched 94.5 kB in 0s (140 kB/s)
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease                
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease              
Hit:4 https://deb.nodesource.com/node_6.x xenial InRelease                               
Get:5 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Fetched 94.5 kB in 0s (206 kB/s)                               
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
letsencrypt is already the newest version (0.4.1-1).
nginx is already the newest version (1.10.0-0ubuntu0.16.04.2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└── pm2@2.0.18 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
Cloning into 'ubuntu-node-init'...
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
Checking connectivity... done.
rm: cannot remove 'ubuntu-node-init.git': No such file or directory
Initialization successful.
root@rave2-01:~# ls
init.sh  ubuntu-node-init
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:2 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                         
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease
Fetched 94.5 kB in 0s (112 kB/s)
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:2 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                         
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease
Fetched 94.5 kB in 0s (176 kB/s)
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                            
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease                    
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease        
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease    
Fetched 94.5 kB in 0s (146 kB/s)                              
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
letsencrypt is already the newest version (0.4.1-1).
nginx is already the newest version (1.10.0-0ubuntu0.16.04.2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└── pm2@2.0.18 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
fatal: destination path 'ubuntu-node-init' already exists and is not an empty directory.
Initialization successful.
root@rave2-01:~# ls
init.sh
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:2 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                         
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease
Fetched 94.5 kB in 0s (169 kB/s)
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Fetched 94.5 kB in 0s (109 kB/s)
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:2 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease
Fetched 94.5 kB in 0s (176 kB/s)
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
letsencrypt is already the newest version (0.4.1-1).
nginx is already the newest version (1.10.0-0ubuntu0.16.04.2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└── pm2@2.0.18 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
Cloning into 'ubuntu-node-init'...
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (6/6), done.
Checking connectivity... done.
mv: cannot stat '/ubuntu-node-init/hello.js': No such file or directory
Initialization successful.
root@rave2-01:~# ls
init.sh
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease                    
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease                  
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease    
Fetched 94.5 kB in 0s (148 kB/s)                              
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Fetched 94.5 kB in 0s (209 kB/s)                               
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Fetched 94.5 kB in 0s (213 kB/s)                               
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
letsencrypt is already the newest version (0.4.1-1).
nginx is already the newest version (1.10.0-0ubuntu0.16.04.2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└── pm2@2.0.18 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
Cloning into 'ubuntu-node-init'...
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (6/6), done.
Checking connectivity... done.
mv: cannot stat '/ubuntu-node-init/hello.js': No such file or directory
Initialization successful.
root@rave2-01:~# ls
init.sh  ubuntu-node-init
root@rave2-01:~# mv ubuntu-node-init/hello.js hello.js
root@rave2-01:~# ls
hello.js  init.sh  ubuntu-node-init
root@rave2-01:~# nano init.s
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Fetched 94.5 kB in 0s (179 kB/s)                               
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Fetched 94.5 kB in 0s (211 kB/s)                               
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease          
Hit:4 https://deb.nodesource.com/node_6.x xenial InRelease                          
Hit:5 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease        
Fetched 94.5 kB in 0s (167 kB/s)                               
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
letsencrypt is already the newest version (0.4.1-1).
nginx is already the newest version (1.10.0-0ubuntu0.16.04.2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└── pm2@2.0.18 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
fatal: destination path 'ubuntu-node-init' already exists and is not an empty directory.
mv: cannot stat 'ubuntu-node-init/hello.js': No such file or directory
Initialization successful.
root@rave2-01:~# mv ubuntu-node-init/hello.js hello.js
mv: cannot stat 'ubuntu-node-init/hello.js': No such file or directory
root@rave2-01:~# ls
hello.js  init.sh
root@rave2-01:~# rm hello.js 
root@rave2-01:~# nano init.sh
root@rave2-01:~# ./init.sh 
Initializing...
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:1 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                            
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease                    
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease        
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease    
Fetched 94.5 kB in 0s (156 kB/s)                              
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

## Installing the NodeSource Node.js v6.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://mirrors.digitalocean.com/ubuntu xenial InRelease
Hit:2 http://mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:3 http://mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]              
Hit:5 https://deb.nodesource.com/node_6.x xenial InRelease                               
Fetched 94.5 kB in 0s (201 kB/s)                               
Reading package lists... Done

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js v6.x repo...

+ echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [94.5 kB]
Hit:2 https://deb.nodesource.com/node_6.x xenial InRelease                   
Hit:3 http://nyc2.mirrors.digitalocean.com/ubuntu xenial InRelease                            
Hit:4 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-updates InRelease
Hit:5 http://nyc2.mirrors.digitalocean.com/ubuntu xenial-backports InRelease
Fetched 94.5 kB in 0s (112 kB/s)
Reading package lists... Done

## Run `apt-get install nodejs` (as root) to install Node.js v6.x and npm

Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.1ubuntu2).
letsencrypt is already the newest version (0.4.1-1).
nginx is already the newest version (1.10.0-0ubuntu0.16.04.2).
nodejs is already the newest version (6.7.0-1nodesource1~xenial1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
/usr/bin/pm2 -> /usr/lib/node_modules/pm2/bin/pm2
/usr/bin/rundev -> /usr/lib/node_modules/pm2/bin/rundev
/usr/bin/pm2-dev -> /usr/lib/node_modules/pm2/bin/pm2-dev
/usr/bin/pm2-docker -> /usr/lib/node_modules/pm2/bin/pm2-docker
/usr/lib
└── pm2@2.0.18 

npm WARN optional Skipping failed optional dependency /pm2/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.14
Cloning into 'ubuntu-node-init'...
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (6/6), done.
Checking connectivity... done.
Initialization successful.
root@rave2-01:~# ls
hello.js  init.sh
root@rave2-01:~# nano inputtest.sh
root@rave2-01:~# ls
hello.js  init.sh  inputtest.sh
root@rave2-01:~# rm in
init.sh       inputtest.sh  
root@rave2-01:~# rm inputtest.sh 
root@rave2-01:~# nano init.sh 
root@rave2-01:~# nano init.sh 

  GNU nano 2.5.3                    File: init.sh                                              

apt-get -y install nodejs build-essential nginx letsencrypt
npm install -g pm2

# Clone git repo with code
git clone https://github.com/marcotriglia/ubuntu-node-init.git
mv ubuntu-node-init/hello.js hello.js

# Clean up
rm nodesource_setup.sh
rm -r ubuntu-node-init


echo "Initialization successful."
