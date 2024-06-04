# osTicket installieren

## docker compose
```
version: '3.9'
services:
  osticket_db:
    image: mariadb:11.3-jammy
    container_name: OsTicket_DB
    security_opt:
      - no-new-privileges:true
      - seccomp:unconfined
      - apparmor:unconfined
    environment:
      - MYSQL_ROOT_PASSWORD=qwerqwer
      - MYSQL_USER=mysqlUSER
      - MYSQL_PASSWORD=qwerqwer
      - MYSQL_DATABASE=osticketdb
    volumes:
      - /volume1/docker/osticket:/var/lib/mysql:rw
    restart: on-failure:5
 
  osticket:
    image: devinsolutions/osticket:latest
    container_name: OsTicket
    ports:
      - 6784:80
    depends_on:
      - osticket_db
    environment:
       MYSQL_USER: mysqlUSER
       MYSQL_PASSWORD: qwerqwer
       MYSQL_DATABASE: osticketdb
       MYSQL_HOST: osticket_db
       INSTALL_SECRET: Guggenberger
       INSTALL_URL: http://guggenberger.me
       INSTALL_NAME: GIMA Ticketsystem
       ADMIN_USERNAME: admin
       ADMIN_PASSWORD: qwerqwer
       ADMIN_FIRSTNAME: AdminVorname
       ADMIN_LASTNAME: AdminNachname
       ADMIN_EMAIL: ticketos@guggenberger.me
       CRON_INTERVAL: 1
       SMTP_USER: Your-own-gmail-address
       SMTP_PASSWORD: Your-own-app-password
       SMTP_HOST: smtp.gmail.com
       SMTP_PORT: 587
       SMTP_FROM: Your-own-gmail-address
       SMTP_TLS: 1
    restart: on-failure:5
```

https://mariushosting.com/how-to-install-osticket-on-your-synology-nas/
