# Paperless-ngx

## Installation mit Compose
```
version: "2.1"
services:
  paperless-ngx:
    image: lscr.io/linuxserver/paperless-ngx:latest
    container_name: paperless-ngx
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/New_York
      - REDIS_URL= #optional
    volumes:
      - /home/bpc009/docker-app/Paperless-ngx/config:/config
      - /home/bpc009/docker-app/Paperless-ngx/data:/data
    ports:
      - 8000:8000
    restart: unless-stopped
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
