# Rclone

## install
```
sudo apt-get install rclone-browser
```

## erstes config
```
rclone config
```

## Remote ordner ausgeben
```
rclone lsd [REMOTE]:
```

## Ordner auf dem FTP anlegen
```
rclone mkdir ftp:Verzeichnis/Verzeichnis
```
## Verzeichnis kopieren
```
rclone copy -Pv [QUELLVERZEICHNIS]/ [REMOTE]:[ZIELORDNER]
```

### Weitere Links
+ [FTP rClone Anleitung](https://rclone.org/ftp/)
