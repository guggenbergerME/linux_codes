# sftp

## Verbindung mit SFTP

Standardmäßig verwendet SFTP das SSH-Protokoll, um eine sichere Verbindung zu authentifizieren und zu erstellen. Aus diesem Grund sind die gleichen Authentifizierungsmethoden verfügbar, die auch in SSH vorhanden sind.

Obwohl Passwörter einfach zu verwenden und standardmäßig eingerichtet sind, empfehlen wir Ihnen, SSH-Schlüssel zu erstellen und Ihren öffentlichen Schlüssel auf jedes System zu übertragen, auf das Sie zugreifen müssen. Dies ist wesentlich sicherer und kann Ihnen auf lange Sicht Zeit sparen.

Bitte sehen Sie sich diesen Leitfaden zur Einrichtung von SSH-Schlüsseln für den Zugriff auf Ihren Server an, wenn Sie dies noch nicht getan haben.

Wenn Sie über SSH eine Verbindung zu dem Rechner herstellen können, haben Sie alle notwendigen Voraussetzungen erfüllt, um SFTP zur Verwaltung von Dateien zu verwenden. Testen Sie den SSH-Zugriff mit dem folgenden Befehl:
```
ssh name@XXX.XXX.XXX.XXX
```
Wenn dies funktioniert, geben Sie zum Verlassen Folgendes ein:
```
exit
```
Jetzt können wir eine SFTP-Sitzung aufbauen, indem wir den folgenden Befehl ausgeben:
```
sftp name@XXX.XXX.XXX.XXX
```
Sie stellen eine Verbindung zum Remote-System her, und Ihre Eingabeaufforderung ändert sich in eine SFTP-Eingabeaufforderung.

Wenn Sie an einem benutzerdefinierten SSH-Port arbeiten (nicht dem Standard-Port 22), können Sie eine SFTP-Sitzung wie folgt öffnen:
```
sftp -oPort=custom_port name@XXX.XXX.XXX.XXX
```
Dadurch werden Sie über den von Ihnen angegebenen Port mit dem Remote-System verbunden.,

## Hilfe in SFTP erhalten

Der nützlichste Befehl, den Sie zuerst lernen sollten, ist der Hilfebefehl. Damit haben Sie Zugriff auf eine Zusammenfassung der SFTP-Hilfe. Sie können sie aufrufen, indem Sie einen der folgenden Befehle in die Eingabeaufforderung eingeben:
```
help
```
oder
```
?
```
Damit wird eine Liste der verfügbaren Befehle angezeigt:
```
Output
Available commands:
bye                                Quit sftp
cd path                            Change remote directory to 'path'
chgrp grp path                     Change group of file 'path' to 'grp'
chmod mode path                    Change permissions of file 'path' to 'mode'
chown own path                     Change owner of file 'path' to 'own'
df [-hi] [path]                    Display statistics for current directory or
                                   filesystem containing 'path'
exit                               Quit sftp
get [-Ppr] remote [local]          Download file
help                               Display this help text
lcd path                           Change local directory to 'path'
. . .
```

Einige der angezeigten Befehle werden wir in den folgenden Abschnitten näher betrachten.

## Navigieren mit SFTP

Wir können durch die Dateihierarchie des Remote-Systems navigieren, indem wir eine Reihe von Befehlen verwenden, die ähnlich wie ihre Shell-Gegenstücke funktionieren.

Orientieren wir uns zunächst, indem wir herausfinden, in welchem Verzeichnis wir uns derzeit im Remote-System befinden. Genau wie in einer typischen Shell-Sitzung können wir Folgendes eingeben, um das aktuelle Verzeichnis zu erhalten:
```
pwd
```
```
Output
Remote working directory: /home/demouser
```
Wir können den Inhalt des aktuellen Verzeichnisses des Remote-Systems mit einem anderen vertrauten Befehl anzeigen:
```
ls
```
```
Output
Summary.txt     info.html       temp.txt        testDirectory
```
Beachten Sie, dass die Befehle innerhalb der SFTP-Schnittstelle nicht die normalen Shell-Befehle sind und nicht so funktionsreich sind, aber sie implementieren einige der wichtigeren optionalen Flags:
```
ls -la
```
```
Output
drwxr-xr-x    5 demouser   demouser       4096 Aug 13 15:11 .
drwxr-xr-x    3 root     root         4096 Aug 13 15:02 ..
-rw-------    1 demouser   demouser          5 Aug 13 15:04 .bash_history
-rw-r--r--    1 demouser   demouser        220 Aug 13 15:02 .bash_logout
-rw-r--r--    1 demouser   demouser       3486 Aug 13 15:02 .bashrc
drwx------    2 demouser   demouser       4096 Aug 13 15:04 .cache
-rw-r--r--    1 demouser   demouser        675 Aug 13 15:02 .profile
. . .
```

