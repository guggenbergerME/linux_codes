# Telegraf

## Telegraf installieren

Telegraf und InfluxDB teilen sich das gleiche Repository. Das bedeutet, dass du Telegraf direkt installieren kannst.

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

