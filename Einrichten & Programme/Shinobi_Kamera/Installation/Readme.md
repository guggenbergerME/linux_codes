# Shinobi installieren mit Docker

## Installieren von Github

**Download Repo**
```
git clone https://gitlab.com/Shinobi-Systems/ShinobiDocker.git
```

## Installation

Anpassen der Datei **docker-compose-main.yml**.

### Lokales Volumen anpassen
```
volumes:
      - $HOME/Shinobi:/home/Shinobi
```

Script ausführbar machen
```
sudo chmod +x setup_and_run.sh
```

Installationsscript starten
```
./setup_and_run.sh
```

## Erstes Login
```
http://YOUR_SHINOBI_SERVER_IP_ADDRESS:8080/super
```

Login
User
```
admin@shinobi.video
```
Passwort
```
admin
```

## Benutzer Account anlegen
Anlegen eins Benutzer Accounts.
Dashboard
```
 http://[YOUR-IP]:8080/
```
