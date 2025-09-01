# Webserver (apache) PHP SQL phpmyadmin


Erstellen per nano von **docker-compose.yml** und **Dockerfile**

Neuaufbau
```
docker compose up --build
```

[Mehr Befehle](https://docs.docker.com/reference/cli/docker/compose/up/)

Starten
```
docker compose up -d
```

Herunterfahren
```
docker compose down
```

```
services:
    webserver:
        container_name: webserver
        build:
          context: .
          dockerfile: Dockerfile
        restart: always
        ports:
          - 80:80
        volumes:
          - ./www:/var/www/html
        labels:
          NAME: "webserver"
        depends_on:
          - mysql

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
              PMA_HOST: mysql
              PMA_PORT: 3306
              PMA_ARBITRARY: 1
        restart: always
        ports:
              - 8081:80
```

## Dockerfile

Im Dockerfile können weitere PHP Plugins installiert werden.

```
FROM php:8.2-apache
RUN apt update
RUN pecl install redis && docker-php-ext-enable redis
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
```
