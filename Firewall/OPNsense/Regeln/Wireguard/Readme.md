# Wireguard Site to Site

## Gegeben

```
SITE A                  SITE B

172.16.0.0/24           192.168.0.0/24

Wireguard Transfer Net
10.2.2.0/24

öffentliche IP
203.0.113.1             203.0.113.2
```
## Verkehr zwischen Standort A LAN-Netz und Standort B LAN-Netz zulassen

Gehen Sie zu OPNsense Site A ```Firewall ‣ Regeln ‣ LAN A``` und fügen Sie eine neue Regel hinzu.

```
Aktion                      Passieren

Schnittstelle               LAN A

Richtung                    In

TCP/IP-Version              IPv4

Protokoll                   Beliebig

Quelle                      172.16.0.0/24

Quellport                   Beliebig

Ziel                        192.168.0.0/24

Zielhafen                   Beliebig

Beschreibung                LAN-Standort A zu LAN-Standort B zulassen
```

Gehen Sie zur OPNsense-Site. Eine ```Firewall ‣ Regeln ‣ Wireguard (Gruppe)``` und fügen Sie eine neue Regel hinzu.

```
Aktion                      Passieren

Schnittstelle               Wireguard (Gruppe)

Richtung                    In

TCP/IP-Version              IPv4

Protokoll                   Beliebig

Quelle                      192.168.0.0/24

Quellport                   Beliebig

Ziel                        172.16.0.0/24

Zielhafen                   Beliebig

Beschreibung                LAN-Standort B zu LAN-Standort A zulassen
```

### Links
+ [Detalierte Erklärung](https://docs.opnsense.org/manual/how-tos/wireguard-s2s.html)
