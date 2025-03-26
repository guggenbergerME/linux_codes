## Netbox

Netbox ist ein kostenloses und leistungsstarkes Tool zur Verwaltung von IP-Adressen (IPAM) und Rechenzentrumsinfrastrukturen (DCIM). 
Es wird zur Speicherung von Informationen über Ihre Netzwerke, VMs, Inventare und vieles mehr verwendet. 

Es wurde ursprünglich vom Netzwerk-Engineering-Team bei DigitalOcean entwickelt. Dieses Tool ist im Django-Python-Framework geschrieben und stützt sich auf die 
PostgreSQL-Datenbank. Sein Ziel ist es, als eine domänenspezifische Quelle der Wahrheit für Netzwerkoperationen zu fungieren.

## Installation von Netbox Ubuntu 24

Clonen des [NetBox Repo](https://github.com/netbox-community/netbox-docker?ref=packetswitch.co.uk).

```
git clone https://github.com/netbox-community/netbox-docker

cd netbox-docker/
```

## docker-compose.override anpassen

    nano docker-compose.override.yml

Eintrag

```
version: '3.4'
services:
  netbox:
    ports:
    - 8000:8080
```
## NetBox starten

Bei fehlendem Start bitte sudo angebn

```
sudo docker-compose up -d
```

## Admin User anlegen

    docker-compose exec netbox /opt/netbox/netbox/manage.py createsuperuser


+ [Installation von Netbox per Docker](https://github.com/netbox-community/netbox-docker)

