# Warpinator

Warpinator teilt Daten nicht nur im Heimnetz zwischen Geräten mit Linux und Android, sondern funktioniert auch im Austausch mit den Gästen in virtuellen Maschinen.

Heute besitzen die meisten Menschen mehrere IT-Geräte wie PCs, Notebooks, Heimserver, Tablets und Smartphones. Es gibt viele Möglichkeiten, um im Heimnetz Datenbestände synchron zu halten oder einzelne Inhalte zu teilen. Das reicht vom manuellen Einsatz von Rsync im Terminal über den Dateimanager, der andere Geräte im Netzwerk einbindet, bis hin zu Lösungen wie Syncthing zur automatisierten Synchronisation von Datenbeständen. Eine kürzlich neu hinzugekommene Möglichkeit, Daten schnell über eine einfache grafische Oberfläche zwischen Geräten im heimischen Netzwerk zu teilen, ist das kleine Tool Warpinator

## Warpinator im Heimnetz

Das in Python 3 geschriebene Warpinator wurde bei Linux Mint auf der Grundlage des nicht mehr weiterentwickelten Ubuntu-Tools Giver erstellt und bietet eine einfache grafische Oberfläche, um Dateien und Verzeichnisse im Heimnetz mit anderen Geräten zu teilen. Erstmals veröffentlicht wurde es mit Linux Mint 20 im Sommer 2020.

Seit Linux Mint 20.2 ein Jahr später erlaubt die Anwendung beim Vorhandensein mehrerer Netzwerkschnittstellen deren Auswahl – wichtig etwa für den Einsatz in virtuellen Maschinen. Zudem implementierten die Entwickler eine Datenkomprimierung, die die Übertragungen bis zu drei Mal schneller machte. Die effektiv zu erreichende Transferrate hängt von der Qualität des (W)LAN im Heimnetz ab; bei unseren Tests erreichten wir durchgängig mindestens 50 MByte/s.

## Installation Flathub

```
flatpak install flathub org.x.Warpinator
```
## Aufrufen
```
flatpak run org.x.Warpinator
```
