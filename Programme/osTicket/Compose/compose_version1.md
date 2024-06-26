```
version: '3'

services:

  osticket-app:
    image: tiredofit/osticket
    container_name: osticket-app
    labels:
      - traefik.enable=true
      - traefik.http.routers.osticket-app.rule=Host(`osticket.example.com`)
      - traefik.http.services.osticket-app.loadbalancer.server.port=80
    volumes:
      - ./data/:/www/osticket
      - ./logs/:/www/logs
    environment:
      - TIMEZONE=America/Vancouver
      - CONTAINER_NAME=osticket-app

      - CRON_INTERVAL=10

      - DB_HOST=osticket-db
      - DB_NAME=osticket
      - DB_USER=osticket
      - DB_PASS=password

      - SMTP_HOST=localhost
      - SMTP_PORT=25
      - SMTP_FROM=osticket@example.com
      - SMTP_TLS=0
      - SMTP_USER=osticket@example.com
      - SMTP_PASS=password

      - INSTALL_SECRET=somerandomlargecharacterstring
      - INSTALL_EMAIL=osticket@example.com
      - INSTALL_NAME=OSTicket Helpdesk

      - ADMIN_FIRSTNAME=Admin
      - ADMIN_LASTNAME=User
      - ADMIN_EMAIL=admin@example.com
      - ADMIN_USER=ostadmin
      - ADMIN_PASS=Password123
    networks:
      - proxy
      - services
    restart: always

  osticket-db:
    image: tiredofit/mariadb:10.11
    container_name: osticket-db
    volumes:
      - ./db:/var/lib/mysql
    environment:
      - TIMEZONE=America/Vancouver
      - CONTAINER_NAME=osticket-db

      - ROOT_PASS=securepassword
      - DB_NAME=osticket
      - DB_USER=osticket
      - DB_PASS=password
    networks:
      - services
    restart: always

  osticket-db-backup:
    container_name: osticket-db-backup
    image: tiredofit/db-backup:latest
    volumes:
      - ./dbbackup:/backup
    environment:
      - TIMEZONE=America/Vancouver
      - CONTAINER_NAME=osticket-db-backup
      - DB_HOST=osticket-db
      - DB_TYPE=mariadb
      - DB_NAME=osticket
      - DB_USER=osticket
      - DB_PASS=userpassword
      - DB_DUMP_FREQ=1440
      - DB_DUMP_BEGIN=0000
      - DB_CLEANUP_TIME=8640
    networks:
      - services
    restart: always

networks:
  proxy:
    external: true
  services:
    external: true

```
