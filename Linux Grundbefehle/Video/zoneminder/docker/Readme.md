# Zoneminder Docker install

## Image pull

```
docker pull dlandon/zoneminder.machine.learning
```

## run

```
docker run -d --name="Zoneminder" --net="bridge" --privileged="false" --shm-size="8G" -p 8443:443/tcp -p 9000:9000/tcp -p 8080:80/tcp -e TZ="Europe/Berlin" -e PUID="99" -e PGID="100" -e MULTI_PORT_START="0" -e MULTI_PORT_END="0" -v "/mnt/Zoneminder":"/config":rw -v "/mnt/Zoneminder/data":"/var/cache/zoneminder":rw dlandon/zoneminder.machine.learning
```
