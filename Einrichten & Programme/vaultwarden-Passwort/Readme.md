# vaultwarden

## Installation Ubuntu
+ [Anleitung](https://www.howtoforge.de/anleitung/so-installierst-du-vaultwarden-mit-docker-unter-ubuntu-22-04/)

## Installation per Docker

```
docker pull vaultwarden/server:latest
```

```
docker run -d --name vaultwarden -v /vw-data/:/data/ --restart unless-stopped -p 80:80 vaultwarden/server:latest
```
## Compose Anwendungen
+ [Docker Compose](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20&%20Programme/docker/docker-compose/Befehle)
