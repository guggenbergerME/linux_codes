# osTicket installieren

## pull
docker pull osticket/osticket

```
docker run --name osticket_mysql -d -e MYSQL_ROOT_PASSWORD=secret \
 -e MYSQL_USER=osticket -e MYSQL_PASSWORD=secret -e MYSQL_DATABASE=osticket mariadb
```
Now run this image and link the MySQL container.
```
docker run --name osticket -d --link osticket_mysql:mysql -p 8080:80 osticket/osticket
```
