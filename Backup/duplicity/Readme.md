Duplicity unter Linux (Ubuntu/Debian) installieren
**************************************************
Das Paket "duplicity" kann direkt aus den Paketquellen wie zum Beispiel Ubuntu und Debian Canonical installiert werden. Sofern der Datenverkehr zum Backup-Server über ein FTP-Protokoll statt finden soll, muss noch das Paket "ncftp" dazu installiert werden.

    -> sudo apt-get install duplicity
    -> sudo apt-get install ncftp

Einfaches Backup des Verzeichnis "/etc" und Transfer via FTP
************************************************************
export PASSPHRASE=SELFGENERATEDUNIQEPASSPHRASEFORGPGENCRYPTION
export FTP_PASSWORD=FTPUSERPASSWORD
duplicity /etc ftp://ftpuser@ftp.domain.tld/etc
unset PASSPHRASE
unset FTP_PASSWORD

Die "PASSPHRASE" ist ein langer selbst generierter Schlüssel, der für die Verschlüsselung des Backups mit Duplicity genutzt werden soll. 
Es ist zu empfehlen den Schlüssel länger als 12 Zeichen zu wählen. Für den Datenverkehr wird der FTP-Benutzername "ftpuser" und das FTP-Passwort "FTP_PASSWORD" benötigt. 

Das FTP-Passwort wird in eine Variable gespeichert, damit es beim Transfer nicht via "top" oder "ps aux" auslesbar ist. 
Der Befehl "duplicity" führt das Backup mit den gegebenen Parametern durch. 
Gesichert wird in diesem Beispiel der Ordner "/etc".

Wiederherstellung einer Datei aus dem Backup mit Duplicity:
***********************************************************
export PASSPHRASE=SELFGENERATEDUNIQEPASSPHRASEFORGPGENCRYPTION
export FTP_PASSWORD=FTPUSERPASSWORD
duplicity --file-to-restore etc/rc.local ftp://ftpuser@ftp.domain.tld/etc /home/yourUser/rc.local
unset PASSPHRASE
unset FTP_PASSWORD

Wiederherstellung eines Verzeichnisses aus dem Backup mit Duplicity:
********************************************************************
export PASSPHRASE=SELFGENERATEDUNIQEPASSPHRASEFORGPGENCRYPTION
export FTP_PASSWORD=FTPUSERPASSWORD
duplicity etc/ ftp://ftpuser@ftp.domain.tld/etc /home/yourUser/myBackupFolderForETC
unset PASSPHRASE
unset FTP_PASSWORD

Backup von vor 3 Tagen wiederherstellen (Parameter -t)
******************************************************
export PASSPHRASE=SELFGENERATEDUNIQEPASSPHRASEFORGPGENCRYPTION
export FTP_PASSWORD=FTPUSERPASSWORD
duplicity -t 3D etc/ ftp://ftpuser@ftp.domain.tld/etc /home/yourUser/myBackupFolderForETC
unset PASSPHRASE
unset FTP_PASSWORD

Ein sehr ausführliches Backup-Skript ist in dem Wiki von Hetzner zu finden.

    http://wiki.hetzner.de/index.php/Duplicity_Script

Die Option –full-if-older-than erstellt nach der angegebenen Zeitspanne automatisch ein neues Full-Backup. 
Ist der Zeitraum zum letzten vollständigen Backup noch nicht überschritten, werden weiterhin inkrementale Backups erstellt. 
Der Parameter "remove-older-than" aus dem Duplicity Skript von Hetzner, sorgt dafür, dass Backups die älter als 2 Monate sind, gelöscht werden.

Dateien oder Verzeichnisse, die vom Backup ausgeschlossen werden sollen, werden in dem Duplicity-Skript mit dem Parameter "exclude-filelist" an Duplicity übergeben.
Es ist möglich für jedes Verzeichnis eine Ausschlussliste anzulegen. Für das Wurzelverzeichnis (/) sind die Ausschlüsse in 
der Datei /usr/local/etc/duplicity-exclude.conf abgelegt. Für alle weiteren Verzeichnisse unter /usr/local/etc/duplicity-exclude-$DIR.conf 
Zum Beispiel für das "Home-Verzeichnis" in "/usr/local/etc/duplicity-exclude-home.conf".

Beispiel einer Ausschlussliste für "/":
- /dev
- /proc
- /sys
- /tmp
- /etc
- /home
- /srv
- /var/cache


Inkrementelle Sicherung automatisch (jede Nacht) ausführen
**********************************************************
Für automatische und regelmäßige Backups mit Duplicity eignet sich ein täglicher Cronjob. Das Bash/Shell-Skript kann unter /etc/cron.daily (täglich), 
/etc/cron.weekly (wöchentlich) oder /etc/cron.monthly (monatlich) abgelegt werden. Für den Ausführzeitpunkt kann auch eine Crontab (cron.d) verwendet werden. 
Dazu muss eine Datei unter /etc/cron.d/ erstellt werden.
Der Beispiel-Cronjob wird jede Nacht um 00:05 Uhr ausgeführt.

# /etc/cron.d/duplicity-backup
0 5 * * * root /usr/local/sbin/duplicity-backup.sh >/dev/null 2>&1


Quelle
https://blog.joergboesche.de/linux-serverbackup-verschluesselte-inkrementelle-sicherung-mit-duplicity
