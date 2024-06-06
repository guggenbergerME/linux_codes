# duplicity

duplicity unterstützt gelöschte Dateien, volle Unix-Berechtigungen, Verzeichnisse und symbolische Links, fifos und Gerätedateien, aber keine Hardlinks. Schön ist, dass es eine ganze Reihe an Backends unterstützt (anzugeben im URL-Format), darunter neben lokalem Dateisystem, SSH/scp, WebDAV und rsync auch S3- und Swift-Buckets.

duplicity sichert Dateien und Verzeichnisse, indem es mit Hilfe von gpg verschlüsselte „Volumes“ im tar-Format erstellt und diese auf einen entfernten oder lokalen Dateiserver hochlädt. Da duplicity librsync verwendet, sind die inkrementellen Archive sehr klein und enthalten nur die Teile der Dateien, die sich seit der letzten Sicherung geändert haben.

Ohne weitere Angabe von Parametern erstellt duplicity automatisch mit gzip komprimierte .difftar-Dateien, mit einer maximalen Grösse von 200 MB. Sobald solch eine Datei vorliegt, wird sie mit GnuPG verschlüsselt und ins Backend hochgeladen. Danach wird das Backup fortgesetzt.

## Duplicity installieren
**System update**
```
sudo apt-get update -y
```
**Installieren Sie Duplicity mit apt-get**

Aktualisieren des **Repositorys**
```
sudo apt-get install -y duplicity
```
**Prüfen der installation**
```
apt-cache policy duplicity
```
Die Ausgabe sollte anzeigen, ob die Installation erfolgreich war oder nicht!

## Basics
Sobald Duplicity installiert ist und ein FTP-Konto bereit ist, die Sicherungsdateien zu empfangen, ist es Zeit, ein kleines Skript zu erstellen, um es zu testen. 
Öffnen Sie einfach nano. Kopieren Sie die folgenden Codezeilen und fügen Sie sie in das neue Dokument ein. Speichern Sie dann die Datei als backup.sh. 
Sie können die Datei dann mit dem Befehl ausführbar und von anderen nicht lesbar machen chmod 700 back.sh Klicken Sie in einem Terminalfenster oder 
mit der rechten Maustaste auf die Datei in Nautilus, klicken Sie im Menü auf Eigenschaften und ändern Sie dann die Berechtigungen auf der Registerkarte Berechtigungen.

```
export PASSPHRASE=SomeLongGeneratedHardToCrackKey
export FTP_PASSWORD=WhateverPasswordYouSetUp
duplicity /etc ftp://FtpUserID@ftp.domain.com/etc
unset PASSPHRASE
unset FTP_PASSWORD
```
Das obige Skript führt dazu, dass Duplicity das Verzeichnis / etc mit der angegebenen Passphrase in komprimierte und verschlüsselte Volumes sichert, und laden Sie dann die Sicherungsdateien mit dem angegebenen Benutzernamen und Kennwort in das dafür eingerichtete FTP-Konto hoch.

Führen Sie das Beispiel nach dem Ändern durch Tippen aus ./backup.sh aus einem Terminalfenster.

Hier ist ein Beispiel für die Ausgabe, die das Skript zurückgeben soll:
```
-------------- [Sicherungsstatistik] ---------------
StartTime 1133074801.81 (Sun Nov 27 01:00:01 2005)
EndTime 1133074927.82 (Sun Nov 27 01:02:07 2005)
ElapsedTime 126.01 (2 Minuten 6.01 Sekunden)
SourceFiles 3446
SourceFileSize 27195497 (25,9 MB)
NewFiles 3446
NewFileSize 27195497 (25,9 MB)
Gelöschte Dateien 0
Geänderte Dateien 0
ChangedFileSize 0 (0 Byte)
GeändertDeltaSize 0 (0 Byte)
DeltaEntries 3446
RawDeltaSize 27018423 (25,8 MB)
TotalDestinationSizeChange 6865063 (6,55 MB)
Fehler 0
--------------------------------------------------
```

Auf dem FTP-Server sollten Sie einige Dateien finden, die der folgenden Liste ähneln:

```
Duplicity-Full-Signaturen 2005-11-27T01: 00: 01-05: 00.sigtar.gpg
Duplicity-full.2005-11-27T01: 00: 01-05: 00.manifest.gpg
Duplicity-full.2005-11-27T01: 00: 01-05: 00.vol1.difftar.gpg
Duplicity-full.2005-11-27T01: 00: 01-05: 00.vol2.difftar.gpg
```

## Überprüfen
Abhängig von den Parametern und der Reihenfolge der Parameter im Duplicity-Befehl können verschiedene Funktionen ausgeführt werden. Beispielsweise kann ein Archiv überprüft werden, um festzustellen, ob eine vollständige Sicherung durchgeführt wurde und welche Dateien sich seit der letzten Sicherung geändert haben, falls vorhanden. Der folgende Code ist ein Beispiel für die Überprüfung des vom Skript backup.sh aufgenommenen Archivs (denken Sie daran, die Leseberechtigungen für andere Benutzer zu entfernen):
```
exportieren PASSPHRASE = SomeLongGeneratedHardToCrackKey
Exportieren Sie FTP_PASSWORD = WhateverPasswordYouSetUp
Duplizitätsüberprüfung ftp://FtpUserID@ftp.domain.com/etc / etc
nicht gesetzte PASSPHRASE
verunsichern Sie FTP_PASSWORD
```
Hier ist die Ausgabe:
```
Verify complete: 3503 files compared, 2 differences found.
```
Wie aus der Ausgabe hervorgeht, haben sich bereits zwei Dateien geändert, seit die Sicherung zuletzt ausgeführt wurde. Aber welche zwei könnte man fragen? Dazu muss die Ausführlichkeitsstufe des Befehls von der Standardstufe 3 auf Stufe 4 erhöht werden. Ändern Sie das oben angegebene verify.sh-Skript, indem Sie ein -v4. So sieht der neue Befehl aus:

```
duplicity verify -v4 ftp://FtpUserID@ftp.domain.com/etc /etc
```
Hier ist die Ausgabe wieder:
```
Difference found: File . has mtime Fri Dec  2 05:58:42 2005, expected Wed Nov 30 11:42:01 2005
Difference found: File resolv.conf has mtime Fri Dec  2 05:58:42 2005, expected Mon Nov 28 18:58:28 2005
Verify complete: 3503 files compared, 2 differences found.
```
Es sieht so aus, als hätten 2 Dateien unterschiedliche Änderungszeiten als die im Sicherungssatz aufgezeichneten: resolv.conf und das aktuelle Verzeichnis (/ etc), das mit einem einzigen Punkt gekennzeichnet ist.
