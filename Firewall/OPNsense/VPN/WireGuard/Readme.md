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

## Redirect versus Split Tunneling

Ein wichtiger Punkt der fast immer falsch gemacht wird und entsprechend beachtet werden sollte!
Allowed IPs 0.0.0.0/0 = Schickt anstatt dediziert NUR den Traffic des remoten lokalen LANs, immer den gesamten Client Traffic in den VPN Tunnel! Quasi wird dann das Default Gateway des Clinets auf den VPN Tunnel umgeleitet.
Wenn dies aktiviert wird muss kein weiteres IP Netz mehr unter den AllowedIPs definiert werden!!
Warum auch, denn 0.0.0.0/0 bedeutet "route ALLEN Client Traffic in den Tunnel". "Alles" inkludiert logischerweise alle IP Netze und damit auch systembedingten Traffic wie DNS (Namensauflösung), NTP (Uhrzeit) etc.

Redirect belastet den Tunnel prinzipbedingt performancetechnisch je nach Trafficvolumen deutlich mehr als das schlankere Split Tunneling Verfahren. Das sollte man immer beachten!
Leider ein Konfigurationsfehler der oft aus Routing Unkenntis gemacht wird wenn man lediglich nur relevanten Traffic für das remote Zielnetz ins VPN routen will.
Möchte man keinen Redirect und per Split Tunneling wirklich nur den relevanten Traffic für das remote LAN (oder die LANs) in den Tunnel routen, gibt man hier außer der Server IP mit einer /32er Maske nur noch das bzw. die jeweilige(n) remote(n) IP Netz(e) und Maske an. Summary Subnet Masken sind hier natürlich auch erlaubt um mehrere IP Netze bei intelligentem Subnetting mit einer Maske zu erfassen.
Mit Split Tunneling wird lediglich nur der Traffic für das remote LAN in den Tunnel gesendet. Lokaler Internet Traffic bleibt hier immer lokal und belastet den Tunnel nicht.
❗️Split Tunneling ist also performancetechnisch die deutlich bessere Wahl.

Wer aber dennoch z.B. aus Sicherheitsgründen allen Client Traffic verschlüsseln will um z.B. in öffentlichen WLAN Hotspots oder unsicheren Gastnetzen geschützt unterwegs zu sein, kommt um ein Gateway Redirect Setup nicht drum herum.

Welches dieser beiden Verfahren sinnvoll ist, ist deshalb immer vom Einsatzprofil des VPNs abhängig und muss jeder Netzwerk Admin immer im Einzelfall entscheiden.
In einer Redirect Konfig wird dann ausschliesslich nur 0.0.0.0/0 unter den "AllowedIPs" definiert, NICHT mehr!

⚠️ Es ist also immer entweder nur Split Tunnel oder nur Gateway Redirect erlaubt!
Eine Kombination beider Verfahren ist NICHT möglich und routingtechnisch natürlich auch völlig unsinnig, da ein Gateway Redirect, wie der Name ja schon sagt, sämtlichen Traffic routet.

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

## Konfiguration Wireguard Client

Die Client Konfig sieht dann völlig identisch aus:

+ PrivateKey = Privater Key des Clients
+ Unter [Peer] dann PublicKey = öffentlicher Schlüssel des VPN Servers


Zusätzlich kommt hier der Eintrag Endpoint = <Zieladresse_Server>:51820 hinzu, der die IP Adresse oder den Hostnamen des VPN Servers sowie dessen UDP Port definiert.

Zu beachten ist das bei einer Installation des VPN Servers im lokalen LAN Netz immer der DynDNS Hostname des dortigen Routers oder dessen öffentliche WAN Port IP Adresse in der Endpoint Konfig angegeben wird. Nur diese ist aus dem Internet ansprechbar und leitet per Port Forwarding, wie oben bereits beschrieben, den VPN Tunnel an den internen Wireguard Server weiter.
Beispiele sind dann z.B. Endpoint = meinrouter.dyndns.org:51820 bei DynDNS Hostnamen oder Endpoint = 85.1.2.3:51820 oder eine IPv6 Adresse wer eine öffentliche IP hat.
Bei einer Installation auf der Peripherie wie Router oder Firewall, entfällt das unsichere Port Forwarding natürlich.
Ein VPN Setup mit internem VPN Server ist immer latent unsicher, weil durch das Port Forwarding Loch in der Firewall ungeschützer Internet Traffic ins lokale Netz gelangt. VPNs gehören deshalb, wenn möglich, immer auf die Peripherie wie Router oder Firewall!
```
[Interface]
Address = 100.64.64.101/24
PrivateKey = OMjSCv6e/iXECZwq0ZVL5Ywf/KzZvdsGpYKv1512345=
# DNS = 172.16.2.1

[Peer]
PublicKey = cA+mynt84tVH1gPaUN66E8K0nfzvpsQMohrEbz54321=
# Endpoint = X.Y.Z.H:51820 
Endpoint = router.myfritz.de:51820 
AllowedIPs = 100.64.64.1/32, 192.168.2.0/24
PersistentkeepAlive = 25 
```
⚠️ Auch hier gilt wieder der obige Warnhinweis bezüglich der internen Peers und den /32er Masken für interne WG Adressen unter "Allowed IPs"!

### Links
+ [VPN installation mit Wireguard](https://administrator.de/tutorial/merkzettel-vpn-installation-mit-wireguard-660620.html)
