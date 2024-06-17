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
Verzeichnisse per ssh sichern
```
borg create --stats pc813@192.168.1.187:/home/pc813/borg_backup::test3 /home /var
```

## Borg Verzeicnis ansehen
```
borg list /home/pc813/borg_backup
```

## Backup von SSH wiederherstellen
In dem Ordner der wiederhergstellt werden soll ...
```
borg extract pc813@192.168.1.187:/home/pc813/borg_backup::test3
```
