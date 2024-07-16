# Debian / Ubuntu | Update Anleitung osTicket / Umstellung auf die Deutsche Version

1) Vorbereitung

+ Helpdesk Offline Schalten (Admin-Bereich --> Einstellungen --> System --> Helpdesk Status --> Offline)
+ Mit der Version 1.17 wurde ein neues Plugin System eingeführt, daher ist dieser Schritt empfohlen, aber kein Zwang)
+ Alle Plugins deaktivieren und löschen (Admin-Bereich --> Verwalten --> Plugins)
+ Mail Abruf deaktivieren (Admin-Bereich --> E-Mail-Adressen --> Einstellungen --> E-Mails abrufen, die Checkbox entfernen)
```
su -
apt update && apt upgrade -y
```

2) Datensicherung
```
cp -r /var/www/deinosTicketOrdner /backup_osticket/
mysqldump -u root -p name_der_osticket_db > /backup_osticket/Backupname.sql
rm -r /var/www/deinosTicketOrdner
```

3) Download + Kopieren der Daten
```
wget Downlodlink_für_die_Free_oder_PLUS_Version
unzip osTicket*.zip -d /var/www/deinosTicketOrdner
rm osTicket-*
rm -r osTicket/
```

4) Umstellung auf PHP 8.2

```
apt install apache2 lsb-release ca-certificates apt-transport-https software-properties-common curl unzip -y
apt install php8.2 php8.2-common -y
apt install php8.2-imap php8.2-apcu php8.2-intl php8.2-cgi php8.2-mbstring php8.2-gd php8.2-mysql php8.2-bcmath php8.2-xml php8.2-zip php8.2-ldap -y
a2dismod deine_alte_PHP_Version (Beispiel php8.1)
a2enmod php8.2
systemctl restart apache2
service mysql start
service apache2 start
```
+ [Kein PHP gefunden Debian](https://forum.osticket.com.de/thread/3079-debian-ubuntu-update-anleitung-osticket-umstellung-auf-die-deutsche-version/#)
+ [Kein PHP gefunden Ubuntu](https://forum.osticket.com.de/thread/3079-debian-ubuntu-update-anleitung-osticket-umstellung-auf-die-deutsche-version/#)



5) Kopieren der alten Konfig Datei + Testlauf

```
cp /backup_osticket/include/ost-config.php /var/www/deinosTicketOrdner/include/
```
+ URL von Helpdesk eingeben mit dem Zusatz /scp (Beispiel http://www.maxmustermann.de/Support/scp)
+ Der osTicket-Updater erscheint, bitte alles durchlesen und Anweisungen befolgen
+ Helpdesk wieder Online schalten (Admin-Bereich öffnen -->Einstellungen --> System --> Helpdesk Status --> Online)
+ Mail Abruf wieder aktivieren (Admin-Bereich --> E-Mail-Adressen --> Einstellungen --> E-Mails abrufen die Checkboxen wieder setzten so wie vorher)
+ Prüfen, ob der Abruf der einzelnen Mail-Adressen aktiv ist (Admin-Bereich --> E-Mail-Adressen --> E-Mail-Adressen --> Mail-Adresse anklicken und unter beiden Registerkarten prüfen, ob "Aktivieren" ausgewählt ist
+ Plugins wieder installieren und einrichten
+ Anpassungen wenn vorhanden wieder in Quellcode einfügen (z.B. mit Winmerge)
+ Cache Leeren von Browser
+ Testen ob alles läuft weiter....

Tipp: Jede Anpassung dokumentieren und die Dateien extra speichern, dann weiß man welchen Dateien geprüft und angepasst werden müssen.

6) Aufräumen
```
apt upgrade -f
apt purge 'php8.1*' (php8.1 mit deiner Version ersetzen Beispiel php8.0)
chmod 0644 /var/www/deinosTicketOrdner/include/ost-config.php
rm -rf /var/www/deinosTicketOrdner/setup/
```
