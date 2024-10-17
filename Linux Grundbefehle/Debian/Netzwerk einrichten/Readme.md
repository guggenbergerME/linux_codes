# Netzwerk einrichten

## Automatisches Starten der Schnittstelle

    auto lo eth0

## Netzwerkkonfig ändern

    ip address add 192.168.1.100/24 brd + dev eth0

## Netzwerk Einstellungen mit der Konfig Datei

    nano /etc/network/interfaces

Eine Statische IP wird folgendermaßen angelegt

```
auto eth0
iface eth0 inet static
address 192.168.2.1
netmask 255.255.255.0
```

### Links
+ [mehr infos](https://www.howtoforge.de/anleitung/einrichtung-der-netzwerkkarten-unter-debian-linux/)
