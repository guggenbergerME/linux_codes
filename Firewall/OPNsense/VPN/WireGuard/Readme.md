# Wireguard

## Server Konfiguration Linux

Die Server Konfig Datei befindet sich unter /etc/wireguard/wg0.conf ist sehr schlank und schnell aufgesetzt z.B. mit dem nano Editor. Sollte die Datei wg0.conf nicht vorhanden sein erzeugt man sie mit dem nano Editor.

+ Address = Die internen VPN Server Tunnel Adresse
+ PrivateKey = Der private Server Schlüssel den man oben generiert hat
+   ListenPort = Der UDP Port auf den der Server hört. (Achtung: Dieser muss zu dem im Port Forwarding Konfigurierten identisch sein !)
+   Im Peer Bereich dann der öffentliche Schlüssel des Clients und unter "AllowedIPs" die Adressen die der Wireguard Server in den Tunnel routet. Wireguard nennt dies "Cryptokey Routing" was bewirkt das der Wireguard Server und Client das Routing für die jeweils remoten IP Netze automatisch in die Routing Tabelle übernimmt.

⚠️ Wichtiger Hinweis: Die internen IP Adressen der Peers müssen eine /32 Subnetzmaske (Hostmaske) unter den "Allowed IPs" haben damit das Wireguard Cryptokey Routing diese Peers eindeutig den Clients zuordnen kann. (Siehe dazu auch HIER!)
Dieser Punkt wird sehr häufig nicht beachtet und dadurch oft falsch konfiguriert und führt damit zu einem fehlerhaften Routing im VPN.
```
[Interface]
Address = 100.64.64.1/24
PrivateKey = AB1234P6j2O0PH1838gYnv5p5n27HVmVWJRjZr12345=
ListenPort = 51820

[Peer]
PublicKey = 4321Abc06YX3gA4P0sQzywNX8c1sHSeu+oqsrI84321=
AllowedIPs = 100.64.64.100/32, 192.168.188.0/24 
```

Mit wg-quick up wg0 startet man den Wireguard Server. Entsprechend stoppt wg-quick down wg0 ihn.
Ob der Tunnel aufgebaut wurde überprüft man mit wg show (unixoide OS).


## Peers informationen
Die AllowedIPs auf Server-Seite sagen dem WG Server von welchen IP-Adressen er von diesem Peer verschlüsselten Traffic annehmen darf und nur von diesen (Cryptokey Routing). Trägst du hier statt einer eindeutigen 32er Maske bei mehreren Peers immer das gleiche Subnetz ein dann kann der Server keine eindeutige Route zu jedem Peer erstellen.
Du kannst nämlich auch ganze Netze in den AllowedIPs auf Server-Seite eintragen, dann nimmt der Server Traffic von diesem ganzen Subnetz an und er erstellt dann auch eine Route für dieses Subnetz mit dem jeweiligen Peer als Gateway.
Die 32 Maske sagt dabei aber nicht aus das die Clients nicht untereinander kommunizieren könnten, das können sie sehr wohl (sofern die Firewall es erlaubt) und weil die Maske auf Clientseite im Interface und den AllowedIPs meist mit einer 24 Maske auf das WG Transfernetz zeigt.

Wie immer direkt beim Hersteller und in unseren Tutorials aufmerksam lesen dann muss man sich auch nicht durch x Seiten wühlen

+ [mehr Informationen](https://www.wireguard.com/#:~:text=At%20the%20heart%20of%20WireGuard,peer%20has%20a%20public%20key)

## Wireguard Server Autostart (Linux)
Den automatischen Start des Wireguard Servers beim Booten erledigt der Befehl:
```
systemctl enable wg-quick@wg0.service
```
Macht man danach Änderungen an der Wireguard Server Konfig muss anschliessend auch der Wireguard Server mit systemctl restart wg-quick@wg0.service neu gestartet werden !

### Links
+ [VPN installation mit Wireguard](https://administrator.de/tutorial/merkzettel-vpn-installation-mit-wireguard-660620.html)
