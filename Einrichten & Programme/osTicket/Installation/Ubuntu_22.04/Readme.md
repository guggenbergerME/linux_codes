# Installation Ubuntu 22.04

## Update System

```
sudo apt update -y && sudo apt upgrade -y
```

## LAMP installieren

```
sudo apt install apache2 -y
```
Nach der Installation aktivieren und starten
```
sudo systemctl enable apache2 && sudo systemctl start apache2
```
Status prüfen
```
sudo systemctl status apache2
```

## PHP installieren
```
sudo apt-get install php8.1 php8.1-cli php8.1-common php8.1-imap php8.1-redis php8.1-snmp php8.1-xml php8.1-zip php8.1-mbstring php8.1-curl php8.1-mysqli php8.1-gd php8.1-intl php8.1-apcu libapache2-mod-php -y
```
PHP Installation überprüfen
```
root@host:~# php -v
```
## mariaDB installieren
```
sudo apt install mariadb-server -y
```
mariadb Starten und erreichbar machen
```
sudo systemctl start mariadb && sudo systemctl enable mariadb
```
Prüfen
```
sudo systemctl status mariadb
```
## Anlegen der OSticket Datenbank
OSTicket Datenbank in mariaDB anlegen
```
sudo mariadb
```
Datenbank anlegen
```
CREATE DATABASE osticket;
```
Benutze und Passwort anlegen
```
GRANT ALL PRIVILEGES ON osticket.* TO osticket@localhost IDENTIFIED BY "GANZsichersPASSWORT";
```
Priv setzen und Exit
```
FLUSH PRIVILEGES;
EXIT;
```

## OSTicket installieren
wechseln in das www Verzeichnis des Apache Servers
```
cd /var/www/html
```
Download der letzten OSTicket Version
```
curl -s https://api.github.com/repos/osTicket/osTicket/releases/latest | grep browser_download_url | cut -d '"' -f 4 | wget -i -
```
OSTicket eventuell in einer anderen Ordnerstruktur installieren
```
unzip osTicket-v1.18.X.zip -d osTicket

cp /var/www/html/osTicket/upload/include/ost-sampleconfig.php /var/www/html/osTicket/upload/include/ost-config.php 

rm osTicket-v1.18.X.zip
```
Eigentümer und Rechte setzen
```
chown -R www-data:www-data /var/www/html/osTicket/

find . -type d -exec chmod 755 {} \;

find . -type f -exec chmod 644 {} \;
```


### Link
+ [Quelle](https://www.rosehosting.com/blog/how-to-install-osticket-on-ubuntu-22-04/)
