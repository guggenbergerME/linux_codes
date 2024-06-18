# Uptime Kuma

## Installation mit Compose
Durch das auslgern der Systemdatein in ein Volume kann Kuma gesichert werden.
```
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    volumes:
      - /home/bpc009/docker-app/kuma:/app/data:/app/data
    ports:
      # <Host Port>:<Container Port>
      - 3001:3001
    restart: unless-stopped
```
## Backup von KUMA
>[!TIP]
>Auf das Backup Verzeichnis achten
Im Ordner ```/home/bpc009/docker-app/kuma``` sind alles relevanten Darten gespeichert und muss in ein Backup eingefügt werden

### Links
+ [Github](https://github.com/louislam/uptime-kuma)
