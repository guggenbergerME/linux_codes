# Paperless per Docker Compose installieren

## Installieren von GHCR / Docker Hub

Gehen Sie auf der [Projektseite in das Verzeichnis /docker/compose ](https://github.com/paperless-ngx/paperless-ngx/tree/main/docker/compose) und laden Sie eine der ```docker-compose.*.yml``` - Dateien herunter, je nachdem, welches Datenbank-Backend Sie verwenden möchten. 
Benennen Sie diese Datei in ```docker-compose.yml``` um. Wenn Sie optionale Unterstützung für Office-Dokumente aktivieren möchten, laden Sie eine Datei mit ```-tika``` im Dateinamen herunter. 
Laden Sie auch die Datei docker-compose.env und die Datei ```.env``` herunter und speichern Sie sie im selben Verzeichnis.

```
git clone ---> Version
```

## docker compose ausführen
Holen der Pakete mit dem Befehl ```docker compose pull```

## Super User anlegen
Anlegen eines Superusers mit
```
docker compose run --rm webserver createsuperuser
```
oder im Container per exec
```
$ python3 manage.py createsuperuser
```
