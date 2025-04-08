# Datastore

## Datastore einrichten

### Anleitungen
- [Der Proxmox Backup Server](https://www.bjoerns-techblog.de/2024/04/der-proxmox-backup-server/)

## Prune-& GC-Jobs



## Festplatten entfernen

Um einen Datastore vollständig zu entfernen

    sgdisk --zap-all /dev/sdX

Neustart

    reboot
