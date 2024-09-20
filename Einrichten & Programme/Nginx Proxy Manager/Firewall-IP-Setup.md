# Firewall Setup



![Bild]([https://www.elektronik-kompendium.de/sites/net/bilder/09072411.png](https://github.com/guggenbergerME/linux_codes/blob/main/Einrichten%20%26%20Programme/Nginx%20Proxy%20Manager/Bildschirmfoto%20vom%202024-09-20%2009-58-48.png))

Bitte folgende Punkte in der OPNsense aktivieren

Firewall -> Einstellungen -> Aktivieren:

+ Reflexion für Port-Forwarding
+ 1: 1 Reflexion
+ Automatisches Outbound NAT zur Reflexion NAT

## Firewall Regeln

Firewall -> NAT -> Weiterleitung

WAN TCP * * WAN-Adresse 80 (HTTP) 192.168.1.50 80 (HTTP) Name
