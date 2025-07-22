# Proxmox Festplatte mounten

Bezeichnung der Festplatte ermitteln

    lsblk

Mount Ornder anlegen

    mkdir /mnt/FESTPLATTE-ORDNER

Festplatte Mounten

    mount /dev/sd[X]1 /mnt/FESTPLATTE-ORDNER/

Kontrolle der Eingehängten Platten

    lsblk -f

## Proxmox Storage hinzufügen

Im Bereich **Rechenzentrum/Storage** ein neues Verzeichnis anlegen.

```
    ID            Bezeichnung
    Verzeichnis    [PFADzuMNT]
    Content        Backup
```
