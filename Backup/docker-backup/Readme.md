# docker-backup

## Installation von Github

Zur Installation wird die Programmiersprache **Go** benötigt. Prüfen ob Go bereits installiert ist.

```
go version
```
[Go installieren](https://github.com/guggenbergerME/linux_codes/tree/main/Programme/Go)

Git Clone

```
git clone https://github.com/muesli/docker-backup.git
cd docker-backup
go build
```
## Ein Backup erstellen

Um einen einzigen Containerstart zu backen docker-backupmit backupBefehl und den Ausweis des Behälters zu liefern:
```
docker-backup backup <container ID>
```
Das schafft .jsonDatei mit Metadaten des Containers sowie eine Datei mit allen Volumes, die mit einem externen Werkzeug wie restisch oder borgbackup.

Wenn Sie direkt eine .tarDatei mit allen Containern Daten einfach:
```
docker-backup backup --tar <container ID>
```
Sie können auch alle Laufcontainer auf dem Host mit dem --allFahne:
```
docker-backup backup --all
```
Um alle Container zu backen (unabhängig von ihrem aktuellen Laufzustand), laufen Sie:
```
docker-backup backup --all --stopped
```
Mit Hilfe --launchSie können direkt ein Backup-Programm mit dem Generierte Dateiliste als Argument:
```
docker-backup backup --all --launch "restic -r /dest backup --password-file pwfile --tag %tag --files-from %list"
```



### Links
+ [Repo](https://github.com/muesli/docker-backup)
