# Borg Docker backup

Neben Backup für ganze VMs oder LVMs/snapshots gibt es Situationen, wo man einzelne Backups erstellen will/sollte.

Um Borg Backup zu nutzen, kann man es auf eine Computer installieren oder wiederum dafür docker verwenden (z.B. um das grundsystem frei von Software zu halten).

Als Ziel kann man lokale oder remote (auch borg-installationen) Verzeichnisse/„Repos“ angeben.

Anleitungen gibt es zu Hauf:

    Quick Start — Borg - Deduplicating Archiver 1.2.9.dev5 documentation 3
    A convenient way to backup your docker volumes with Borg and Ansible · Baptiste Bouchereau 1
    Resistance is futile - Borg with Docker | Mike Polinowski 2
    Versioniertes Backup - #8 von foer 1

Was findet ihr, ist best practice? Ich poste mal mein Setup.

## Links
- [Borg Doku](https://github.com/borgmatic-collective/docker-borgmatic)
