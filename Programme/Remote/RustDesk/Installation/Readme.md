# RustDesk

## Installation per Docker

```
sudo docker run --name hbbr -v ./data:/root -td --net=host rustdesk/rustdesk-server hbbr
```

## Ports öffnen
Öffnen 21116 -> TCP and UDP.
```
sudo ufw allow 21116/udp
```

```
sudo ufw allow 21116/tcp
```



### Informationen
+ [rustdesk](https://rustdesk.com/docs/en/self-host/rustdesk-server-oss/docker/)


