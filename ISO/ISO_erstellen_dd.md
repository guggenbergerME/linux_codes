# ISO USB per dd erzeugen

Auslesen der Laufwerkskennung
```
lsblk
```

## USB Laufwerk auswerfen
```
sudo umount /dev/sdX
```

## Download der ISO prüfen
Das Download der ISO kann mit der angegeben Checksumme geprüft werden.
```
ls -l ubuntu-20.04.1-live-server-amd64.iso
echo "443511f6bf12402c12503733059269a2e10dec602916c0a75263e5d990f6bb93 *ubuntu-20.04.1-live-server-amd64.iso" \
| shasum -a 256 --check
```
+ [mehr Informationen](https://www.cyberciti.biz/tips/linux-unix-verify-dvd-cd-iso-images.html)

## ISO auf USB Stick schreiben
```
sudo dd if=[ISOFILE] of=/dev/s[LAUFWERK] bs=1M status=progress
```
