# Installation

Für die Installation verwenden Sie einen leeren USB-Stick.

## USB-Stick vorbereiten

Entpacken Sie das Installations-Image!
```
bunzip2 OPNsense-23.7-vga-amd64.img.bz2
```
## USB Laufwerk anzeigen
```
lsblk
```
danach dd auf den USB Stick
```
sudo dd if=OPNsense-23.7-vga-amd64.img of=/dev/sdb bs=1M
```
