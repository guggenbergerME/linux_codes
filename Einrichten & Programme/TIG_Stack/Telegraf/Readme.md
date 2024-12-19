# Telegraf

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

