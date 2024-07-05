# nmap
Nmap steht für „Network Mapper“ und ist eines der besten Open-Source-Dienstprogramme, die derzeit für die Netzwerkerkennung und Sicherheitsüberprüfung verfügbar sind.

Nmap sendet Pakete und analysiert die erhaltenen Antworten, um Hosts und Dienste in einem Computernetzwerk zu entdecken. Es ist einer der am weitesten verbreiteten Port-Scanner auf dem Markt, der Ihnen hilft, offene Ports zu finden und Sicherheitsrisiken in einem Netzwerk zu erkennen.

Dies ist der erste Schritt für einen Angreifer, um Informationen über das Netzwerk seiner Ziele zu erhalten und einen möglichen Weg für einen Angriff zu finden. Ein Angreifer erfährt die Dienste, die auf offenen Ports laufen, sowie deren Version, was bei der Ermittlung von Sicherheitslücken für die entsprechende Version hilft.

Das Programm wird im Volksmund als das Schweizer Taschenmesser des Systemadministrators bezeichnet, da es für mehrere Zwecke eingesetzt werden kann: Sondierung von Computernetzwerken, Host-Ermittlung, Port-Scan, Erkennung von Sicherheitslücken, Erkennung von Betriebssystemen, Erkennung von Versionen usw. Sein plattformübergreifendes Dienstprogramm.

Wenn Sie nicht gerne mit der Befehlszeilenschnittstelle arbeiten, steht Ihnen auch eine grafische Benutzeroberfläche zur Verfügung – Zenmap, die offizielle Nmap Security Scanner GUI.

## installation Debian

Wir werden die Installation von Nmap auf zwei gängigen Linux-Distributionen demonstrieren – CentOS und Ubuntu. Nmap ist als Paket im Repository der meisten Linux-Distributionen verfügbar.

```
sudo apt-get update
```
```
sudo apt-get install nmap -y
```

## Beispiele

Wir werden uns einige Beispiele für die Verwendung des Nmap-Befehls ansehen.
Nach offenen Ports scannen

Syntax für nmap
```
nmap [Scan-Typ(en)] [Optionen] {Zielangabe}
```
Die Zielangabe kann ein Hostname, eine IP-Adresse, ein Domänenname, ein Netzwerk, ein Subnetz usw. sein.

### Eine Domäne scannen
```
nmap scanme.nmap.org
```
Resultat dieser Anfrage
```
Starting Nmap 7.80 ( https://nmap.org ) at 2024-07-05 08:28 CEST
Nmap scan report for scanme.nmap.org (45.33.32.156)
Host is up (0.16s latency).
Other addresses for scanme.nmap.org (not scanned): 2600:3c01::f03c:91ff:fe18:bb2f
Not shown: 997 filtered ports
PORT    STATE  SERVICE
53/tcp  closed domain
80/tcp  open   http
443/tcp closed https

Nmap done: 1 IP address (1 host up) scanned in 11.11 seconds
```

Wenn keine Flags gesetzt sind, wird Nmap standardmäßig –

+ Scannt nach den 1000 am häufigsten verwendeten Ports (die Liste dieser Ports kann in der Dateinmap-services geändert werden ).
+ Nmap versucht, eine TCP SYN-Verbindung zu Ports herzustellen, wenn es mit einem privilegierten Benutzer ausgeführt wird.
+ Sendet ICMP-Echo-Anfragen an die Zielhosts, um festzustellen, ob sie aktiv sind oder nicht.
+ Führt einen DNS-Reverse-Lookupdurch , um den Hostnamen zu ermitteln.

In der oben gezeigten Ausgabe sehen wir vier offene Ports, einen gefilterten Port und 995 geschlossene Ports. Ein Port, bei dem Nmap nicht feststellen kann, ob er geschlossen oder offen ist, was an einer Firewall liegen kann, wird gefiltert.

In dem oben gezeigten Beispiel scannen wir scanme.nmap.com, das sich selbst zum Scannen autorisiert hat.
```
nmap -F scanme.nmap.org
```
Sie können auch die Schnellscan-Option -F verwenden, um nur die 100 am häufigsten verwendeten Ports jedes Protokolls zu scannen, das gescannt werden soll.

## IP-Adresse scannen
```
nmap 8.8.8.8
```
Ergebnis
```
Starting Nmap 7.80 ( https://nmap.org ) at 2024-07-05 08:34 CEST
Nmap scan report for dns.google (8.8.8.8)
Host is up (0.0069s latency).
Not shown: 998 filtered ports
PORT    STATE SERVICE
53/tcp  open  domain
443/tcp open  https
```