Um in ein anderes Verzeichnis zu gelangen, können wir diesen Befehl ausgeben:
```
cd testDirectory
```
Wir können nun das Remote-Dateisystem durchlaufen, aber was, wenn wir auf unser lokales Dateisystem zugreifen müssen? Wir können Befehle auf das lokale Dateisystem richten, indem wir ihnen ein l für lokal voranstellen.

Alle bisher besprochenen Befehle haben lokale Entsprechungen. Wir können das lokale Arbeitsverzeichnis ausgeben:
```
lpwd
```
```
Output
Local working directory: /Users/demouser
```
Wir können den Inhalt des aktuellen Verzeichnisses auf dem lokalen Rechner auflisten:
```
lls
```
```
Output
Desktop			local.txt		test.html
Documents		analysis.rtf		zebra.html
```

Wir können auch das Verzeichnis wechseln, mit dem wir auf dem lokalen System interagieren möchten:
```
lcd Desktop
```
## Übertragung von Dateien mit SFTP

Das Navigieren der Remote- und lokalen Dateisysteme ist nur von begrenztem Nutzen, wenn keine Möglichkeit besteht, Dateien zwischen den beiden Systemen zu übertragen.
Übertragung von Remote-Dateien auf das lokale System

Wenn wir Dateien von unserem Remote-Host herunterladen möchten, können wir dies tun, indem wir den folgenden Befehl ausgeben:
```
get remoteFile
```
```
Output
Fetching /home/demouser/remoteFile to remoteFile
/home/demouser/remoteFile                       100%   37KB  36.8KB/s   00:01
```
Wie Sie sehen können, lädt der Befehl get eine Remote-Datei in eine Datei mit dem gleichen Namen auf dem lokalen Dateisystem herunter.

Wir können die Remote-Datei unter einem anderen Namen kopieren, indem wir den Namen anschließend angeben:
```
get remoteFile localFile
```
Der Befehl get nimmt auch einige Options-Flags an. Beispielsweise können wir ein Verzeichnis und seinen gesamten Inhalt kopieren, indem wir die Option rekursiv angeben:
```
get -r someDirectory
```
Wir können SFTP anweisen, die entsprechenden Berechtigungen und Zugriffszeiten beizubehalten, indem wir das Flag -P oder -p verwenden:
```
get -Pr someDirectory
```
Übertragung lokaler Dateien auf das Remote-System

Die Übertragung von Dateien auf das Remote-System lässt sich ebenso einfach mit dem entsprechend benannten Befehl „put“ erreichen:
```
put localFile
```
```
Output
Uploading localFile to /home/demouser/localFile
localFile                                     100% 7607     7.4KB/s   00:00
```
Die gleichen Flags, die mit get funktionieren, gelten auch für put. Um also ein vollständiges lokales Verzeichnis zu kopieren, können Sie ausgeben:
```
put -r localDirectory
```
Anmerkung: In den Versionen von OpenSSH, die mit aktuellen Ubuntu-Versionen (zumindest 14.04 bis 15.10) ausgeliefert werden, gibt es derzeit einen Fehler, der verhindert, dass der obige Befehl korrekt funktioniert. Wenn Sie den obigen Befehl ausgeben, um Inhalte auf einen Server zu übertragen, der die fehlerhafte Version von OpenSSH verwendet, wird der folgende Fehler ausgegeben: Couldn't canonicalise: No such file or directory (Keine Kanonisierung möglich: keine solche Datei oder solches Verzeichnis).

Um dieses Problem zu umgehen, erstellen Sie zuerst das Zielverzeichnis auf der Remote-Seite, indem Sie mkdir localDirectory eingeben. Anschließend sollte der obige Befehl ohne Fehler abschließen.

Ein bekanntes Tool, das beim Herunterladen und Hochladen von Dateien nützlich ist, ist der Befehl df, der ähnlich wie die Kommandozeilenversion funktioniert. Damit können Sie überprüfen, ob Sie über ausreichend Speicherplatz verfügen, um die gewünschten Übertragungen durchzuführen:
```
df -h
```
```
Output
    Size     Used    Avail   (root)    %Capacity
  19.9GB   1016MB   17.9GB   18.9GB           4%
```
Bitte beachten Sie, dass es keine lokale Variante dieses Befehls gibt, jedoch können wir dies umgehen, indem wir den Befehl ! eingeben.

