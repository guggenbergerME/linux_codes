## USB Laufwerk erkennen
```
    -> df oder
    -> lsblk
```
## Laufwerk unmounten
```
    -> sudo umount /dev/sdX
```
Formatieren

Für das vFAT (FAT32)-Dateisystem: 
```
sudo mkfs.vfat /dev/sdX
```    
Für NTFS Dateisystem: 
```
sudo mkfs.ntfs /dev/sdX
```
Für das EXT4 Dateisystem:
```
sudo mkfs.ext4 /dev/sdX
```
FormatTIPP
exfat
