# Fehler 403

Ändern der Datei docker-compose.env (Docker Installation)

```
/root/paperless-ngx/docker/compose
```
oder in der docker-compose.yml
```
    env_file: docker-compose.env
    environment:
      PAPERLESS_URL: https://weblink.info
      PAPERLESS_REDIS: redis://broker:6379
      PAPERLESS_DBENGINE: mariadb
      PAPERLESS_DBHOST: db
      PAPERLESS_DBUSER: paperless # only needed if non-default username
      PAPERLESS_DBPASS: paperless # only needed if non-default password
      PAPERLESS_DBPORT: 3306
      PAPERLESS_TIKA_ENABLED: 1
      PAPERLESS_TIKA_GOTENBERG_ENDPOINT: http://gotenberg:3000
      PAPERLESS_TIKA_ENDPOINT: http://tika:9998

  gotenberg:
```

Eintragen der Paperless URL

```
PAPERLESS_URL=https://DOMAINLINK
```

