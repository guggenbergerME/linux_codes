# Beispiel NetCom BW

## Was NetCom BW liefert

Übergabe: CPE/ONT als reine Layer-2-Brücke mit RJ45-Ethernet (100/1000Base-T). Du hängst deine OPNsense-WAN-Schnittstelle direkt daran. 

Einwahl: **PPPoE** mit Benutzername/Passwort, 24-h-Zwangstrennung. 

### IP-Varianten (wichtig fürs Ziel-Setup):

+ Standard: IPv6 (dynamische WAN-Adresse + /56 Prefix), IPv4 über DS-Lite.
+ Option 1: zusätzlich dynamische öffentliche IPv4 (Dual Stack).
+ Option 2: zusätzlich statische öffentliche IPv4. netcom-bw.de

VLAN-Tagging: Bei NetCom-BW-Glasfaser ist **meist kein VLAN-Tag nötig** (PPPoE untagged). Falls an deinem Standort doch ein VLAN gefordert ist, teilt NetCom BW dir die ID mit – dann PPPoE einfach auf dem VLAN-Interface terminieren. (Praxiserfahrung; Beispielberichte zeigen PPPoE ohne VLAN bei NetCom BW.)

## OPNsense: Beispiel-Konfiguration

### Physik & Interface

OPNsense WAN an den RJ45-Port des NetCom-CPE/ONT.

In OPNsense unter Interfaces ▸ Assignments sicherstellen, welcher Port das WAN wird. (z. B. igb0/em0/ix0). 
OPNsense Dokumentation

Falls VLAN verlangt: Interfaces ▸ Other Types ▸ VLAN → Parent = WAN-NIC, VLAN ID = vom Provider. Später PPPoE auf diesem VLAN-Interface auswählen. (Allgemeines Vorgehen, auch in der OPNsense-Doku so beschrieben.) 
OPNsense Dokumentation

### PPPoE einrichten (WAN)

- Interfaces ▸ [WAN]
- IPv4 Configuration Type: PPPoE
- PPPoE Username/Password: wie im NetCom-Anschreiben. (Zugangsdaten kommen schriftlich.)
- IPv6 Configuration Type: je nach gebuchter IP-Variante (siehe unten).
- MTU: zunächst 1492 (üblich bei PPPoE). MSS-Clamping auf 1452 aktivieren/festlegen, falls es Fragmentierungsprobleme gibt. (Best Practice bei PPPoE.) 
OPNsense Dokumentation
MikroTik community forum

## IPv6 & IPv4 je nach gebuchter Option
### Standard (DS-Lite)

- WAN IPv6: DHCPv6
- Request Only an IPv6 prefix aktivieren, Prefix size = 56 (laut Leistungsbeschreibung /56).
- LAN IPv6: Track Interface (Track = WAN, Prefix ID vergeben).
- IPv4: bleibt über DS-Lite (NAT64/AFTR) geroutet; keine öffentliche IPv4.
(Bei DS-Lite stellt NetCom BW das Gateway für IPv4-Kommunikation bereit.) 
netcom-bw.de

### Option 1 (Dual Stack, dynamische IPv4)

- WAN IPv4: PPPoE (wie oben) → du erhältst dynamische öffentliche IPv4.
- WAN IPv6: wie bei A) via DHCPv6 + /56 Prefix, LAN auf Track. 
netcom-bw.de

### Option 2 (Dual Stack, statische IPv4)

Wie B), zusätzlich die von NetCom BW gelieferte statische IPv4 entsprechend eintragen/zuordnen (Details liefert NetCom BW im Auftrag). 
netcom-bw.de

### Firewall/NAT

- NAT: Standard-Outbound-NAT auf WAN (bei Dual-Stack für IPv4).
- Firewall-Regeln: Auf LAN eine „allow any → any“ (zum Test), auf WAN nur das Nötige.
- Bei DS-Lite brauchst du für eingehende IPv4-Ports einen Workaround (Portmapper/VPS+VPN), da keine öffentliche IPv4 vorhanden ist – oder du buchst Option 1/2. (Das ergibt sich direkt aus der Produktbeschreibung.)
Firewall-Regeln: Auf LAN eine „allow any → any“ (zum Test), auf WAN nur das Nötige.

Bei DS-Lite brauchst du für eingehende IPv4-Ports einen Workaround (Portmapper/VPS+VPN), da keine öffentliche IPv4 vorhanden ist – oder du buchst Option 1/2. (Das ergibt sich direkt aus der Produktbeschreibung.)


## Kurzcheckliste (Fehlerquellen)

- PPPoE-Zugangsdaten exakt übernehmen (Groß/Kleinschreibung). 24-h-Reconnect ist normal.
- Kein VLAN setzen, sofern NetCom BW nichts anderes nennt. Falls doch: PPPoE auf das VLAN-Interface binden. 
- MTU/MSS: Start mit 1492/1452; bei Problemen anpassen. 
- IPv6 /56 sauber per DHCPv6 ziehen und LAN auf Track stellen. 
