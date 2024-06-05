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

Wenn Sie Ihren SSH-Daemon so konfiguriert haben, dass er einen anderen Port verwendet, müssen Sie den entsprechenden Port angeben. Wenn Ihr SSH-Server beispielsweise an 
Port 2222 lauscht, können Sie diesen Befehl verwenden, um Verbindungen an diesem Port zuzulassen:

```
sudo ufw enable
```

## Zulassen anderer Verbindungen

Jetzt sollten Sie alle anderen Verbindungen zulassen, auf die Ihr Server reagieren soll. Die Verbindungen, die Sie zulassen sollten, sind von Ihren spezifischen Bedürfnissen abhängig. 
Glücklicherweise wissen Sie bereits, wie Sie Regeln schreiben, die Verbindungen anhand eines Dienstnamens oder Ports zulassen. Das haben wir bereits für SSH an Port 22 getan. Sie können es auch tun für:

+ HTTP an Port 80, was nicht verschlüsselte Webserver verwenden; mit **sudo ufw allow http** oder **sudo ufw allow 80**
+ HTTPS an Port 443, was verschlüsselte Webserver verwenden; mit **sudo ufw allow https** oder **sudo ufw allow 443**

Es gibt weitere Möglichkeiten, um andere Verbindungen zuzulassen, abgesehen von der Angabe eines Ports oder bekannten Dienstes.

## Spezifische Portbereiche

Sie können mit UFW spezifische Portbereiche angeben. Einige Anwendungen verwenden mehrere Ports anstelle eines einzelnen Ports.

Um zum Beispiel X11-Verbindungen zuzulassen, die Ports 6000-6007 verwenden, nutzen Sie diese Befehle:

```
sudo ufw allow 6000:6007/tcp
sudo ufw allow 6000:6007/udp
```

Wenn Sie mit UFW Portbereiche angeben, müssen Sie das Protokoll (tcp oder udp) angeben, für das die Regeln gelten sollen. Wir haben das vorher nicht erwähnt, da wir ohne Angabe des Protokolls automatisch beide Protokolle zulassen, was in den meisten Fällen in Ordnung ist.

## Spezifische IP-Adressen

Beim Arbeiten mit UFW können Sie auch IP-Adressen spezifizieren. Wenn Sie zum Beispiel Verbindungen von einer bestimmten IP-Adresse zulassen möchten, wie einer Arbeits- oder privaten IP-Adresse unter 203.0.113.4, müssen Sie from und dann die IP-Adresse angeben:
```
sudo ufw allow from 203.0.113.4
```

Sie können auch einen bestimmten Port angeben, mit dem die IP-Adresse eine Verbindung herstellen darf, indem Sie to any port (zu jedem Port) gefolgt von der Portnummer hinzufügen. Wenn Sie zum Beispiel 203.0.113.4 erlauben möchten, sich mit Port 22 (SSH) zu verbinden, verwenden Sie diesen Befehl:,

```
sudo ufw allow from 203.0.113.4 to any port 22
```

## Subnetze

Wenn Sie ein Subnetz von IP-Adressen zulassen möchten, können Sie CIDR-Notation verwenden, um eine Netzmaske anzugeben. Wenn Sie zum Beispiel alle IP-Adressen im Bereich von 203.0.113.1 bis 203.0.113.254 zulassen möchten, können Sie diesen Befehl verwenden:
```
sudo ufw allow from 203.0.113.0/24
```

Außerdem können Sie auch den Zielport angeben, mit dem das Subnetz 203.0.113.0/24 eine Verbindung herstellen darf. Auch hier verwenden wir Port 22 (SSH) als Beispiel:
```
sudo ufw allow from 203.0.113.0/24 to any port 22
```


