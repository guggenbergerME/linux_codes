# Vaultwarden mit Docker installieren

## Firewall konfigurieren
Überprüfe den Status der Firewall.

```
sudo ufw status
```

Du solltest etwas wie das Folgende sehen.
```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
```

Firewall aktivieren
```
ufw enable
```

Erlaube HTTP- und HTTPs-Ports.

```
ufw allow http
ufw allow https
```


## Docker insstallation
```
apt install docker.io
```

## Vaultwarden Ordner anlegen
```
 mkdir ~/vaultwarden
 cd ~/vaultwarden
```

## Docker Compose erzeugen
```
nano docker-compose.yml
```

 Composebefehle

 ```
 version: '3'

 services:
   vaultwarden:
     image: vaultwarden/server:latest
     container_name: vaultwarden
     restart: always
     environment:
       - WEBSOCKET_ENABLED=true
     volumes:
       - ./vw-data:/data

   caddy:
     image: caddy:2
     container_name: caddy
     restart: always
     ports:
       - 80:80
       - 443:443
     volumes:
       - ./Caddyfile:/etc/caddy/Caddyfile:ro
       - ./caddy-config:/config
       - ./caddy-data:/data
     environment:
       - DOMAIN=
       - EMAIL=
       - LOG_FILE=/data/access.log
```
