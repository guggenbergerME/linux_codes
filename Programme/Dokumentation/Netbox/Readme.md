#Netbox - Dokumentation

## Docker Installation
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

### Links
+ [Repo](https://github.com/netbox-community/netbox-docker?ref=packetswitch.co.uk)
