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
      - ./docker/kuma:/app/data
    ports:
      # <Host Port>:<Container Port>
      - 3001:3001
    restart: unless-stopped
```


### Links
+ [Github](https://github.com/louislam/uptime-kuma)
