# Pimcore

## Installation mit Docker

[Docker installieren](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20%26%20Programme/docker/Installieren)


## Docker-basierte Installation

### Mit Demo Packet
```
docker run -u `id -u`:`id -g` --rm -v `pwd`:/var/www/html pimcore/pimcore:php8.2-latest composer create-project pimcore/demo my-project
```

### Leeres Projekt
```
docker run -u `id -u`:`id -g` --rm -v `pwd`:/var/www/html pimcore/pimcore:php8.2-latest composer create-project pimcore/skeleton my-project
```

Gehen Sie zu Ihrem neuen Projekt cd my-project/

Teil des neuen Projekts ist eine Docker-Fettdatei
        
Run ```echo `id -u`:`id -g` ```um Ihren lokalen Benutzer und Gruppen-ID abzurufen

Öffnen Sie die ```docker-compose.yaml``` Datei in einem Editor, ändern die die Zeile ```user: '1000:1000'``` Linien und Aktualisierung der IDs bei Bedarf

Starten Sie die benötigten Dienstleistungen mit 

    docker compose up -d

Installieren Sie Pimcore und initialisieren Sie die DB 

```
docker compose exec php vendor/bin/pimcore-install --mysql-host-socket=db --mysql-username=pimcore --mysql-password=pimcore --mysql-database=pimcore
```

(Für Demo-Paket kann die Installation eine Weile dauern)

### Links

+ [Anleitung](https://docs.pimcore.com/platform/Pimcore/Getting_Started/Installation/Docker_Based_Installation)
