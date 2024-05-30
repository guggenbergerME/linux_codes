# netbox installieren
netbox wird per Compose installiert

### Grunddaten von github ziehen
```
git clone -b release https://github.com/netbox-community/netbox-docker.git
```
Wechseln in den Ordner
```
cd netbox-docker/
```
## docker-compose anpassen
```
sudo nano docker-compose.override.yml
```
Bei dieser Config wird netbox mit dem Port 8000 auf localhost und gemappt auf 8080

> http://localhost:8000

## Compose PULL
```
docker compose pull
docker compose up
```

### Links
> https://www.youtube.com/watch?v=AmFu0UL6Hrs
