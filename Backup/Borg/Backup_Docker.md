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

## Links
- [Borg Doku](https://github.com/borgmatic-collective/docker-borgmatic)
