# Vaultwarden mit Docker installieren

## Firewall konfigurieren
Überprüfe den Status der Firewall.

```
sudo ufw status
```

Du solltest etwas wie das Folgende sehen.
```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
```

Firewall aktivieren
```
ufw enable
```

Erlaube HTTP- und HTTPs-Ports.

```
ufw allow http
ufw allow https
```


## Docker/Compose installation
```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
```

Ausführbar machen

```
chmod +x ~/.docker/cli-plugins/docker-compose
```

Version Prüfen

```
docker compose version
```

Compose löschen
```
docker image rm nginx:alpine
```

+ [Weitere Docker Compose Befehle](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-de)

## Start der installation

Repository kolonen

```
https://github.com/vineethmn/vaultwarden-docker-compose.git
```

Wechseln in den ordner

```
cd vaultwarden-docker-compose
```
Bearbeiten Sie die .env-Datei und die config.json-Datei, um Ihre Parameter zu konfigurieren. Beachten Sie, dass die Variable - SIGNUPS_ALLOWED=false auf „false“ gesetzt ist. Sie müssen dies auf „true“ ändern, um ein Administratorkonto zu erstellen, und aus Sicherheitsgründen wieder auf „false“ zurücksetzen.

Generieren Sie ein Authentifizierungstoken für die Administratorseite. Es wird empfohlen, eine lange, zufällig generierte Zeichenfolge zu verwenden. Sie können den folgenden Befehl verwenden, um ein Token zu generieren:

```
openssl rand -base64 48
```

Halten Sie dieses Token geheim, da es als Kennwort für den Zugriff auf den Admin-Bereich Ihres Servers verwendet wird.

Starten Sie den Container

```
docker compose up -d
```

Befolgen Sie die Anweisungen im [Vaultwarden-Wiki](https://github.com/dani-garcia/vaultwarden/wiki), um weitere Konfigurations- und Nutzungsdetails zu erhalten.

## Admin login

Das Login für den Admin erreicht man unter

```
http://IP:9445/admin
```


### Links
+ [Repo](https://github.com/vineethmn/vaultwarden-docker-compose/tree/main)
