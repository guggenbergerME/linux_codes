# ufw Firewall
UFW (oder Uncomplicated Firewall) ist eine vereinfachte Firewall-Verwaltungsschnittstelle, die die Komplexität von 
Paketfilterungstechnologie auf niedriger Ebene wie iptables und nftables versteckt. Wenn Sie mit dem Sichern Ihres 
Netzwerks beginnen möchten und Sie nicht sicher sind, welches Tool Sie verwenden sollen, könnte UFW die richtige Wahl für Sie sein.

## Verwenden von IPv6 mit UFW (optional)
Wenn auf Ihrem Ubuntu-Server IPv6 aktiviert ist, muss UFW so konfiguriert sein, dass IPv6 unterstützt wird.
```
sudo nano /etc/default/ufw
```
Stellen Sie dann sicher, dass der Wert von IPV6 yes lautet. Das sollte wie folgt aussehen:
```
IPV6=yes
```

## Einrichten von Standardrichtlinien

Wenn Sie gerade mit der Verwendung Ihrer Firewall begonnen haben, sind Ihre Standardrichtlinien die ersten Regeln, die Sie definieren sollten. 
Diese Regeln steuern die Handhabung von Daten, die nicht ausdrücklich von anderen Regeln abgedeckt werden. Standardmäßig ist UFW so konfiguriert, d
ass alle eingehenden Verbindungen abgelehnt und alle ausgehenden Verbindungen zugelassen werden. So kann niemand, der versucht, Ihren Server 
zu erreichen, eine Verbindung herstellen, während jede Anwendung innerhalb des Servers nach außen kommunizieren kann.

```
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

## Zulassen von SSH-Verbindungen

Wenn wir unsere UFW-Firewall jetzt aktivieren würden, würde sie alle eingehenden Verbindungen ablehnen. Das bedeutet, dass wir Regeln erstellen müssen, 
die legitime eingehende Verbindungen (z. B. SSH- oder HTTP-Verbindungen) ausdrücklich zulassen, wenn unser Server auf diese Art von Anforderungen reagieren soll. 
Wenn Sie einen Cloud-Server verwenden, werden Sie wahrscheinlich eingehende SSH-Verbindungen zulassen wollen, damit Sie sich mit Ihrem Server verbinden und den Server verwalten können.

```
sudo ufw allow ssh
```

Dadurch werden Firewall-Regeln erstellt, die alle Verbindungen an Port 22 zulassen; das ist der Port, an dem der SSH-Daemon standardmäßig lauscht. UFW weiß, was Port allow ssh bedeutet, da dies in der Datei /etc/services als Dienst aufgeführt wird.

Wir können die äquivalente Regel jedoch auch schreiben, indem wir den Port anstelle des Dienstnamens angeben. Dieser Befehl funktioniert zum Beispiel genauso wie oben:

```
sudo ufw allow 22
```
