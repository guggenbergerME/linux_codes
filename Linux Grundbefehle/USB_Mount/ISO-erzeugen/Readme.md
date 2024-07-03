## USB anzeigen
Alle USB Geräte anzeigen
```
lsblk
```
USB aushängen
```
sudo umount /dev/sdX
```
ISO schreiben
```
sudo dd if=[ISO-FILE] of=/dev/sdX bs=1M status=progress
```
