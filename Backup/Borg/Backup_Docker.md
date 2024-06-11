# Borg Docker backup

Neben Backup für ganze VMs oder LVMs/snapshots gibt es Situationen, wo man einzelne Backups erstellen will/sollte.

Um Borg Backup zu nutzen, kann man es auf eine Computer installieren oder wiederum dafür docker verwenden (z.B. um das grundsystem frei von Software zu halten).

Als Ziel kann man lokale oder remote (auch borg-installationen) Verzeichnisse/„Repos“ angeben.

Anleitungen gibt es zu Hauf:

+ [Quick Start — Borg - Deduplicating Archiver 1.2.9.](https://borgbackup.readthedocs.io/en/1.2-maint/quickstart.html)
+ [A convenient way to backup your docker volumes with Borg and Ansible](https://baptiste.bouchereau.pro/tutorial/backup-docker-volumes-with-borg/)
+ [Resistance is futile - Borg with Docker](https://mpolinowski.github.io/docs/DevOps/Linux/2022-11-09--docker-borg-backupserver/2022-11-09)
+ [Versioniertes Backup](https://ask.linuxmuster.net/t/versioniertes-backup/10167/8)

Was findet ihr, ist best practice? Ich poste mal mein Setup.

## Beispielimplementation: Borg Backup mit Hilfe von docker (compose)

+ Docker-Container-Up-to-Date-Security: Mir gefällt bei den Borg Backups (im Internet) via Docker oft nicht, dass irgendwelche docker-container verwendet werden, daher baue ich mein Image selbst aufbauend auf einem vertrauten Image (debian:stable-slim).
+ Regelmäßigkeit Außerdem: man braucht Borg ja eigentlich nicht ständig, aber regelmäßig (über einen scheduler wie cron. Man kann jetzt einen docker-container bauen, der ständig läuft und cron enthält. Mag ich auch nicht. Ich nehme dafür cron auf dem System.
+ docker vs docker compose Außerdem: eigentlich braucht man docker-compose dafür nicht. Es reicht ja ein docker -v /srv/backup:/srv/target exec|run... usw. Aber ich mag dann doch lieber docker-compose.yml, selbst wenn der Dockercontainer ein Zombie ist.
+ Flexibilität und Dokumentation: Das Elegante an einer Lösung über docker compose: ich kann beliebige „hooks“ noch einfügen, wenn ich mag, z.B. wenn man einen datenbank-container dumpen will, wenn man container anhalten mag, wenn man lokale Backupstrategien nutzen will (z.B. bei mailcow/helper-scripts/backup_and_restore.sh). Ich habe (außer der cron-links) alle Config in der Nähe des docker-compose.yml. Da kann ich mich noch später erinnern, wie es funktioniert:

## Beispielhafte docker-struktur:
```
/srv/docker/app1
/srv/docker/app2
+-          app2/grossercache
/srv/docker/borgbackup
+-          borgbackup/Dockerfile
+-          borgbackup/borgbackup.sh
+-          borgbackup/borg-localbackup-cron
/srv/docker/docker-compose.yml
/etc/nginx/
```

## Links
- [Borg Doku](https://github.com/borgmatic-collective/docker-borgmatic)
