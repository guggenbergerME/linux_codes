## Updates installieren + DB Server
```
su -
apt update && apt upgrade -y
apt install mariadb-server -y
```

## Datenbankserver sichern
```
mysql_secure_installation
Fragen so beantworten:
y
n
y
y
y
y
```

## Mit DB Server verbinden und Datenbanken erstellen
```
mysql -u root -p
CREATE DATABASE Name_der_Datenbank;
GRANT ALL PRIVILEGES ON Name_der_Datenbank.* TO Dein_Benutzername_von_System@localhost IDENTIFIED BY "Dein_Passwort_für_die_Datenbank";
FLUSH PRIVILEGES;
QUIT;
```

## Webserver installieren + Tools installieren + PHP installieren
```
apt install apache2 lsb-release ca-certificates apt-transport-https software-properties-common curl unzip -y
systemctl start apache2
systemctl enable apache2
apt install php8.2 php8.2-common -y
apt install php8.2-imap php8.2-apcu php8.2-intl php8.2-cgi php8.2-mbstring php8.2-gd php8.2-mysql php8.2-bcmath php8.2-xml php8.2-zip php8.2-ldap -y
```
## osTicket vorbereiten

```
wget Downlodlink_für_die_Free_oder_PLUS_Version
unzip osTicket*.zip -d osTicket
mkdir /var/www/deinosTicketOrdner
mv osTicket/upload/* /var/www/deinosTicketOrdner
rm osTicket-*
rm -r osTicket/
cd /var/www/deinosTicketOrdner/include
```

## Konfigurationsdatei anlegen + Rechteänderung + Aktivieren der Seite
```
cp ost-sampleconfig.php ost-config.php
chown -R www-data:www-data /var/www/
a2dissite 000-default.conf
rm /var/www/html/index.html
systemctl restart apache2
nano /etc/apache2/sites-available/osticket.conf
```

osticket.conf inhalt:
```
<VirtualHost *:80>
DocumentRoot /var/www/deinosTicketOrdner
<Directory /var/www/deinosTicketOrdner>
Options FollowSymlinks
AllowOverride All
Require all granted
</Directory>
ErrorLog ${APACHE_LOG_DIR}/osticket_error.log
CustomLog ${APACHE_LOG_DIR}/osticket_access.log combined
</VirtualHost>
```

## Neu laden von Webserver + Rechteänderung

```
a2ensite osticket.conf
systemctl restart apache2
apachectl -t
```

Aufräumen (ERST NACH DER INSTALLTION MACHEN !!!!)
```
chmod 0644 /var/www/deinosTicketOrdner/include/ost-config.php
rm -r /var/www/deinosTicketOrdner/setup/
```
