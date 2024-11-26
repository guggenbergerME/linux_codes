# Mosquitto unter Ubuntu installieren

## IP Bereich des Brokers
Leg die IP an das Ende des Sensorbereichs

## Erforderliche Abhängigkeiten installieren

Bevor du beginnst, solltest du alle Systempakete aktualisieren und auf die neueste Version upgraden. Du kannst sie aktualisieren, indem du den folgenden Befehl ausführst:
```
apt update -y
apt upgrade -y
```
Nachdem du alle Pakete aktualisiert hast, führe den folgenden Befehl aus, um die anderen benötigten Pakete zu installieren:
```
apt-get install curl gnupg2 wget git apt-transport-https ca-certificates -y
```
Sobald alle erforderlichen Pakete installiert sind, kannst du mit dem nächsten Schritt fortfahren.

## Mosquitto Server installieren

Standardmäßig ist das Mosquitto-Paket nicht in der Ubuntu 22.04 Standard-Depo verfügbar. Daher musst du das offizielle Repository von Mosquitto zum APT hinzufügen. Du kannst es mit dem folgenden Befehl hinzufügen:
```
add-apt-repository ppa:mosquitto-dev/mosquitto-ppa -y
```
Sobald das Repository zum APT hinzugefügt wurde, kannst du es mit dem folgenden Befehl installieren:
```
apt install mosquitto mosquitto-clients -y
```
Sobald die Installation abgeschlossen ist, kannst du den Status von Mosquitto mit dem folgenden Befehl überprüfen:
```
systemctl status mosquitto
```
Du solltest die folgende Ausgabe sehen:
```
? mosquitto.service - Mosquitto MQTT Broker
     Loaded: loaded (/lib/systemd/system/mosquitto.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2022-12-06 04:50:33 UTC; 8s ago
       Docs: man:mosquitto.conf(5)
             man:mosquitto(8)
    Process: 5491 ExecStartPre=/bin/mkdir -m 740 -p /var/log/mosquitto (code=exited, status=0/SUCCESS)
    Process: 5492 ExecStartPre=/bin/chown mosquitto:mosquitto /var/log/mosquitto (code=exited, status=0/SUCCESS)
    Process: 5493 ExecStartPre=/bin/mkdir -m 740 -p /run/mosquitto (code=exited, status=0/SUCCESS)
    Process: 5494 ExecStartPre=/bin/chown mosquitto:mosquitto /run/mosquitto (code=exited, status=0/SUCCESS)
   Main PID: 5495 (mosquitto)
      Tasks: 1 (limit: 2242)
     Memory: 1.3M
        CPU: 23ms
     CGroup: /system.slice/mosquitto.service
             ??5495 /usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf

Dec 06 04:50:32 ubuntu2204 systemd[1]: Starting Mosquitto MQTT Broker...
Dec 06 04:50:33 ubuntu2204 systemd[1]: Started Mosquitto MQTT Broker.
```

## MQTT-Verwaltungspasswort erstellen

Aus Sicherheitsgründen wird empfohlen, eine Passwortauthentifizierung für MQTT zu konfigurieren.

Richten wir einen Admin-Benutzer und ein Passwort mit dem folgenden Befehl ein:
```
mosquitto_passwd -c /etc/mosquitto/passwd hitesh
```
Setze ein Passwort wie unten gezeigt:
```
Password: 
Reenter password: 
```
Als Nächstes bearbeitest du die MQTT-Konfigurationsdatei und definierst die Port- und Passwortdatei.
```
nano /etc/mosquitto/conf.d/default.conf
```
Füge die folgenden Zeilen hinzu:
```
listener 1883
password_file /etc/mosquitto/passwd
```
Speichere und schließe die Datei und starte den Mosquitto-Dienst neu, um die Änderungen zu übernehmen.
```
systemctl restart mosquitto
```






+ [Anleiung zur Installation](https://www.howtoforge.de/anleitung/so-installierst-du-mosquitto-mqtt-server-unter-ubuntu-22-04/)
