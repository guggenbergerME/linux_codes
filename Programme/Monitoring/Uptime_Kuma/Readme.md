# Uptime Kuma

## Installation mit Docker
```
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1
```

## Installation mit Compose
Durch das auslgern der Systemdatein in ein Volume kann Kuma gesichert werden.
```
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    volumes:
      - /home/bpc009/kuma:/app/data
    ports:
      # <Host Port>:<Container Port>
      - 3001:3001
    restart: unless-stopped
```
## Backup von KUMA
Im Ordner ```/home/bpc009/kuma``` sind alles relevanten Darten gespeichert und muss in ein Backup eingefügt werden

### Links
+ [Github](https://github.com/louislam/uptime-kuma)
