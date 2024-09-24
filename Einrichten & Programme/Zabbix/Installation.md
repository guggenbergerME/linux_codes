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

## Zabbix-Server konfigurieren

Als Nächstes bearbeitest du die Zabbix-Konfigurationsdatei und definierst deine Datenbank mit der folgenden Datei:
```
nano /etc/zabbix/zabbix_server.conf
```
Ändere die folgenden Zeilen:
```
DBName=zabbix
DBUser=zabbix
DBPassword=password
```
Speichere und schließe die Datei, wenn Du fertig bist. Importiere dann die Zabbix-Daten mit dem folgenden Befehl:
```
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql -u zabbix -p zabbix
```
Starte schließlich alle Dienste neu und aktiviere sie mit dem folgenden Befehl:
```
systemctl restart apache2
```
```
systemctl enable zabbix-server zabbix-agent apache2
```
```
systemctl restart zabbix-server zabbix-agent
```

Jetzt kannst du den Status des Zabbix-Servers mit dem folgenden Befehl überprüfen:
```
systemctl status zabbix-server
```
Du erhältst die folgende Ausgabe:
```
? zabbix-server.service - Zabbix Server
     Loaded: loaded (/lib/systemd/system/zabbix-server.service; disabled; vendor preset: enabled)
     Active: active (running) since Mon 2022-11-28 16:17:18 UTC; 6s ago
    Process: 13840 ExecStart=/usr/sbin/zabbix_server -c $CONFFILE (code=exited, status=0/SUCCESS)
   Main PID: 13844 (zabbix_server)
      Tasks: 48 (limit: 464122)
     Memory: 85.3M
     CGroup: /system.slice/zabbix-server.service
             ??13844 /usr/sbin/zabbix_server -c /etc/zabbix/zabbix_server.conf
             ??13853 "/usr/sbin/zabbix_server: ha manager" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ??13854 "/usr/sbin/zabbix_server: service manager #1 [processed 0 events, updated 0 event tags, deleted 0 problems, synced 0 ser>
             ??13855 "/usr/sbin/zabbix_server: configuration syncer [synced configuration in 0.226889 sec, idle 60 sec]"
             ??13858 "/usr/sbin/zabbix_server: alert manager #1 [sent 0, failed 0 alerts, idle 5.100929 sec during 5.101308 sec]"
             ??13859 "/usr/sbin/zabbix_server: alerter #1 started" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ??13860 "/usr/sbin/zabbix_server: alerter #2 started" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ??13861 "/usr/sbin/zabbix_server: alerter #3 started" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ??13862 "/usr/sbin/zabbix_server: preprocessing manager #1 [queued 0, processed 5 values, idle 5.024623 sec during 5.027861 sec]"
             ??13863 "/usr/sbin/zabbix_server: preprocessing worker #1 started" ""
             ??13864 "/usr/sbin/zabbix_server: preprocessing worker #2 started" ""
             ??13865 "/usr/sbin/zabbix_server: preprocessing worker #3 started" ""
```

Um den Status des Zabbix-Agenten zu überprüfen, führe den folgenden Befehl aus:
```
systemctl status zabbix-agent
```
Du erhältst die folgende Ausgabe:
```
? zabbix-agent.service - Zabbix Agent
     Loaded: loaded (/lib/systemd/system/zabbix-agent.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2022-11-28 16:17:18 UTC; 37s ago
    Process: 13842 ExecStart=/usr/sbin/zabbix_agentd -c $CONFFILE (code=exited, status=0/SUCCESS)
   Main PID: 13846 (zabbix_agentd)
      Tasks: 6 (limit: 464122)
     Memory: 6.0M
     CGroup: /system.slice/zabbix-agent.service
             ??13846 /usr/sbin/zabbix_agentd -c /etc/zabbix/zabbix_agentd.conf
             ??13847 "/usr/sbin/zabbix_agentd: collector [idle 1 sec]" "" "" "" "" "" "" "" "" "" ""
             ??13848 "/usr/sbin/zabbix_agentd: listener #1 [waiting for connection]"
             ??13849 "/usr/sbin/zabbix_agentd: listener #2 [waiting for connection]"
             ??13850 "/usr/sbin/zabbix_agentd: listener #3 [waiting for connection]"
             ??13851 "/usr/sbin/zabbix_agentd: active checks #1 [idle 1 sec]" "" "" ""

Nov 28 16:17:17 ubuntu22041 systemd[1]: Starting Zabbix Agent...
Nov 28 16:17:18 ubuntu22041 systemd[1]: Started Zabbix Agent.
```
Um den Apache-Status zu überprüfen, führe den folgenden Befehl aus:
```
systemctl status apache2
```
Du erhältst die folgende Ausgabe:
```
? apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2022-11-28 16:17:08 UTC; 1min 5s ago
       Docs: https://httpd.apache.org/docs/2.4/
    Process: 13828 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
   Main PID: 13832 (apache2)
      Tasks: 6 (limit: 464122)
     Memory: 12.3M
     CGroup: /system.slice/apache2.service
             ??13832 /usr/sbin/apache2 -k start
             ??13833 /usr/sbin/apache2 -k start
             ??13834 /usr/sbin/apache2 -k start
             ??13835 /usr/sbin/apache2 -k start
             ??13836 /usr/sbin/apache2 -k start
             ??13837 /usr/sbin/apache2 -k start

Nov 28 16:17:08 ubuntu22041 systemd[1]: Starting The Apache HTTP Server...
```

### Links
+ [Anleitung](https://www.howtoforge.de/anleitung/so-installierst-du-das-zabbix-monitoring-tool-auf-ubuntu-22-04/)
+ [Betrieb](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-zabbix-to-securely-monitor-remote-servers-on-ubuntu-18-04)
