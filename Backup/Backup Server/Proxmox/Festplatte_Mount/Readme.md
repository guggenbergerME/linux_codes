# Proxmox Festplatte mounten

Bezeichnung der Festplatte ermitteln

    lsblk

Mount Ornder anlegen

    mkdir /mnt/FESTPLATTE-ORDNER

Festplatte Mounten

    mount /dev/sd[X]1 /mnt/FESTPLATTE-ORDNER/

