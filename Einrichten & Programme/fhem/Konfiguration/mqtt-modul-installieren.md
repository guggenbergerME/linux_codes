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
```
```
sudo cpan install Net::MQTT:Constants
```

## FHEM neu starten

Damit die neu installierten Pakete von FHEM erkannt werden muss FHEM einmal neu gestartet werden. Dazu müsst ihr die folgenden beiden Befehle nacheinander eingeben. Dadurch wird der Server erst gestoppt und dann wieder gestartet. Weiter Infos zum stoppen und starten findet Ihr auch in dem Artikel FHEM – Aufbau, Module & Wissenswertes
```
sudo /etc/init.d/fhem stop
sudo /etc/init.d/fhem start
```
