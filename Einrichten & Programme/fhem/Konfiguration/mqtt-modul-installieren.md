# FHEM – MQTT Modul installieren

Um das Update der Paketverwaltung zu starten müsst ihr folgenden Befehl eingeben.
```
sudo apt-get update && sudo apt-get upgrade
```

## Perl MQTT Pakete installieren

Damit FHEM mit dem MQTT Server kommunizieren kann müssen zwei Perl Paket installiert werden.
Dazu müsst ihr euch mit Putty auf dem RasPi einloggen und folgende Befehle eingeben:
```
sudo cpan install Net::MQTT:Simple
sudo cpan install Net::MQTT:Constants
```
