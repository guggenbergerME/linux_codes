# FTP Server

## Anlegen eines Volume
```
docker volume create [name]
```

## Docker run Befehl
```
docker run --detach --env FTP_PASS=123 --env FTP_USER=user --name ftp_server --publish 20-21:20-21/tcp --publish 40000-40009:40000-40009/tcp -v [VOLUME-NAME]:/home/user/ garethflowers/ftp-server
```

## FTP Ziel auslesen
```
rclone lsd [REMOTE_ZIEL:
```




### Infos
+ [Repo](https://github.com/garethflowers/docker-ftp-server)
