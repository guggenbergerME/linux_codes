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

## Compose PULL
```
docker compose pull
docker compose up
```

## Admin anlegen
```
docker compose exec netbox /opt/netbox/netbox/manage.py createsuperuser
```

## WebGUI
Port ist abhängig von den Eingaben in der yml Datei.
```
http://0.0.0.0:8000/
```

### Links
> https://www.youtube.com/watch?v=AmFu0UL6Hrs
