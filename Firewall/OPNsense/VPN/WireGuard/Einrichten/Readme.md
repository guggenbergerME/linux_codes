# Wireguard einrichten

Wireguard unter Ubuntu einrichten. Für andere OS sind die Clients auf der Website von [Wireguard](https://www.wireguard.com/) zu finden.

## Installation
```
sudo apt install wireguard
```
Für die Installation unter Ubuntu (bis 18.04) führen Sie die folgenden Kommandos aus:[2]
```
$ sudo add-apt-repository ppa:wireguard/wireguard
$ sudo apt update
$ sudo apt install wireguard
```
Dadurch werden die Pakete wireguard, wireguard-dkms und wireguard-tools installiert. 

## Konfiguration
WireGuard Private- und Public-Key für den Ubuntu Rechner erzeugen

Für eine erfolgreiche Verbindung benötigt jeder Teilnehmer an einem WireGuard VPN eigene Private- und Public-Keys. Sie können diese bequem mit dem nachfolgenden Befehl erzeugen. Die umask wird auf 077 gesetzt, um alle anderen User außer root den Zugriff zu verweigern. 

```
$ sudo -i
# cd /etc/wireguard
# umask 077
# wg genkey > private-key
# wg pubkey > public-key < private-key
```

## Dauerhafte Konfiguration anlegen

Wie Sie eine dauerhafte, auch einen Neustart überstehende, Konfiguration erzeugen wird in diesem Abschnitt beschrieben.

Erstellen Sie dazu beispielsweise mit dem Editor vim die neue Datei wg0.conf:

$ sudo nano /etc/wireguard/wg0.conf

Fügen Sie nun in diese Datei die folgenden Zeilen ein. Speichern und verlassen des vim können Sie anschließend mittels :x. Für ein besseres Verständnis sind die einzelnen Zeilen per Inline-Kommentar beschrieben.
```
[Interface]
Address = <IP des Client aus dem Tunneladressenbereich>
PrivateKey = <Private Key des Clients>

[Peer]
PublicKey = <Public Key der OPNsense Wireguard Instanz>
AllowedIPs = <Netzwerke auf die dieser Client Zugriff haben soll>/<Netmask>          
Endpoint = <Public IP der OPNsense Firewall>:<WireGuard Port>
```
In der OPNsense wird in dem zugehörigen Client (PEER) Eintrag der öffentliche Schlüssel aus der Datei ```public-key``` gesetzt.

## Wireguard Verbindung dauerhaft löschen

```
nmcli connection delete [BEZEICHNUNG]
```
