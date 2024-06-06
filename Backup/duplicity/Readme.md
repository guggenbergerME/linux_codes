# duplicity

duplicity unterstützt gelöschte Dateien, volle Unix-Berechtigungen, Verzeichnisse und symbolische Links, fifos und Gerätedateien, aber keine Hardlinks. Schön ist, dass es eine ganze Reihe an Backends unterstützt (anzugeben im URL-Format), darunter neben lokalem Dateisystem, SSH/scp, WebDAV und rsync auch S3- und Swift-Buckets.

duplicity sichert Dateien und Verzeichnisse, indem es mit Hilfe von gpg verschlüsselte „Volumes“ im tar-Format erstellt und diese auf einen entfernten oder lokalen Dateiserver hochlädt. Da duplicity librsync verwendet, sind die inkrementellen Archive sehr klein und enthalten nur die Teile der Dateien, die sich seit der letzten Sicherung geändert haben.

Ohne weitere Angabe von Parametern erstellt duplicity automatisch mit gzip komprimierte .difftar-Dateien, mit einer maximalen Grösse von 200 MB. Sobald solch eine Datei vorliegt, wird sie mit GnuPG verschlüsselt und ins Backend hochgeladen. Danach wird das Backup fortgesetzt.

## Duplicity installieren
**Schritt 1: Aktualisieren Sie das Paket-Repository**
    sudo apt-get update -y