Der Befehl ! versetzt uns in eine lokale Shell, in der wir jeden auf unserem lokalen System verfügbaren Befehl ausführen können. Wir können die Festplattennutzung überprüfen, indem wir Folgendes eingeben:
```
!
```
und dann
```
df -h
```
```
Output
Filesystem      Size   Used  Avail Capacity  Mounted on
/dev/disk0s2   595Gi   52Gi  544Gi     9%    /
devfs          181Ki  181Ki    0Bi   100%    /dev
map -hosts       0Bi    0Bi    0Bi   100%    /net
map auto_home    0Bi    0Bi    0Bi   100%    /home
```
Jeder andere lokale Befehl wird wie erwartet funktionieren. Um zu Ihrer SFTP-Sitzung zurückzukehren, geben Sie Folgendes ein:
```
exit
```
Sie sollten nun wieder die SFTP-Eingabeaufforderung sehen.


## Einfache Dateimanipulation mit SFTP

Mit SFTP können Sie die Art der grundlegenden Dateiwartung durchführen, die bei der Arbeit mit Dateihierarchien nützlich ist.

Beispielsweise können Sie den Eigentümer einer Datei auf dem Remote-System ändern:
```
chown userID file
```
Beachten Sie, dass der SFTP-Befehl im Gegensatz zum Systembefehl chmod keine Benutzernamen akzeptiert, sondern stattdessen UIDs verwendet. Leider gibt es keine einfache Möglichkeit, die entsprechende UID innerhalb der SFTP-Schnittstelle zu kennen.

Eine aufwändige Umgehung könnte erreicht werden mit:
```
get /etc/passwd
!less passwd
```
```
Output
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
sys:x:3:3:sys:/dev:/bin/sh
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/bin/sh
man:x:6:12:man:/var/cache/man:/bin/sh
. . .
```
Beachten Sie, dass wir den Befehl ! nicht für sich allein gegeben haben, sondern als Präfix für einen lokalen Shell-Befehl verwendet haben. Dies funktioniert, um jeden Befehl auszuführen, der auf unserem lokalen Rechner verfügbar ist, und hätte zuvor mit dem lokalen Befehl df verwendet werden können.

Die UID wird in der dritten Spalte der Datei stehen, die durch Doppelpunkt abgegrenzt ist.

Auf ähnliche Weise können wir den Gruppeneigentümer einer Datei ändern mit:
```
chgrp groupID file
```
Auch hier gibt es keine einfache Möglichkeit, eine Auflistung der Gruppen des Remote-Systems zu erhalten. Wir können dies mit dem folgenden Befehl umgehen:
```
get /etc/group
!less group
```
```
Output
root:x:0:
daemon:x:1:
bin:x:2:
sys:x:3:
adm:x:4:
tty:x:5:
disk:x:6:
lp:x:7:
. . .
```
Die dritte Spalte enthält die ID der Gruppe, die mit dem Namen in der ersten Spalte verknüpft ist. Das ist, wonach wir suchen.

Zum Glück funktioniert der Befehl chmod wie erwartet auf dem Remote-Dateisystem:
```
chmod 777 publicFile
```
```
Output
Changing mode on /home/demouser/publicFile
```
Es gibt keinen Befehl zur Manipulation lokaler Dateiberechtigungen, aber Sie können die lokale umask festlegen, sodass alle auf das lokale System kopierten Dateien die entsprechenden Berechtigungen aufweisen.

Das kann mit dem Befehl lumask geschehen:
```
lumask 022
```
```
Output
Local umask: 022
```
Jetzt haben alle regulären Dateien, die heruntergeladen werden (solange das Flag -p nicht verwendet wird) 644 Berechtigungen.

Mit SFTP können Sie Verzeichnisse sowohl auf lokalen als auch auf Remote-Systemen mit lmkdir bzw. mkdir erstellen. Diese funktionieren wie erwartet.

Der Rest der Dateibefehle zielt nur auf das Remote-Dateisystem ab:
```   
ln
rm
rmdir
```
Diese Befehle replizieren das grundlegende Verhalten der Shell-Versionen. Wenn Sie diese Aktionen auf dem lokalen Dateisystem ausführen müssen, denken Sie daran, dass Sie durch Ausgabe des folgenden Befehls in eine Shell wechseln können:
```
!
```
Oder führen Sie einen einzelnen Befehl auf dem lokalen System aus, indem Sie dem Befehl das ! voranstellen, wie hier:
```
!chmod 644 somefile
```
Wenn Sie mit Ihrer SFTP-Sitzung fertig sind, verwenden Sie exit oder bye, um die Verbindung zu schließen.
```
bye
```



