# Umbrell / Nostr

## umbrell ssh
```
ssh umbrel@[IP]
```
Passwort entspricht dem aus dem Setup!

## System update
```
sudo apt update && sudo apt full-upgrade -y
```

## NVMe prüfen
Als nächster Schritt muss geprüft werden ob die NVMe erkannt wurde
```
lsblk
```
sollt hier als Ergebis die "Festplatte" auflisten

## PI reboot
Nach dem Update sollte der PI noch einmal neu gestartet werden
```
sudo reboot
```

## Pi konfigurieren
```
sudo raspi-config
```

## Kopieren der SD-Karte auf die NVMe-SSD

Sofern dein Raspberry über den USB-Stick gebootet hat, können wir jetzt die Daten relativ sicher von der SD-Karte auf unsere NVMe-SSD kopieren. Da diese nicht mehr vom System verwendet werden, sollten auch keine Probleme auftauchen. Schaue dir über lsblk noch einmal die Namen deiner SD-Karte und NVMe-SSD an und ändere diese entsprechend (falls notwendig):``
```
sudo dd if=/dev/mmcblk0 of=/dev/nvme0n1 status=progress
```
Dieser Vorgang wird einiges an Zeit in Anspruch nehmen. Hab einfach Geduld und warte bis er final abgeschlossen ist.
Danach kannst du deinen Raspberry mit sudo poweroff herunterfahren.

