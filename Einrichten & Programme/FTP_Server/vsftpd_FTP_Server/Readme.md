# Installation von vsftpd

Server vorbereiten

Einer der ersten Schritte nach der Erstellung eines Servers ist, sicherzustellen, dass dieser auf dem neuesten Stand ist und alle aktuelle Pakete enthält. Falls du es noch nicht gemacht hast, dann verwende bitte folgenden Befehl:

    apt -y update && sudo apt -y upgrade && sudo apt -y dist-upgrade 


Wie du erkennen kannst, ist bei jedem Teilbefehl ggf. ein »sudo« notwendig. Nach kurzer Wartezeit ist der Server auf dem neuesten Stand. Es kann weitergehen.

## FTP Server Dienst installieren

Da FTP ein sehr verbreitetes Protokoll ist, gibt es auch viele Anwendungen, die auf FTP aufbauen. Hier wird der Very Secure FTP Daemon (vsftpd)-Server gezeigt. Im Gegensatz zu den Alternativen aus dem Universe- oder Multiverse-Zweig, werden Main-Zweig-Pakete regelmäßig gepflegt und mit Sicherheitsupdates versorgt. Außerdem ist vsftpd sehr auf Sicherheit ausgelegt. Mit folgendem Befehl kann vsftpd auf deinem System installiert werden:

    sudo apt-get install vsftpd -y 

Um einen FTP-Server starten zu können, gib bitte den folgenden Befehl in dein Terminal ein:

    systemctl start vsftpd 

Für eine Verbindung braucht man einen User, der auch die Zugriffsrechte auf Client und Server hat. Dieser Benutzer muss einmal klar definiert werden und dann die notwendigen Rechte erhalten. Zunächst definieren wir einen User, dann weisen wir ihm ein Verzeichnis zu und geben ihm anschließend die Admin Rechte:

``` 
sudo adduser ftpuser
sudo mkdir /home/ftpuser/ftp
sudo chown nobody:nogroup /home/ftpuser/ftp
sudo chmod a-w /home/ftpuser/ftp
sudo mkdir /home/ftpuser/ftp/admin
sudo chown ftpuser:ftpuser /home/ftpuser/ftp/admin
```

Als nächstes schauen wir in Konfigurationsdatei von vsftpd und passen wir dort die Einstellungen an.

## FTP-Server-Dienst konfigurieren

Zum Konfigurieren des FTP-Server-Dienstes öffnest du die Config-Datei /etc/vsftpd.conf mit einem beliebigen Text-Editor. Hier wird nano dafür verwendet.

    sudo nano /etc/vsftpd.conf 

Dabei ist zu beachten, dass ein Eintrag nicht doppelt vorkommen darf. Es muss geprüft werden, ob sie existieren bevor sie aus diesem Tutorial herauskopiert werden. Es ist zu erwarten, dass alle Optionen irgendwo in der Konfigurationsdatei bereits definiert sind.
Wichtig ist noch, die Rechte von anonymen Benutzern für lesen, schreiben, löschen und herunterladen, zu deaktivieren.
Achtung! Anonyme Benutzer sollten nur in einem geschützten Netzwerk verwendet werden, da ansonsten die Gefahr besteht, dass der Server infiltriert werden könnte.

```
listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
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
```
Um folgende Einträge in der Konfiguration zu editieren, sollten sie nicht vorhanden sein, füge sie unten hinzu:

```
local_umask=022
pasv_min_port=10000
pasv_max_port=11000
```

Nachdem du die Einstellungen aktiviert oder zum Teil hinzugefügt hast, musst du deine Änderungen speichern. Danach musst du noch deine User in der Userliste hinterlegen, also bitte öffne die vsftpd-Benutzerliste:

    sudo nano /etc/vsftpduserlist.conf 

Danach nicht vergessen zu speichern bevor du die Datei verlässt. Abschließend starte vsftpd neu:

    sudo systemctl restart vsftpd 

[Quelle](https://gridscale.io/community/tutorials/ftp-ubuntu-erstellen/)
