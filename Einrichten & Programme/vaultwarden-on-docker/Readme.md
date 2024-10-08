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

## Caddy-Datei für Vaultwarden erstellen

Nachdem wir nun Vaultwarden konfiguriert haben, erstellen wir eine Caddy-Datei für Vaultwarden und öffnen sie zur Bearbeitung.

```
nano Caddyfile
```

Füge den folgenden Code in die Datei ein.

```
{$DOMAIN}:443 {
  log {
    level INFO
    output file {$LOG_FILE} {
      roll_size 10MB
      roll_keep 10
    }
  }

  # Use the ACME HTTP-01 challenge to get a cert for the configured domain.
  tls {$EMAIL}

  # This setting may have compatibility issues with some browsers
  # (e.g., attachment downloading on Firefox). Try disabling this
  # if you encounter issues.
  encode gzip

  # The file size is set to 500MB to support the Vaultwarden (Bitwarden) Send feature.
  request_body {
       max_size 500MB
  }
  
  header {
       # Enable cross-site filter (XSS) and tell browser to block detected attacks
       X-XSS-Protection "1; mode=block"
       # Disallow the site to be rendered within a frame (clickjacking protection)
       X-Frame-Options "DENY"
       # Prevent search engines from indexing (optional)
       X-Robots-Tag "none"
       # Server name removing
       -Server
  }

  # Notifications redirected to the WebSocket server
  reverse_proxy /notifications/hub vaultwarden:3012

  # Proxy everything else to Rocket
  reverse_proxy vaultwarden:80 {
       # Send the true remote IP to Rocket, so that vaultwarden can put this in the
       # log, so that fail2ban can ban the correct IP.
       header_up X-Real-IP {remote_host}
  }
}
```

Speichere die Datei, indem du Strg + X drückst und Y eingibst, wenn du dazu aufgefordert wirst.

## Vaultwarden starten

Starte den Vaultwarden-Docker-Container.

```
docker-compose up -d
```

Du kannst den Status des Containers mit dem folgenden Befehl überprüfen.

```
docker ps
```

### Links
+ [Config](https://www.howtoforge.de/anleitung/so-installierst-du-vaultwarden-mit-docker-unter-ubuntu-22-04/)
