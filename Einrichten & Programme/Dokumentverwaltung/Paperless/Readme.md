# Paperless-ngx

Paperless bietet ein interaktives Installationsskript zum Einrichten eines Docker Compose Montage. Das Skript fragt nach ein paar Konfigurationsoptionen und erstellt dann die notwendige Konfigurationsdateien, ziehen Sie das Dockerbild, starten Sie Paperless-ngx und erstellen Sie Ihren Superuser Konto. Das Skript führt im Wesentlichen automatisch die im [Docker-Setup](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20%26%20Programme/docker/Installieren) beschriebenen Schritte durch.

## Download installation Script
```
bash -c "$(curl --location --silent --show-error https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/main/install-paperless-ngx.sh)"
```

## Anletung

+ https://docs.paperless-ngx.com/setup/
+ https://docs.paperless-ngx.com/setup/#docker_build

+ [Etiketten
](https://digital-cleaning.de/index.php/paperless-ngx-teil-13-ein-quanten-code-fuer-das-papier-archiv/)
## Installation mit compose
```
services:
  broker:
    image: docker.io/library/redis:7
    restart: unless-stopped
    volumes:
      - redisdata:/data

  db:
    image: docker.io/library/postgres:16
    restart: unless-stopped
    volumes:
      - /home/bpc009/docker-app/paperless/pgdata:/var/lib/postgresql/data
    environment:
      POSTGRES_DB: paperless
      POSTGRES_USER: paperless
      POSTGRES_PASSWORD: paperless

  webserver:
    image: ghcr.io/paperless-ngx/paperless-ngx:latest
    restart: unless-stopped
    depends_on:
      - db
      - broker
    ports:
      - "8010:8000"
    volumes:
      - /home/bpc009/docker-app/paperless/webserver/data:/usr/src/paperless/data
      - /home/bpc009/docker-app/paperless/webserver/media:/usr/src/paperless/media
      - /home/bpc009/docker-app/paperless/webserver/export:/usr/src/paperless/export
      - /home/bpc009/docker-app/paperless/webserver/consume:/usr/src/paperless/consume
    environment:
      PAPERLESS_REDIS: redis://broker:6379
      PAPERLESS_DBHOST: db
# The UID and GID of the user used to run paperless in the container. Set this
# to your UID and GID on the host so that you have write access to the
# consumption directory.
      USERMAP_UID: 1000
      USERMAP_GID: 100
# Additional languages to install for text recognition, separated by a
# whitespace. Note that this is
# different from PAPERLESS_OCR_LANGUAGE (default=eng), which defines the
# language used for OCR.
# The container installs English, German, Italian, Spanish and French by
# default.
# See https://packages.debian.org/search?keywords=tesseract-ocr-&searchon=names&suite=buster
# for available languages.
      #PAPERLESS_OCR_LANGUAGES: tur ces
# Adjust this key if you plan to make paperless available publicly. It should
# be a very long sequence of random characters. You don't need to remember it.
      #PAPERLESS_SECRET_KEY: change-me
# Use this variable to set a timezone for the Paperless Docker containers. If not specified, defaults to UTC.
      #PAPERLESS_TIME_ZONE: America/Los_Angeles
# The default language to use for OCR. Set this to the language most of your
# documents are written in.
      #PAPERLESS_OCR_LANGUAGE: eng

volumes:
  data:
  media:
  pgdata:
  redisdata:
```
Alle wichtgen Pfade werden per Volume zum sichern bereitgestellt.

## Paperless Backup
Alle wichtigen Daten zum wiederherstellen liegen in folgenden Verzeichnissen
```
volumes:
      - /home/bpc009/docker-app/paperless/pgdata:/var/lib/postgresql/data

volumes:
      - /home/bpc009/docker-app/paperless/webserver/data:/usr/src/paperless/data
      - /home/bpc009/docker-app/paperless/webserver/media:/usr/src/paperless/media
      - /home/bpc009/docker-app/paperless/webserver/export:/usr/src/paperless/export
      - /home/bpc009/docker-app/paperless/webserver/consume:/usr/src/paperless/consume

```

## Installation in Docker Umgebung

Die einfachste Installation erfolgt mit dem Paperless Script.

```
bash -c "$(curl -L https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/main/install-paperless-ngx.sh)"
```

## Per Email Daten einbinden

Infos
https://www.youtube.com/watch?v=Wf2euUY-rzs

### Mehr Informationen
https://github.com/paperless-ngx/paperless-ngx

### Dokumentation
https://docs.paperless-ngx.com/

### Tutorials
https://www.youtube.com/watch?v=VBgRJHx0hPI

### Redis
https://www.youtube.com/watch?v=oASEEcGJgSY

### Dokumente automatisch digitalisieren
https://www.youtube.com/watch?v=6i0nJ8S3whM
