# osTicket installieren

## pull
docker pull osticket/osticket

```
docker run --name osticket_mysql -d -e MYSQL_ROOT_PASSWORD=secret \
 -e MYSQL_USER=osticket -e MYSQL_PASSWORD=secret -e MYSQL_DATABASE=osticket mariadb
```
