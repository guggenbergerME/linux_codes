# PiHole installieren

Pi-hole ist ein kleines, aber mächtiges Werkzeug, das dazu beitragen kann, den Internetverkehr von Werbung und anderen unerwünschten Inhalten zu säubern und damit die Privatsphäre der Nutzer zu schützen. Es handelt sich hierbei um eine Open-Source-Software, die auf einem Raspberry Pi oder einem anderen Linux-basierten System installiert werden kann.

Eine der wichtigsten Funktionen von Pi-hole ist die Möglichkeit, Werbung auf allen Geräten im Netzwerk zu blockieren. Dies geschieht, indem Pi-hole DNS-Anfragen analysiert und unerwünschte Domains blockiert. Auf diese Weise können Nutzer sicher sein, dass sie nicht von lästiger Werbung belästigt werden, während sie im Internet surfen.

Pi-hole bietet auch eine Vielzahl anderer nützlicher Funktionen. Zum Beispiel können Nutzer eine Whitelist oder Blacklist von Domains erstellen, um bestimmte Websites zu erlauben oder zu blockieren. Es gibt auch die Möglichkeit, Statistiken zu überwachen, um zu sehen, wie viele Anfragen blockiert wurden und welche Domains am häufigsten geblockt wurden.

## Pi-hole installieren

Logge dich als Root auf dem vServer ein und stelle sicher, dass sich alle Pakete auf dem neuesten Stand befinden:
```
apt-get update && apt-get upgrade -y
```
Falls Curl noch nicht installiert ist, wird dieses Paket nun einfach mit folgendem Befehl installiert:
```
apt-get install curl -y
```
Verwende nun folgenden Befehl, um Pi-hole zu installieren:
```
curl -sSL https://install.pi-hole.net | bash
```
Das Script prüft zunächst den angemeldet Benutzer und installiert alle notwendigen Pakete. Dann beginnt das Setup. Bestätige zunächst die Infos.

Hat der Server mehrere Netzwerk-Schnittstellen, muss die richtige ausgewählt werden. Diese ist meistens eth0 unter Debian oder ens192 unter Ubuntu.
