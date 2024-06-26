# osTicket installieren

## docker compose
```
version: '3'
services:
  mysql:
    image: mysql:5.7
    volumes:
      - "/home/bpc009/docker-app/osticket-db1:/var/lib/mysql"
    environment:
      MYSQL_ROOT_PASSWORD: Please-Change-Me-Im-Root
      MYSQL_DATABASE: osticket
      MYSQL_USER: osticket
      MYSQL_PASSWORD: Please-Change-Me
  osticket:
    image: devinsolutions/osticket:latest
    volumes:
      - '/home/bpc009/docker-app/osticket-app:/var/lib/osticket'
    environment:
      MYSQL_HOST: mysql
      MYSQL_DATABASE: osticket
      MYSQL_USER: osticket
      MYSQL_PASSWORD: Please-Change-Me
    ports:
      - 8888:80
    restart: on-failure

volumes:
  osticket-db1:
    driver: local
  osticket-app:
    driver: local

```

## Admin login
```
http://[IP]:8888/scp/login.php
```

## Login

username: ostadmin

password: Admin1

## Backup der Daten
in den nachfolgenden Ordner sind alle relevanten Daten abgelegt um das osTicket wiederherzustellen.
Diese Daten könne nun per borg oder rClone gesichert werden.
```
/home/bpc009/docker-app/osticket-db1:/var/lib/mysql
/home/bpc009/docker-app/osticket-app:/var/lib/osticket
```

## Netzwerke auf docker
+ Angelegt wird ```osticket_default```
+ Driver brigde
+ IPV4 Gateway - 172.20.0.1

## Datensicherung
osTicket verfügt über kein eigenes Backup. Entweder sichert man die ganze Maschine oder nur speziell die db.
Je nach docker Version ist die db unter folgendem Verzeichnis als Volumen zu finden.
```
/var/lib/docker/volumes/osticket_osticket-db1/_data
```


### Links

+ https://hub.docker.com/r/osticket/osticket
