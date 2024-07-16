# Wireguard

## Peers informationen
Die AllowedIPs auf Server-Seite sagen dem WG Server von welchen IP-Adressen er von diesem Peer verschlüsselten Traffic annehmen darf und nur von diesen (Cryptokey Routing). Trägst du hier statt einer eindeutigen 32er Maske bei mehreren Peers immer das gleiche Subnetz ein dann kann der Server keine eindeutige Route zu jedem Peer erstellen.
Du kannst nämlich auch ganze Netze in den AllowedIPs auf Server-Seite eintragen, dann nimmt der Server Traffic von diesem ganzen Subnetz an und er erstellt dann auch eine Route für dieses Subnetz mit dem jeweiligen Peer als Gateway.
Die 32 Maske sagt dabei aber nicht aus das die Clients nicht untereinander kommunizieren könnten, das können sie sehr wohl (sofern die Firewall es erlaubt) und weil die Maske auf Clientseite im Interface und den AllowedIPs meist mit einer 24 Maske auf das WG Transfernetz zeigt.

Wie immer direkt beim Hersteller und in unseren Tutorials aufmerksam lesen dann muss man sich auch nicht durch x Seiten wühlen

+ [mehr Informationen](https://www.wireguard.com/#:~:text=At%20the%20heart%20of%20WireGuard,peer%20has%20a%20public%20key)

### Links
+ [VPN installation mit Wireguard](https://administrator.de/tutorial/merkzettel-vpn-installation-mit-wireguard-660620.html)
