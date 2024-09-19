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
