# Zoneminder Docker install

## Image pull

```
docker pull dlandon/zoneminder.machine.learning
```

## run

```
docker run -d --name="Zoneminder" --net="bridge" --privileged="false" --shm-size="8G" -p 8443:443/tcp -p 9000:9000/tcp -p 8080:80/tcp -e TZ="Europe/Berlin" -e PUID="99" -e PGID="100" -e MULTI_PORT_START="0" -e MULTI_PORT_END="0" -v "/mnt/Zoneminder":"/config":rw -v "/mnt/Zoneminder/data":"/var/cache/zoneminder":rw dlandon/zoneminder.machine.learning
```

## Docker Compose

Ertsellen einer yml Datei in einem Ordner 

    nano docker-compose.yml

```
version: '3'
services:
  zoneminder:
    image: dlandon/zoneminder.machine.learning
    container_name: Zoneminder
    privileged: false
    shm_size: 8G
    ports:
      - '8443:443/tcp'
      - '9000:9000/tcp'
      - '8080:80/tcp'
    environment:
      - TZ=America/New_York
      - PUID=$PGID
      - PGID=$PGID
      - MULTI_PORT_START=0
      - MULTI_PORT_END=0
    volumes:
      - /mnt/Zoneminder:/config:rw
      - /mnt/Zoneminder/data:/var/cache/zoneminder:rw
```
