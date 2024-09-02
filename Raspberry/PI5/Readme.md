# Setup PI5

## Wlan und SSH auf Raspberry Pi OS aktivieren
alls du Raspbian (oder ein darauf basierendes) / Raspberry Pi OS nutzt, so ist SSH (Secure Shell) standardmäßig deaktiviert und das Wlan nicht eingerichtet. Um nach der Installation nicht erst eine Tastatur und Bildschirm anschließen zu müssen, um dann anschließend SSH zu aktivieren und das Wlan einzurichten, so können wir dies auch gleich über einen kleinen Trick umgehen.

### SSH
Um SSH zu aktivieren, legen wir im Hauptverzeichnis der SD Karte eine leere Textdatei mit dem Namen „ssh“ bzw. „ssh.txt an (beides ist gültig). Nach dem Starten kannst du dich per SSH einloggen.

### Wlan
Der zweite Punkt ist das Aktivieren des Wlan. Vor allem, wenn dein Raspberry Pi keine Lan-Verbindung hat, so ist dies sehr nützlich. Hierfür erstellen wir ebenfalls im Hauptverzeichnis der SD Karte eine Textdatei mit dem Namen „wpa_supplicant.conf“ (Achtung: ohne die Endung .txt und ohne Anführungszeichen!). Nun bekommst diese Datei folgenden Inhalt:
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=DE

network={
 ssid="DEIN WLAN NAME"
 psk="WLAN PASSWORD"
 key_mgmt=WPA-PSK
}
```

## Links
+ [Betriebssystem auf eine SD Karte flashen](https://tutorials-raspberrypi.de/rapbian-betriebssystem-raspberry-pi-image-sd-karte-flashen-windows-mac-linux/)
+ [USB Boot per Stick oder SSD Festplatte einrichten](https://tutorials-raspberrypi.de/raspberry-pi-usb-boot-per-stick-ssd-einrichten/)
