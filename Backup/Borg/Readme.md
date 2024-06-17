# borg backup

## Borg installieren
```
sudo apt-get install borgbackup
```

## Borg einrichten

Bevor man ein Backup mit borg erzeugen kann, muss ein Repository initialisiert werden.
```
borg init --encryption=none /path/to/repo
```
per ssh init
```
borg init --encryption=none NAME@IP:/[Backup_Ordner]
```

## Sichern eines Verzeichnis
```

```
