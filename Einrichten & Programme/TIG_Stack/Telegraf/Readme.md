# Telegraf

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


## Telegraf deinstallieren

**Ubuntu**

Telegraf stoppen

    sudo systemctl stop telegraf

Löschen der Telegraf Pakete

    sudo apt-get purge telegraf

Löschen der Konfigurationsdateien
    
    sudo rm -rf /etc/telegraf/

Pakete Updaten

    sudo apt-get update

Löschen verbleibender Abhängigkeiten

    sudo apt-get autoremove

