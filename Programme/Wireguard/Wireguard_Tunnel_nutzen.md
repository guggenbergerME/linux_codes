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
