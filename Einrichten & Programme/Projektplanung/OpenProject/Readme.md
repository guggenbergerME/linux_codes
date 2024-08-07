# OpenProject


## Debian 11 install

As root update the apt package index and install packages to allow apt to use a repository over HTTPS:
```
su -
apt update
apt install apt-transport-https ca-certificates wget gpg
```
Import the PGP key used to sign our packages:
```
wget -qO- https://dl.packager.io/srv/opf/openproject/key | gpg --dearmor > /etc/apt/trusted.gpg.d/packager-io.gpg
```
Add the OpenProject package source:
```
wget -O /etc/apt/sources.list.d/openproject.list \
  https://dl.packager.io/srv/opf/openproject/stable/14/installer/debian/11.repo
```
Download the OpenProject package:
```
apt update
apt install openproject
```
Then finish the installation by reading the Initial configuration section.

## Docker installation
+ https://github.com/guggenbergerME/linux_codes/blob/main/Projektplanung/OpenProject/Docker%20installation.md


## Login

Kennung ```admin```

Passwort ```admin```

Link
```
http://IP/openproject/login
```
