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
apt install docker.io docker-compose
```

##  Docker Compose-Datei für Vaultwarden erstellen

Erstelle ein neues Verzeichnis für Vaultwarden und wechsle in dieses

```
 mkdir ~/vaultwarden
 cd ~/vaultwarden
```

Erstelle die Docker Compose-Datei und öffne sie zur Bearbeitung.

```
nano docker-compose.yml
```

Füge den folgenden Code in die Datei ein. Ersetze die Variablen DOMAIN und EMAIL durch die entsprechenden Werte.

```
version: '3'

services:
  vaultwarden:
    image: vaultwarden/server:latest
    container_name: vaultwarden
    restart: always
    environment:
      WEBSOCKET_ENABLED: "true"  # Enable WebSocket notifications.
      DOMAIN: "https://vaultwarden.example.com"
      SMTP_HOST: "<smtp.domain.tld>"
      SMTP_FROM: "<vaultwarden@domain.tld>"
      SMTP_PORT: "587"
      SMTP_SECURITY: "starttls"
      SMTP_USERNAME: "<username>"
      SMTP_PASSWORD: "<password>"
    volumes:
      - ./vw-data:/data

  caddy:
    image: caddy:2
    container_name: caddy
    restart: always
    ports:
      - 80:80  # Needed for the ACME HTTP-01 challenge.
      - 443:443
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
      - ./caddy-config:/config
      - ./caddy-data:/data
    environment:
      DOMAIN: "https://vaultwarden.example.com"  # Your domain.
      EMAIL: "admin@example.com"                 # The email address to use for ACME registration.
      LOG_FILE: "/data/access.log"
```

## Deaktivieren der Registrierung

Wenn du nicht möchtest, dass deine Vaultwarden-Installation für Benutzerregistrierungen offen ist, kannst du sie deaktivieren, indem du die folgende Variable unter dem Abschnitt environment der Docker-Kompositionsdatei hinzufügst.

```
environment:
     WEBSOCKET_ENABLED: "true"  # Enable WebSocket notifications.
	 SIGNUPS_ALLOWED: "false"
```

### Links
+ [Config](https://www.howtoforge.de/anleitung/so-installierst-du-vaultwarden-mit-docker-unter-ubuntu-22-04/)
