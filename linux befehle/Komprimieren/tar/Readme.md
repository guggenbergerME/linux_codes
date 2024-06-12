# tar Befehl

## Verzeichnis packen
```
tar cfvz [DATEINAME].tar.gz [Verzeichnis]/
```

## Verzeichnis mit Datum versehen
```
tar -zcf [DATEINAME]`date +%Y-%m-%d`.tgz [VERZEICHNIS]
```

## Verzeichnis packen und per rClone sichern
```
tar -zcf /[PFAD_SICHERUNG]/name-`date +%Y-%m-%d`.tgz /[ORDNER zum Sichern] | rclone sync -Pv /[PFAD_SICHERUNG]/ [REMOTE]:[ORDNER REMOTE]/
```
