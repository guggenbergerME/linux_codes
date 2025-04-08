# Datastore

## Datastore einrichten

### Anleitungen
- [Der Proxmox Backup Server](https://www.bjoerns-techblog.de/2024/04/der-proxmox-backup-server/)


## Festplatten entfernen

Um einen Datastore vollständig zu entfernen

    sgdisk --zap-all /dev/sdX

Neustart

    reboot
