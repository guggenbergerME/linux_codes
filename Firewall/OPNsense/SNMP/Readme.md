# Monitoring einer OPNSense Firewall via SNMP

Ich setze häufig und gerne (virtuelle) Firewall Appliances mit OPNSense ein. Früher habe ich viel mit PFSense gemacht, ich habe mir dann mal die OPNSense angeschaut und bin recht zeitig gewechselt. Wer es nicht kennt, und sich mit dem Thema auseinandersetzt, sollte sich das Projekt unbedingt mal anschauen: https://opnsense.org/

Läuft das Gerät einmal, sollte es natürlich auch überwacht werden. Dies wird bei mit mittels SNMP gemacht, da auf dem Gerät kein Agent installiert ist und auch nicht wird.

## Aktivierung von SNMP

SNMP ist standardmäßig bei einer Installation nicht vorhanden und aktiviert, kann aber über ein Plugin nachinstalliert werden. Dies geschieht über die Weboberfläche der Firewall im Menü System -> Firmware -> Plugins.

## Links
+ [Detalierte Beschreibung](https://www.zueschen.eu/monitoring-einer-opnsense-firewall-via-snmp/)
