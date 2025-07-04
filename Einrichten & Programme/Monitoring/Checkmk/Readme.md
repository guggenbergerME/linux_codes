# Checkmk

Checkmk ist eine in Python und C++ entwickelte Software für das Service-Monitoring von IT-Infrastruktur. Sie wird zur Überwachung von Server, Netzwerk, 
Applikationen, Public Clouds, Containern, Speicher, Datenbanken und Umweltsensoren genutzt.

## Checkmk RAW Edition - Docker Container Installation
Die Installation von Docker auf einem Server ist eine Voraussetzung (siehe Docker Installation unter Debian 12).
+ [Docker installation](https://github.com/guggenbergerME/linux_codes/tree/main/Einrichten%20%26%20Programme/docker/Installieren)

### Container (Custom-Parameter)
Achtung wir geben gleich das Default-Passwort mit an, damit der Login sofort funktioniert, andernfalls gibt es Schwierigkeiten beim Einloggen. Achtung Sie müssen folgenden Parameter bei Ihnen ändern:
```
-p 8006:5000 (dies ist der Port für den Aufruf der Web-UI, Default ist normalerweise 8080:5000)
-p 8007:8000 (dies ist der Port für die Agent-Kommunikation, Default ist normalerweise 8000:8000)
-e CMK_PASSWORD='relation' (hier wird das Passwort für den Web-UI User cmkadmin festgelegt)
-e MAIL_RELAY_HOST='mail.thomas-krenn.com' (bitte geben Sie hier Ihren Mail-Server an, sofern dieser als Relay-Host verwendet werden kann)
```

```
docker container run -dit -p 8006:5000 -p 8007:8000 --tmpfs /opt/omd/sites/cmk/tmp:uid=1000,gid=1000 -v monitoring:/omd/sites --name monitoring -v /etc/localtime:/etc/localtime:ro -e CMK_PASSWORD='relation' -e MAIL_RELAY_HOST='mail.thomas-krenn.com' --restart always checkmk/check-mk-raw:2.2.0-latest
```

## Webinterface
Mittels **http://IP-DES-DOCKER-SERVERS:8006**, wir haben hier den Custom Port 8006 verwendet, kann der Aufruf der Web-UI getestet werden.

## Login-Daten
Einloggen kann man sich in der Login Maske mit den folgenden Daten. Achtung: das Passwort ist dieses, welches Sie am Anfang beim Starten des Containers vergeben haben!

User: cmkadmin
Passwort: relation

### Links
+ [Download](https://checkmk.com/download)
