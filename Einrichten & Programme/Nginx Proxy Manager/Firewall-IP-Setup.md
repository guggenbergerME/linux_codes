# Firewall Setup

Bitte folgende Punkte in der OPNsense aktivieren

Firewall -> Einstellungen -> Aktivieren:

+ Reflexion für Port-Forwarding
+ 1: 1 Reflexion
+ Automatisches Outbound NAT zur Reflexion NAT

## Firewall Regeln

Firewall -> NAT -> Weiterleitung

WAN TCP * * WAN-Adresse 80 (HTTP) 192.168.1.50 80 (HTTP) Name
