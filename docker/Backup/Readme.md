# Docker Backup erstellen

Das Sichern von Docker Containern und dessen Volumes sollte man auf jeden Fall nicht dem Zufall überlassen. Ein Restore Test ist ebenfalls obligatorisch, denn was nutzt das beste Backup wenn man es im Ernstfall nicht schnell und einfach zurückspielen kann. In der Theorie sieht ein Backup Szenario bei Docker so aus, dass man Volumes mittels "Hilfscontainer" via tar sichert. Datenbanken können entweder über den eigenen Container, oder auch über einen "Hilfscontainer" mit den gängigen DUMP-Befehlen gesichert werden. Zusätzlich sollte man alle Projekt spezifischen Dateien, zum Beispiel das docker-compose.yml oder das .env File gesichert werden. Sämtliche andere Konfigurationsdateien, die man in den Container mountet sollten ebenfalls gesichert werden. Diese liegen alle normalerweise im Docker Compose Projekt Ordner, also ist es ein Anfang diesen einfach weg zusichern. Wichtig beim Backup ist ebenfalls, es sollte nicht auf dem selben System liegen, oder bleiben. Am besten hat man eine Kopie des lokalen Backup Ordners noch irgendwo auf einem zweit System, oder auf irgendeinem Cloud Laufwerk. Einfach an einem Ort, der bei einem Systemcrash und am besten auch bei einem Datacenter Ausfall noch verfügbar ist. Mehrere Versionen der Backups aufzuheben macht es einfach, falls man aus Versehen etwas geändert hat und es wieder Rückgängig machen möchte.
Zusammengefasst heißt das:

+ Volumes via Hilfskontainer und TAR sichern
+ Datenbanken via Container und Dump- (Datenbank Sicherungs-) Tool sichern
+ Docker Compose Projekt Ordner sichern
+ Docker Container bzw. Image sichern
+ Dateien, die außerhalb des Compose Projekt Ordners liegen und in einen Container gemountet sind, sichern.

## Manuelles Backup und Restore

Hier ein paar Tips wie man manuell Docker Container bzw. deren Applikationen sichert und wiederherstellt.
### Docker Volume
Zuerst sollte man wissen wie das zu sichernde Docker Volume heißt. Eine Übersicht ergibt der folgende Befehl:
    docker volume ls
Ich möchte das Volume mit dem Namen test-data sichern, mein Backup Verzeichnis soll /backup/volumes/ sein, welches vorher angelegt werden muss:

    mkdir -p /backup/volumes/
    docker run --rm \
            -v /backup/volumes:/backup \
            -v test-data:/data:ro \
            debian:stretch-slim bash -c "cd /data && /bin/tar -czvf /backup/test-data.tar.gz ."

Zum Restore das Ganze einfach umdrehen.

    docker run --rm \
            -v /backup/volumes:/backup \
            -v test-data:/data \
            debian:stretch-slim bash -c "cd /data && /bin/tar -xzvf /backup/test-data.tar.gz"

Nun sollten wieder alle Dateien an Ort und Stelle sein. Falls Dateien am Ort vorhanden sind, werden diese mit den Dateien aus dem Backup überschrieben. 

## Backup per Script
Unter nachfolgendem GitHub Link findet sich eine Sammlung mit Backup Scripts

    https://github.com/alaub81/backup_docker_scripts

Hier sind die Script inklusive Dokumentation zu finden:

+ [Docker Volume Backup Script](https://www.laub-home.de/wiki/Docker_Volume_Backup_Script)
+ [Docker MySQL and MariaDB Backup Script](https://www.laub-home.de/wiki/Docker_MySQL_and_MariaDB_Backup_Script)
+ [Docker Postgres Backup Script](https://www.laub-home.de/wiki/Docker_Postgres_Backup_Script)
+ [Docker InfluxDB 2 Backup Script](https://www.laub-home.de/wiki/Docker_InfluxDB_2_Backup_Script)
+ [Docker Compose Project Backup Script](https://www.laub-home.de/wiki/Docker_Compose_Project_Backup_Script)
