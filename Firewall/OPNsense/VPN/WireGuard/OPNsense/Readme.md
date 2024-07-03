# OPNsense Wireguard

Wireguard ist bereits bei neuen Version mit installiert.


Zuerst erstellt man auf der Registerkarte Instances unter 
**VPN => WireGuard**
mit einem Klick auf das Pluszeichen einen neuen WireGuard-Server. Mithin kann man wie bei OpenVPN auch mit WireGuard auf einer 
OPNsense-Firewall mehrere Server betreiben. Für den neuen Server vergibt man zuerst einen Namen, wie er auf der Oberfläche angezeigt werden soll.

Bei Hörender Port wird der Port angegeben, auf dem der VPN-Server auf Anfragen lauscht. Diesen muss man später auch in der Firewall freischalten. 

```
51820
```

Bei Tunnel address trägt man das Subnetz ein, in dem sich künftig die VPN-Schnittstelle und die Clients befinden.
In unserem Beispiel arbeiten wir mit dem Subnetz 	
```
10.0.0.1/24
```
wobei dann das VPN-Interface die IP-Adresse 10.0.0.1 erhält.

Alle anderen Felder müssen bei der Erstellung nicht ausgefüllt werden. Möchte man die Routing-Regeln selbst erstellen, dann kann man hier noch Disable routes anhaken. Nach dem Speichern wird mit Anwenden die Konfiguration des Servers in OPNsense gesichert.

Durch das Speichern erstellt OPNsense automatisch einen öffentlichen Schlüssel für den VPN-Server. Dieser wird später für den Handshake mit den Clients benötigt.

Öffnet man die Konfiguration des Servers erneut, dann sind bei Öffentlicher Schlüssel und Privater Schlüssel die beiden Felder automatisch ausgefüllt. Hier markiert man den öffentlichen Schlüssel und kopiert ihn in eine Textdatei, weil wir ihn später noch einmal benötigen.

Im Anschluss kann man WireGuard unter **Allgemein aktivieren**, was man wiederum mit Anwenden bestätigt muss.

## Netzwerkschnittstellen für WireGuard konfigurieren

Um das VPN mit der OPNsense zu verbinden, ist unter Schnittstellen noch die Konfiguration des VPN-Interfaces erforderlich. Bei Zuweisungen sind die vorhandenen Schnittstellen zu sehen. Hier erzeugt man das neue Interface und weist dieses an WireGuard-VPN zu.

Durch einen Klick auf das neue Interface öffnet sich das Fenster mit dessen Konfiguration. 
Hier aktiviert man diese über die entsprechende Checkbox. Zudem ist es sinnvoll, an dieser Stelle auch gleich Verhindere die Schnittstellenentfernung zu setzen, um ein versehentliches Löschen zu verhindern.

Für die Namensauflösung im internen Netzwerk kann man Unbound DNS auf OPNsense einrichten.

## Firewall-Regeln für WireGuard-VPN erstellen

Als nächstes erstellt man unter Firewall => Regeln => WAN eine Regel, die den Zugriff über das Internet auf den VPN-Server gestattet.

Beim Definieren einer neuen Regel wählt man die Aktion Erlauben und die Schnittstelle WAN aus. Bei Richtung entscheidet man sich für die Option in, bei TCP/IP-Version für IPv4, bei Protokoll für UDP und bei Quelle Jeglich.

Wichtig ist es, bei Zielportbereich unter von und an den Port anderer zu wählen und die Portnummer anzugeben, die man bei der Erstellung des Servers angegeben hat. Sie ist unter VPN => WireGuard zu finden. An dieser Stelle kann man noch die Option Protokolliere Pakete, die von dieser Regel behandelt werden aktivieren.

Mit einer weiteren Regel legt man fest, wie der Datenverkehr der VPN-Clients zum internen Netzwerk verlaufen soll. Wählen sich Clients per VPN ein, dann befinden sich diese zunächst im VPN-Netz, dessen IP-Bereich bei der Erstellung des Servers angegeben wurde.

Von hier müssen sie zu den jeweiligen Anwendungen im lokalen Netzwerk kommen. Diese Regeln konfiguriert man über Firewall => Regeln => <WireGuard-Schnittstelle>. Generell ist es empfehlens­wert, die Regeln so zu gestalten, dass die VPN-Clients nur auf die Geräte zugreifen dürfen, die sie tatsächlich brauchen.

Dazu wählt man beim Erstellen einer neuen Regel unter Aktion die Option Erlauben und bei Schnittstelle jene von WireGuard aus. Bei Richtung entscheidet man sich für in und bei Protokoll  für any, und bei Quelle und Ziel kann man jeglich auswählen, wenn man den Zugang zu sämtlichen Ressourcen im Netz zulassen möchte.

### Links
+ [mehr Informationen](https://www.windowspro.de/thomas-joos/wireguard-vpn-opnsense-firewall-einrichten)
