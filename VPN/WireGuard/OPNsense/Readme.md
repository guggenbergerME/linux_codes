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
