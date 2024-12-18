# So installierst du den TIG Stack (Telegraf, InfluxDB und Grafana) auf Ubuntu 22.04

## Install InfluxDB
[Quelle](https://docs.influxdata.com/influxdb/v2/install/?t=Linux) der Installation.

```
# Ubuntu and Debian
# Add the InfluxData key to verify downloads and add the repository
curl --silent --location -O \
https://repos.influxdata.com/influxdata-archive.key
echo "943666881a1b8d9b849b74caebf02d3465d6beb716510d86a39f6c8e8dac7515  influxdata-archive.key" \
| sha256sum --check - && cat influxdata-archive.key \
| gpg --dearmor \
| tee /etc/apt/trusted.gpg.d/influxdata-archive.gpg > /dev/null \
&& echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive.gpg] https://repos.influxdata.com/debian stable main' \
| tee /etc/apt/sources.list.d/influxdata.list
# Install influxdb
sudo apt-get update && sudo apt-get install influxdb2
```
InfluxDB starten
```
sudo service influxdb start
```
Status
```
sudo service influxdb status
```

## InfluxDB-Datenbank und Benutzeranmeldeinformationen erstellen

Um die Daten von Telegraf zu speichern, musst du die Influx-Datenbank und den Benutzer einrichten.

InfluxDB wird mit einem Kommandozeilen-Tool namens influx ausgeliefert, mit dem du mit dem InfluxDB-Server interagieren kannst. Stell dir influx als das mysql Kommandozeilentool vor.

Führe den folgenden Befehl aus, um die erste Konfiguration für Influx vorzunehmen.

```
$ influx setup
> Welcome to InfluxDB 2.0!
? Please type your primary username navjot
? Please type your password ***************
? Please type your password again ***************
? Please type your primary organization name howtoforge
? Please type your primary bucket name tigstack
? Please type your retention period in hours, or 0 for infinite 360
? Setup with these parameters?
  Username:          navjot
  Organization:      howtoforge
  Bucket:            tigstack
  Retention Period:  360h0m0s
 Yes
User    Organization    Bucket
navjot  howtoforge      tigstack
```
Du musst deinen anfänglichen Benutzernamen, dein Passwort, den Namen deiner Organisation, den Namen des primären Buckets, in dem die Daten gespeichert werden, und die Aufbewahrungsfrist in Stunden für diese Daten festlegen. Deine Angaben werden in der Datei /home/username/.influxdbv2/configs gespeichert.

Du kannst diese Einrichtung auch vornehmen, indem du die URL http://<serverIP>:8086/ in deinem Browser aufrufst. Sobald du die Ersteinrichtung durchgeführt hast, kannst du dich mit den oben erstellten Anmeldedaten bei der URL anmelden.

### Links
+ [Anleitung](https://www.howtoforge.de/anleitung/so-installierst-du-den-tig-stack-telegraf-influxdb-und-grafana-auf-ubuntu-22-04/)
