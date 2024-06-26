

```
version: '3'

services:

  mysql_osticket:
    container_name: mysql_osticket
    hostname: mysql_osticket.local
    image: mysql
    environment:
      - MYSQL_DATABASE=osticket
      - MYSQL_USER=osticket
      - MYSQL_PASSWORD=osticket
      - MYSQL_ROOT_PASSWORD=password
    command: ["mysqld", "--default-authentication-plugin=mysql_native_password"]
    volumes:
      - ./volumes/mysql:/var/lib/mysql
      - ./osticketdb.sql.gz:/docker-entrypoint-initdb.d/backup.sql.gz:ro
    networks:
      - default

  app_osticket:
    container_name: app_osticket
    build:
      context: .
    depends_on:
      - mysql_osticket
    expose:
      - 80
    environment:
      - VIRTUAL_HOST=${DOMAIN}
      - LETSENCRYPT_HOST=${DOMAIN}
      - APPHOST=http://localhost:80
      - APPHTTPS=false
    volumes:
      - ./volumes/attachments:/var/www/html/attachments:rw
      - ./volumes/plugins:/var/www/html/include/plugins:rw
      - ./volumes/ost-config.php:/var/www/html/include/ost-config.php:rw
    networks:
      - nginx-proxy
      - default

networks:
  default:
    driver: "bridge"
  nginx-proxy:
    external:
      name: nginx-proxy
```

[Quelle](https://github.com/tiredofit/docker-osticket/tree/main/examples)
