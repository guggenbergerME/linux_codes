# Vaultwarden mit Docker installieren

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
