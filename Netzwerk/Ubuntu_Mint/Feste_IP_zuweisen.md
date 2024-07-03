# Feste IP zuweisen

Einem Ubuntu Server LTS 22.04 via CLI eine feste IP zuweisen? Da hat sich zum Vorgänger was geändert…
Zielkonfiguration (bei Bedarf anpassen)
```
IP des Host: 10.1.111.71/24
Default Gateway: 10.1.111.250
DNS Server 1: 10.1.110.1
DNS Server 2: 10.1.110.2

Lokale Domain: domain.com
```
## Software installieren
Installieren wir erstmal noch ein paar nützliche Netzwerk Tools:
```
sudo apt install nano inetutils-traceroute inetutils-ping net-tools dnsutils ntp -y
```
Jetzt erstmal den Namen der Nic checken!
```
ip a
```
## Netzwerk config Datei editieren
```
sudo nano /etc/netplan/[DATEINAME].yaml
```
Standard Inhalt (oder so ähnlich):
```
# This is the network config written by 'subiquity'
 network:
  ethernets:
    eth0:
      dhcp4: true
  version: 2
```
Wie folgt anpassen (achtet auf den Namen der NIC!):

(kopiert den Inhalt am besten 1:1 in Euer File und passt nur noch den Interface Namen, die IP’s und Eure lokale Domain an…)
```
# Manual IP Config
network:
 ethernets:
  ens160:
   addresses:
    - 10.1.111.71/24
   routes:
    - to: default
      via: 10.1.111.250
   nameservers:
    addresses: [10.1.110.1, 10.1.110.2]
    search: [domain.com]
 version: 2
```
um die Warnung zu unterdrücken, schränken wir die Rechte auf die Datei direkt noch ein:
```
sudo chmod 600 /etc/netplan/00-installer-config.yaml
```
Übernahme der Config
(ist man via SSH verbunden, fliegt man jetzt raus…)
```
sudo netplan apply
```
Diese Fehlermeldung irgnorieren wir übrigens, denn wo kein Dienst ist, kann auch keiner starten… 😉
Netplan 2204 1
Double-Check der IP mit…
```
ip a
```
Ab jetzt kann man sich auf die neue IP verbinden.
