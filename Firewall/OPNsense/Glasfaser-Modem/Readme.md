# OPNsens als Glasfaser Modem

## Glasfaser–LAN-Konverter (Medienkonverter)

- Der Medienkonverter wandelt das optische Signal (z. B. GPON oder AON) in ein elektrisches Ethernet-Signal (RJ45).
- Für OPNsense spielt es keine Rolle, ob das Signal ursprünglich von Glasfaser kommt – wichtig ist, dass am Ende Ethernet über Kupfer oder SFP herauskommt.

## Direkter Anschluss an OPNsense

- Wenn dein OPNsense-System eine Netzwerkkarte mit einem RJ45-Port oder einem SFP-Port (je nach Medienkonverter) hat, kannst du den Medienkonverter direkt daran anschließen.-
- OPNsense behandelt das Interface wie jedes andere WAN-Interface.


## Besonderheiten je nach Provider

- Manche Provider setzen auf spezielle Protokolle (z. B. VLAN-Tagging, PPPoE, DHCP, feste IP). Das muss in OPNsense konfiguriert werden.
- Falls der Provider eigentlich ein ONT (Optical Network Terminal) oder eine Fritz!Box vorsieht, musst du prüfen, ob du den Medienkonverter einfach stattdessen nutzen darfst. Oft erwartet der Provider eine Authentifizierung über die MAC-Adresse oder bestimmte Zugangsdaten.
- -Manche Anbieter nutzen gar keinen einfachen Medienkonverter, sondern ein GPON-ONT – den kannst du nicht so einfach durch einen Medienkonverter ersetzen.

## Zusammengefasst
- Wenn dein Glasfaseranschluss wirklich mit einem Medienkonverter auf Ethernet (RJ45) umgesetzt wird, kannst du den direkt an OPNsense anschließen.
- Du musst aber die Zugangsmethode deines Providers in OPNsense korrekt einrichten (z. B. PPPoE mit Benutzernamen/Passwort oder VLAN-Tagging).
