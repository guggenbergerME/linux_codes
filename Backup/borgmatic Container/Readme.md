# borgmatic Container

## Erstellen der Backup Ornderstruktur

```
mkdir backup/
mkdir backup/borgmatic.d
touch backup/config.yaml
```
Konfigurieren der config.yaml
```
mkdir backup/repository
```
```
mkdir backup/.config
```
```
mkdir backup/.ssh
```
```
mkdir backup/.cache
```

Konfigurieren Sie eine Kopie von borgmatic config.yaml in data/borgmatic.dund den Behälter laufen lassen. Sie können einen der Host-Mount-Punkte an Ihre Backup-Konfiguration anpassen.
```
docker run \
  --detach --name borgmatic \
  -v /home:/mnt/source:ro \
  -v ./data/repository:/mnt/borg-repository \
  -v ./data/borgmatic.d:/etc/borgmatic.d/ \
  -v ./data/.config/borg:/root/.config/borg \
  -v ./data/.ssh:/root/.ssh \
  -v ./data/.cache/borg:/root/.cache/borg \
  -e TZ=Europe/Berlin \
  ghcr.io/borgmatic-collective/borgmatic
```
