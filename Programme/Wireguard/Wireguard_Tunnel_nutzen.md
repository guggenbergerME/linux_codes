# Wireguard Tunnel

### Tunnel konfigurieren

Vor der Installation aktualisieren wir einmal die Paketquellen und Updaten unseren Server:
```
sudo apt update && sudo apt upgrade -y
```

Anschließend können wir WireGuard installieren:
```
sudo apt install wireguard
```
Die Grundvoraussetzung für einen funktionierenden WireGuard Server ist, dass unser System IP Pakete des WireGuard Interfaces weiterleitet. Dazu muss man die Konfigurationsdatei /etc/sysctl.conf anpassen, und zwar das # vor dem Eintrag net.ipv4.ip_forward=1 entfernen und speichern.

Damit die Änderungen aktiviert werden, muss man den Befehl eintippen:
```
sudo sysctl -p
```
Anschließend ändern wir die Berechtigungen des Ordners /etc/wireguard mit 
```
umask 077 /etc/wireguard
```
Das Schlüsselpaar des Servers wird mit dem folgenden Befehl erstellt:
```
wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey
```
## Server config

Den Private Key sollte man die Zwischenablage kopieren, da man diesen im nächsten Schritt für die Serverkonfiguration von WireGuard benötigt. Dieser lässt sich mit sudo cat /etc/wireguard/privatekey anzeigen.

Nun muss die Konfiguration des WireGuard Servers angelegt werden, wofür der private Schlüssel benötigt wird. Dafür die Datei /etc/wireguard/wg0.conf anlegen. Dazu könnt ihr den Befehl 
```
sudo touch /etc/wireguard/wg0.conf
```
verwenden.

 In die Datei wg0.conf schreibt ihr mit dem Texteditor eurer Wahl folgendes:
 ```
[Interface]
PrivateKey = Hier den privaten Key einfügen
Address = 10.0.0.1/24
SaveConfig = true
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o ens160 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o ens160 -j MASQUERADE
ListenPort = 51820
```

## Client config
Jetzt müssen wir für unseren Client ebenfalls ein Schlüsselpaar anlegen und außerdem den Public Key des Clients in die Serverkonfiguration schreiben.

Schlüssel generieren
```
wg genkey | tee client_key | wg pubkey > client_pub
```
Für den Client erfolgt noch der nachfolgende Eintrag
```
[Interface]
PrivateKey = Hier Private Key des Clients einfügen
Address = 10.0.0.2/32

[Peer]
PublicKey = Hier Public Key des Servers einfügen
Endpoint = Public IP des Servers:51820
AllowedIPs = 10.0.0.0/24
```
in die wg0.conf
