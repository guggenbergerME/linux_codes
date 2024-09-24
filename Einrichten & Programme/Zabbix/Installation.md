# Zabbix Monitoring Tool auf Ubuntu 22.04

## Zabbix-Repository installieren

Das Zabbix-Paket ist nicht im Standard-Repository von Ubuntu 22.04 verfügbar. Daher musst du das offizielle Zabbix-Repository herunterladen und auf deinem Server installieren.

Lade zunächst das Zabbix 6 Repository-Paket mit dem folgenden Befehl von der offiziellen Website herunter:
```
wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-4%2Bubuntu22.04_all.deb
```
Anschließend installierst du es mit dem folgenden Befehl:
```
dpkg -i zabbix-release_6.2-4+ubuntu22.04_all.deb
```
Sobald das Zabbix-Repository zur APT hinzugefügt wurde, kannst du mit der Installation des Zabbix-Servers fortfahren.

## Zabbix Monitoring Server installieren

Aktualisiere zunächst das Zabbix-Repository mit dem folgenden Befehl:
```
apt-get update -y
```
Als Nächstes installierst du den Zabbix-Server und die anderen erforderlichen Komponenten mit dem folgenden Befehl:
```
apt-get install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent zabbix-frontend-php zabbix-apache-conf -y
```
Nachdem du alle Pakete installiert hast, bearbeite die PHP-Konfigurationsdatei und stelle deine Zeitzone ein:
```
nano /etc/php/8.1/apache2/php.ini
```
Ändere die folgende Zeile:
```
date.timezone = UTC
```
Speichere und schließe die Datei, wenn du fertig bist.

## MariaDB-Datenbank konfigurieren

Zabbix verwendet eine MariaDB als Datenbank-Backend. Du kannst den MariaDB-Datenbankserver installieren, indem du den folgenden Befehl ausführst:
```
apt-get install mariadb-server -y
```
Sobald der MariaDB-Server installiert ist, sichere die MariaDB-Installation und setze das Root-Passwort mit dem folgenden Befehl:
```
mariadb-secure-installation
```
Beantworte alle Fragen wie unten gezeigt:
```
Enter current password for root (enter for none): 
Switch to unix_socket authentication [Y/n] n
Remove anonymous users? [Y/n] y
Disallow root login remotely? [Y/n] y
Remove test database and access to it? [Y/n] y
Reload privilege tables now? [Y/n] y
```
Als Nächstes verbindest du dich mit der MariaDB-Shell, indem du den folgenden Befehl ausführst:
```
mysql -u root -p
```
Sobald du eingeloggt bist, erstelle eine Datenbank und einen Benutzer für Zabbix mit dem folgenden Befehl:
```
MariaDB [(none)]> CREATE DATABASE zabbix character set utf8mb4 collate utf8mb4_bin;
MariaDB [(none)]> GRANT ALL PRIVILEGES ON zabbix.* TO zabbix@localhost IDENTIFIED BY 'password';
```
Als Nächstes löschst du die Berechtigungen und verlässt MariaDB mit dem folgenden Befehl:
```
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> EXIT;
```
Sobald du damit fertig bist, kannst du mit dem nächsten Schritt fortfahren.
