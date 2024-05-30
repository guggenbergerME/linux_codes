# Portainer installieren

Portainer ist ein vielseitiges und benutzerfreundliches Open-Source-Tool zur Verwaltung von Docker-Umgebungen. 
Es bietet Docker-Anfängern und erfahrenen Benutzern eine intuitive Methode zur Konfiguration, Überwachung und Verwaltung von 
Containern, Netzwerken, Volumes und Docker-Images.

### Docker HUB
```
https://hub.docker.com/r/portainer/portainer-ce
```
### Portainer installieren
Im ersten Schritt wird ein Volume für Portainer unter Docker bereitgestellt, das von Portainer innerhalb des 
Portainer-Containers nach „/data“ gemountet und verwendet wird.
```
docker volume create portainer_data
```
### Portainer Container erzeugen
```
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

Zu erreichen das WebGUI unter
```
http://IP_ADRESSE:9000/
```
## Portainer aktualisieren
Selbstverständlich gibt es auch bei Portainer Updates bzw. neue Versionen, die man einspielen sollte. Aber wie macht man das? Ein laufender Portainer-Container kann nicht aus Portainer heraus aktualisiert werden (Henne-Ei-Problem).

Die Aktualisierung des Portainer-Containers erfolgt über die Kommandozeile.

Zuerst zeigen wir uns alle laufenden Container an:

### Container Id anzeigen und löschen
```
docker container ls
```
Dann wird der laufende Portainer-Container gestoppt:

### Stop portainer
```
docker stop [ContainerID]
```
Anschließend wird über die Id der gestoppt Container gelöscht:

### Container löschen
```
docker container rm ID
```
Grds. ist es dabei ausreichend Ids mit den ersten Zeichen anzugeben, sofern diese eindeutig sind.

Dasselbe erfolgt jetzt für die Images. Auch diese lassen wir uns anzeigen und löschen das Portainer-Image über die entsprechende Id.

### Images anzeigen und löschen
```
docker image ls
docker image rm ID
```
Anschließend wird Portainer wie eingangs beschrieben neu installiert. Dabei wird das persistente Volume genutzt,
das bei der initialen Installation angelegt wurde, so dass uns nach einem Update alle Einstellungen, die zuvor gemacht wurden, wieder zur Verfügung stehen:

### Portainer neu installieren
```
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
Anschließend können wir uns wieder mit den bekannten Zugangsdaten in der Benutzeroberfläche anmelden.
