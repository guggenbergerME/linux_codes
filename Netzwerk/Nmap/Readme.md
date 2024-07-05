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

## Ein Subnetz scannen
```
nmap 192.168.0.0/24
```
Ergebnis
```
$nmap 192.168.0.0/24
Start von Nmap 7.80 ( https://nmap.org ) um 2020-09-18 20:15 UTC
Nmap-Scanbericht für server-1.geekflare.com/de (192.168.0.7)
Der Host ist verfügbar (0.044s Latenz).
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh

Nmap-Scanbericht für server-2.geekflare.com/de (192.168.0.8)
Der Host ist verfügbar (0.046s Latenzzeit).
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh

Nmap-Scanbericht für server-3.geekflare.com/de (192.168.0.9)
Der Host ist verfügbar (0.043s Latenzzeit).
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh

Nmap-Scanbericht für server-4.geekflare.com/de (192.168.0.10)
Der Host ist verfügbar (0.044s Latenzzeit).
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh

Nmap fertig: 256 IP-Adressen (4 Hosts) gescannt in 4,67 Sekunden
```

## Scannen mehrerer Hosts

Das Scannen mehrerer Hosts ist ganz einfach!

Fügen Sie die Hostnamen oder IP-Adressen, die Sie scannen möchten, nacheinander in einer Reihe ein
```
nmap 192.168.0.1 192.168.0.3 192.168.0.4
```

### Komma verwenden

Der oben genannte Befehl könnte auch wie folgt geschrieben werden, um die IP-Adresse nicht noch einmal zu erwähnen
```
nmap 192.168.0.1,3,4
```
### Bindestrich

Verwenden Sie Bindestriche (-), um den IP-Adressbereich wie unten gezeigt anzugeben
```
nmap 192.168.0.1-20
```

### *

Mit dem obigen Befehl werden die ersten zwanzig Hosts des Subnetzes gescannt.

Verwenden Sie Platzhalter, um das gesamte Subnetz zu scannen –
```
nmap 192.168.0.*
```
Der obige Befehl scannt nach allen 256 IP-Adressen im Subnetz.

### Hosts ais einer Datei

Hosts aus einer Datei lesen

Sie können alle Hosts, die gescannt werden sollen, in einer Datei angeben und den folgenden Befehl verwenden –

```
nmap -iL /tmp/hostfile
```

Beispiel einer Hostdatei –

```
cat /tmp/hostfile
192.168.0.1,2,4
scanme.nmap.org
10.0.0-255.1-254
```

### Hosts von der Suche ausschließen
Sie können einige Hosts von der Gruppensuche ausschließen, wenn Sie möchten.
```
nmap 192.168.0.* --ausschließen 192.168.0.2
nmap 192.168.0.1-40 --ausschließen 192.168.0.5,6,7
```

Sie können auch Hosts von Ihrer Suche ausschließen, indem Sie das Flag -excludefile verwenden

```
nmap 192.168.0.* --excludefile /tmp/hosts.txt
```

## Nmap Port-Auswahl
Um bestimmte Ports auf einem System zu scannen, können Sie anstelle der standardmäßigen Top 1000 häufig verwendeten Ports den Parameter -p verwenden. 

```
nmap -p 22,80,443 192.168.0.2-50
```
Ergebnis 
```
$nmap -p 22,80,443 192.168.0.2-50
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 20:18 UTC
Nmap-Scanbericht für server-1.geekflare.com/de (192.168.0.7)
Der Host ist verfügbar (0.00018s Latenz).

PORT STATUS SERVICE
22/tcp offen ssh
80/tcp geschlossen http
443/tcp geschlossen https

Nmap-Scan-Bericht für server-2.geekflare.com/de (192.168.0.8)
Der Host ist verfügbar (0.00094s Latenz).

PORT STATUS SERVICE
22/tcp offen ssh
80/tcp geschlossen http
443/tcp geschlossen https

Nmap-Scan-Bericht für server-3.geekflare.com/de (192.168.0.9)
Der Host ist verfügbar (0.00092s Latenz).

PORT STATUS SERVICE
22/tcp offen ssh
80/tcp geschlossen http
443/tcp geschlossen https

Nmap-Scan-Bericht für server-4.geekflare.com/de (192.168.0.10)
Der Host ist verfügbar (0.00089s Latenz).

PORT STATUS SERVICE
22/tcp offen ssh
80/tcp geschlossen http
443/tcp geschlossen https

Nmap erledigt: 49 IP-Adressen (4 Hosts) gescannt in 1,65 Sekunden
```

Der obige Befehl scannt nur nach den Ports 22, 80 und 443 auf den genannten IP-Adressen.
```
nmap -p 1-500 192.168.0.2
```
Der obige Befehl scannt nach den Ports 1 bis 500 auf dem genannten Host.
```
nmap -p- 192.168.0.2
```
Mit ```-p-``` werden alle 65535 Ports gescannt.

