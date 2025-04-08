# draw.io

## Libary für Draw.io
- [Grafcet](Bibiolotheken/Grafcet/Readme.md)

## Installation Linux
-> Linux Anwendungsverwaltung

## Installation Server
### Docker.io

    docker run -it --name="draw" --restart=always -p 8080:8080 -p 8443:8443 jgraph/drawio


draw.io per docker installieren. 
> [!WARNING]
> Port beachten
### docker compose
```
version: '3.5'
services:
  drawio:
    image: jgraph/drawio
    container_name: drawio
    restart: unless-stopped
    ports:
      - 8585:8080
      - 8443:8443
    volumes:
      - /home/bpc009/docker-app/drawio/fonts_volume:/usr/share/fonts/drawio
    environment:
      PUBLIC_DNS: domain
      ORGANISATION_UNIT: unit
      ORGANISATION: org
      CITY: city
      STATE: state
      COUNTRY_CODE: country

```
### docker backup
> [!WARNING]
> Bitte auf die richtige Schreibweise des docker Volume achten!

```
volumes:
      - /home/bpc009/docker-app/drawio/fonts_volume:/usr/share/fonts/drawio
```

### docker pull
```
docker run -it --rm --name="draw" -p 8080:8080 -p 8443:8443 jgraph/drawio
```

