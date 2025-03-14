# Wordpress installation mit db

## Docker installieren

    apt-get install docker.io

## Anlegen einse Netzwerks
```
docker network create wordpress-network
```

## MariaDb Volumen und Container erzeugen

Als erstes erzeugen wir eine Mariadb Datenbank

```
$ docker volume create --name mariadb_data
docker run -d --name mariadb \
  --env ALLOW_EMPTY_PASSWORD=yes \
  --env MARIADB_USER=bn_wordpress \
  --env MARIADB_PASSWORD=bitnami \
  --env MARIADB_DATABASE=bitnami_wordpress \
  --network wordpress-network \
  --volume mariadb_data:/bitnami/mariadb \
  bitnami/mariadb:latest

```

## Wordpress Volumen und Container erzeugen

Danach den eigentliche WP Container

```
$ docker volume create --name wordpress_data
docker run -d --name wordpress \
  -p 8080:8080 -p 8443:8443 \
  --env ALLOW_EMPTY_PASSWORD=yes \
  --env WORDPRESS_DATABASE_USER=bn_wordpress \
  --env WORDPRESS_DATABASE_PASSWORD=bitnami \
  --env WORDPRESS_DATABASE_NAME=bitnami_wordpress \
  --network wordpress-network \
  --volume wordpress_data:/bitnami/wordpress \
  bitnami/wordpress-nginx:latest
```

# Login
user | bitnami

## Docker Befehle

+mehr [Befehle](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20&%20Programme/docker/befehle#readme)

