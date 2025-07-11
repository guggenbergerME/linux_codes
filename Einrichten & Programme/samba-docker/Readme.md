# Samba Docker installation

## Docker installieren
+ [Docker installation auf Ubuntu System](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20%26%20Programme/docker/Installieren)


## Repo - samba 

Die Verwaltung der Rechte und Benutzer wird in dieser Repo über die yml von Docker erledigt.

        nano docker-compose.yml

Clonen der Repo

    git clone https://github.com/ServerContainers/samba.git

Installation und starten

        docker compose up -d

Compose beenden

        docker compose stop

Lesen der Logfiles

        docker compose logs -f --tail 100

## SMB Ordner einbinden

Einbinden des SMB File Servers

        smb://[IP DES SERVERS]

### Tutorial
+ [Info Video](https://www.youtube.com/watch?v=8ByeVA5GCZY)
