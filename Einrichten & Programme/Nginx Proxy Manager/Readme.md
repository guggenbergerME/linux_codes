# Installation

## Docker installieren
+ [Docker install](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20%26%20Programme/docker/Installieren)

## Installation per Compose

File **docker-compose.yml**

```
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      # These ports are in format <host-port>:<container-port>
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
      # Add any other Stream port you want to expose
      # - '21:21' # FTP

    # Uncomment the next line if you uncomment anything in the section
    # environment:
      # Uncomment this if you want to change the location of
      # the SQLite DB file within the container
      # DB_SQLITE_FILE: "/data/database.sqlite"

      # Uncomment this if IPv6 is not enabled on your host
      # DISABLE_IPV6: 'true'

    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```

Starten per portainer oder terminal

```
docker compose up -d
```

## Erstes Login
```
[IP]:81/login
```

Default login

```
Email:    admin@example.com
Password: changeme
```

## Firewal rules
+ [Tutorial](https://homenetworkguy.com/how-to/deploy-nginx-proxy-manager-in-dmz-with-opnsense/)
