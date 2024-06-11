# Borg Docker backup

## Schritt 1 - Daten zum Backup sammeln

Container speichern Daten an mehreren Stellen. Um ein komplettes Backup zu erhalten, müssen Sie feststellen, wo Daten gespeichert werden, um einen Container erfolgreich nachzubilden, aufbewahrt werden.

### Containerkonfiguration
Das bedeutet, dass die Details, die für die Neua Erstellung eines Behälters oder Pods benötigt werden, docker runBefehl, der benötigt wurde, um einen Container zu starten. Oft wird dies in einem docker-compose.ymlDatei (für kleine Einsätze), in einem Orchestrierungstool, wie Portainer oder einem anderen Bereitstellungsautomatisierungstool.
### Volumen
Alle Daten in einem Container werden vom Herausgeber des Bildes verwaltet und verschwinden, wenn der Behälter aktualisiert oder neu erstellt wird. So ist es notwendig, persistente Ordner außerhalb des Behälters zu montieren. Dies kann bei benannten Mengen passieren (nach der Containerlaufzeit verwaltet und in der Regel in /var/lib/docker/volumes/oder der Heimordner eines Benutzers) oder Bindenhalters (Links zu tatsächlichen Host-Ordnern). Egal, wo montierte Ordner gehalten werden, sie müssen in das Backup aufgenommen werden.
### Datenbanken
Viele Apps benötigen eine Datenbank zum Arbeiten und starten oft einen separaten Behälter dafür. Wenn Sie mehrere Apps haben, die z.B. eine MySQL-Datenbank benötigen, ist es im Allgemeinen einfacher, dies in einem Container zu konsolidieren und mehrere Apps einen DB-Container teilen zu lassen. Das erleichtert das Backup und spart auch Ressourcen.

## Schritt 2 - Backup-Volumen

Mit den bekannten Orten können Sie unser übliches CLI-Tutorial oder Ansible-Rolle verwenden, um Borgmatic und Borg einzurichten. Es gibt auch ein Docker-Bild, um Borgmatic zu betreiben. Egal, welche Installationsmethode am besten funktioniert, Sie müssen immer einen borgmatic.yamlDatei.

Lassen Sie uns zuerst Containerkonfigurationen und -Volumen abdecken:
```
location:
    source_directories:
        - /root/docker-compose
        - /var/lib/docker/volumes/
```
## Backup Ordner erstellen

Führen Sie diesen Befehl aus, um Datenverzeichnisse zu erstellen, die dieses Bild unter Ihrem bevorzugten Verzeichnis benötigt.

```
mkdir data/
mkdir data/borgmatic.d
mkdir data/repository
mkdir data/.config
mkdir data/.ssh
mkdir data/.cache
```

Konfigurieren Sie eine Kopie von borgmatic config.yaml in data/borgmatic.dund den Behälter laufen lassen. 
Sie können einen der Host-Mount-Punkte an Ihre Backup-Konfiguration anpassen.

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

## Links
- [Borg Doku](https://github.com/borgmatic-collective/docker-borgmatic)
