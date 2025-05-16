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
