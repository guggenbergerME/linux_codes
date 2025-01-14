# Telegraf

## Firewall konfigurieren

Bevor du die Pakete installierst, musst du als erstes die Firewall so konfigurieren, dass sie die Ports für InfluxDB und Grafana öffnet.

Überprüfe den Status der Firewall.

    sudo ufw status

Du solltest etwas wie das Folgende sehen.
```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
```
Öffne Port 8086 für InfluxDB und 3000 für den Grafana-Server.

    sudo ufw allow 8086
    sudo ufw allow 3000

Überprüfe den Status zur Bestätigung noch einmal.

    sudo ufw status

```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
8086                       ALLOW       Anywhere
3000                       ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
8086 (v6)                  ALLOW       Anywhere (v6)
3000 (v6)                  ALLOW       Anywhere (v6)
```

## Telegraf installieren

Telegraf und InfluxDB teilen sich das gleiche Repository. Daher müssen wir erst das InfluxDB Repository installieren

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
```

Nun kann Telegraf einfach installiert werden.

        sudo apt install telegraf

Der Dienst von Telegraf wird während der Installation automatisch aktiviert und gestartet.

Telegraf speichert seine Konfiguration für alle diese Plugins in der Datei /etc/telegraf/telegraf.conf. Der erste Schritt besteht darin, Telegraf mit InfluxDB zu verbinden, indem du das Output-Plugin influxdb_v2 aktivierst. Öffne die Datei /etc/telegraf/telegraf.conf zum Bearbeiten.

```
nano /etc/telegraf/telegraf.conf
```

Die Konfiguration der telegraf.conf erfolgt über InfluxDB!

## Telegraf Status und Neu starten
```
systemctl restart telegraf
```
## Telegraf DEBUG Modus

Telegram kann in einem Debug Modus gestartet werden
```
telegraf --config /etc/telegraf/telegraf.conf --debug
```

## Ausgabe testen ohne Senden
```
telegraf --config /etc/telegraf/telegraf.conf --test --debug
```

## Telegraf deinstallieren

**Ubuntu**

Telegraf stoppen
```
sudo systemctl stop telegraf
```
Löschen der Telegraf Pakete
```
sudo apt-get purge telegraf
```
Löschen der Konfigurationsdateien
```    
sudo rm -rf /etc/telegraf/
```
Pakete Updaten
```
sudo apt-get update
```
Löschen verbleibender Abhängigkeiten
```
sudo apt-get autoremove
```
