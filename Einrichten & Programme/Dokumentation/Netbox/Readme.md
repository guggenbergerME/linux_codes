#Netbox - Dokumentation

## Netbox installation auf Ubuntu Server

+ [https://netboxlabs.com/docs/netbox/en/stable/installation/](https://netboxlabs.com/docs/netbox/en/stable/installation/)

## Netbox - Docker Installation
```
git clone -b release https://github.com/netbox-community/netbox-docker.git
```
```
cd netbox-docker
```
```
nano docker-compose.override.yml
```
Eintragen
```
services:
  netbox:
    ports:
      - 8000:8080
```
Pakete holen
```
docker compose pull
```
Netbox starten
```
docker compose up
```

## Admin erzeugen
für das erste Login wird ein Admin benötigt
```
docker exec -it [ContainerID] /opt/netbox/netbox/manage.py createsuperuser
```
## Library
+ [Repo Sammlung von Geräten](https://github.com/netbox-community/devicetype-library/tree/master)


### Links
+ [Repo](https://github.com/netbox-community/netbox-docker?ref=packetswitch.co.uk)
+ [Demoeinrichtung](https://netbox.c3voc.de/dcim/regions/)
