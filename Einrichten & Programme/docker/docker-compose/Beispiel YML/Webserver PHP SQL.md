# Webserver (apache) PHP SQL phpmyadmin

```
services:
    webserver:
        image: php:8-apache
        container_name: webserver
        restart: always
        ports:
          - 80:80
        volumes:
          - ./www:/var/www/html
        labels:
          NAME: "webserver"

    mysql:
        image: mysql:latest
        container_name: mysql
        restart: always
        environment:
          MYSQL_DATABASE: 'db'
          # So you don't have to use root, but you can if you like
          MYSQL_USER: 'user'
          # You can use whatever password you like
          MYSQL_PASSWORD: 'password'
          # Password for root access
          MYSQL_ROOT_PASSWORD: 'password'
        ports:
          # <Port exposed> : <MySQL Port running inside container>
          - '3306:3306'
        expose:
          # Opens port 3306 on the container
          - '3306'
          # Where our data will be persisted
        volumes:
          - ./datenbank:/var/lib/mysql

    phpmyadmin:
        image: phpmyadmin/phpmyadmin
        container_name: pma
        links:
              - mysql
        environment:

```
