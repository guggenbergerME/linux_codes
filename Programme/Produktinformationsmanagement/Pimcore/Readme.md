# Pimcore

## Installation mit Docker

[Docker installieren](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20%26%20Programme/docker/Installieren)


Docker-basierte Installation

Mit Docker können Sie eine neue Pimcore-Installation einrichten. Sie brauchen keine PHP-Umgebung mit Komponist installiert zu haben.
Voraussetzungen
​

    Ihr Benutzer muss Dockerbefehle (direkt oder über sudo) ausführen dürfen.
    Sie müssen Docker installiert haben.
    Ihr Benutzer muss die Dateiberechtigung ändern (direkt oder über sudo).

Folgen Sie diesen Schritten
​

    Wählen Sie ein Paket zum Installieren und Erstellen des Projekts über Komponist
        Wir bieten 2 verschiedene Montagepakete an:

# demo package with exemplary blueprints (`pimcore/demo`)
docker run -u `id -u`:`id -g` --rm -v `pwd`:/var/www/html pimcore/pimcore:php8.2-latest composer create-project pimcore/demo my-project

# empty skeleton package for experienced developers (`pimcore/skeleton`).
docker run -u `id -u`:`id -g` --rm -v `pwd`:/var/www/html pimcore/pimcore:php8.2-latest composer create-project pimcore/skeleton my-project

    Gehen Sie zu Ihrem neuen Projekt cd my-project/

    Teil des neuen Projekts ist eine Docker-Fettdatei
        Run echo `id -u`:`id -g`um Ihren lokalen Benutzer und Gruppen-ID abzurufen
        Öffnen Sie die docker-compose.yamlDatei in einem Editor, unbekeuten user: '1000:1000'Linien und Aktualisierung der IDs bei Bedarf
        Starten Sie die benötigten Dienstleistungen mit docker compose up -d

    Installieren Sie Pimcore und initialisieren Sie die DB docker compose exec php vendor/bin/pimcore-install --mysql-host-socket=db --mysql-username=pimcore --mysql-password=pimcore --mysql-database=pimcore(Für Demo-Paket kann die Installation eine Weile dauern)


### Links

+ [Anleitung](https://docs.pimcore.com/platform/Pimcore/Getting_Started/Installation/Docker_Based_Installation)
