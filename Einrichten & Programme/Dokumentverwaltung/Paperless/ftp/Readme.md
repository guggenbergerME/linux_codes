# FTP upload

## Installieren eines FTP Servers

Mit diesem Befehl installiert man „vsftpd“:

    apt install vsftpd

Mit dem Texteditor „vi“ muss man nun noch ein paar Einstellungen in der Config des FTP Servers ändern (diese sind mit einem „#“ auskommentiert, um die Einstellung zu übernehmen, muss einfach das „#“ entfernt werden):

    $ nano /etc/vsftpd.conf

```
listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
allow_writeable_chroot=YES
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
pasv_enable=Yes
user_sub_token=$USER
local_root=/home/$USER/ftp
local_umask=022
pasv_min_port=10000
pasv_max_port=11000
```

FTP Server neu starten:

```
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
```

## Neuen ftp User anlegen

    adduser [NAME]

## pdf per crontab in den Paperless Ordner schieben

    */2 * * * * mv /home/d1/*.pdf [zielordner]

## ftp Verbinden

    ftp://[AnmeldeName]@10.115.0.5/home/[Anmeldename]
