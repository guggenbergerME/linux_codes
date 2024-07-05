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

## Umleitung der Ausgabe in eine Datei

Standardmäßig gibt Nmap die Ausgabe auf dem Terminal aus, aber wenn Sie ein großes Netzwerk scannen, ist es besser, die Ergebnisse zur besseren Analyse in einer Datei zu speichern. Sie können die Ergebnisse der Scans in verschiedenen Dateiformaten speichern.

### Normales Ausgabeformat [-oN]

Im normalen Modus erhalten Sie die Ausgabe so, wie Sie sie auf Ihrem Bildschirm sehen.

```
nmap -oN /tmp/scanResult.txt 192.168.0.0/24
```

### XML-Ausgabeformat [-oX]

Wir können die Ergebnisse im XML-Format exportieren. Es ist eines der am häufigsten verwendeten Dateiformate, da die meisten Programmiersprachen über Bibliotheken zum Parsen von XML verfügen.
```
nmap -oX /tmp/scanResult.xml 192.168.0.0/24
```

#### Grepable Ausgabeformat [-oG]

Wir erhalten die Ausgabe in einem Format, das sehr einfach mit dem Befehl grep verwendet werden kann. Die Ausgabe kann später an Kommandozeilenprogramme wie awk, grep oder sed weitergeleitet werden, um weitere Operationen durchzuführen.
```
nmap -oG /tmp/scanResult.txt 192.168.0.0/24
```

### Skript kiddie output [-oS]

Es verwendet das „leet“ und ersetzt Buchstaben durch ihre visuell ähnlichen Zahlendarstellungen. Dieses Ausgabeformat ist für keinen bestimmten Fall nützlich und wurde nur als Scherz eingebaut.
```
nmap -oS /tmp/scanResult scanme.nmap.org
```
Ergebnis
```
$nmap -oS /tmp/scanResult scanme.nmap.org
Startet Nmap 7.70 ( https://nmap.org ) um 2020-09-18 20:34 UTC
Nmap-Scanbericht für scanme.nmap.org (45.33.32.156)
Der Host ist verfügbar (0.053s Latenzzeit).
Andere Adressen für scanme.nmap.org (nicht gescannt): 2600:3c01::f03c:91ff:fe18:bb2f
Nicht angezeigt: 995 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh
25/tcp gefiltert smtp
80/tcp offen http
9929/tcp offen nping-echo
31337/tcp offen Elite

Nmap erledigt: 1 IP-Adresse (1 Host aktiv) in 2,12 Sekunden gescannt
$
$cat /tmp/scanResult
$tart|Ng Nmap 7.70 ( httpz://NmAp.oRg ) aT 2020-09-18 20:34 UTc
Nmap $can rEp0rt f0r Scanm3.nmap.0rg (45.33.32.156)
H0st iS up (0.053s lat3ncy).
Andere Adressen für $canm3.nmap.0Rg (n0t scanN3D): 2600:3c01::f03c:91ff:fE18:bb2f
Nicht sh0wn: 995 clOs3d p0rtS
P0rT $TAT3 S3RV|C3
22/TCp op3n Ssh
25/tcp f1ltEr3d $mtp
80/tCp op3n http
9929/tcp Öffnen Nping-ech0
31337/tCP 0pen 3litE

Nmap d0n3: 1 Ip addRe$s (1 hO$t up) $CANN3d In 2.12 s3C0nDz
```

## Verschiedene Nmap-Scan-Typen

TCP-Verbindungs-Scan [-sT]

Dies ist die grundlegende Form des TCP-Scans und beinhaltet keine Tarnung. Es wird versucht, eine vollständige Verbindung mit den angegebenen Ports mit einem kompletten Drei-Wege-Handshake-Austausch (SYN -> SYN/ACK -> ACK) herzustellen . Eine erfolgreiche Verbindung zeigt einen offenen Port an.

Dies ist der Standard-Scantyp, den Nmap verwendet, wenn er von einem unprivilegierten Benutzerausgeführt wird .
```
nmap -sT 192.168.0.1
```
```
$nmap -sT 192.168.0.7
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 19:52 UTC
Nmap-Scanbericht für server-1.geekflare.com/de (192.168.0.7)
Der Host ist verfügbar (0.00042s Latenz).
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh

Nmap erledigt: 1 IP-Adresse (1 Host aktiv) gescannt in 0.09 Sekunden
```

## TCP SYN-Scan [-sS]

Dieser auch als halboffener Scan bekannte Scan ist unauffälliger als der TCP-Connect-Scan, da er nie eine vollständige Verbindung herstellt. DerTCP SYN-Scan ist der Standard-Scantyp, wenn er als privilegierter Benutzer ausgeführt wird . Unprivilegierte Benutzer haben keine Berechtigung, diesen Scan auszuführen, da er die Berechtigung auf Raw Socket / Raw Packet erfordert.
```
nmap -sS 192.168.0.1
```
```
$sudo nmap -sS 192.168.0.7
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 19:51 UTC
Nmap-Scanbericht für server-1.geekflare.com/de (192.168.0.7)
Der Host ist verfügbar (0.00022s Latenz).
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh

Nmap erledigt: 1 IP-Adresse (1 Host aktiv) in 1,50 Sekunden gescannt
$nmap -sS 192.168.0.1
Sie haben einen Scantyp angefordert, der Root-Rechte erfordert.
BEENDEN!
```
Wie wir im obigen Beispiel sehen konnten, konnte ein SYN-Scan mit nicht privilegierten Benutzern nicht ausgeführt werden.
UDP-Scan [-sU]

Wenn kein Flag angegeben wird, scannt Nmap standardmäßig nach TCP-Ports. Um nach UDP-Ports zu scannen, müssen wir das Flag -sU verwenden, wie unten gezeigt.
```
$sudo nmap -sU 192.168.0.8
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 19:44 UTC
Nmap-Scanbericht für server-2.geekflare.com/de (192.168.0.8)
Der Host ist verfügbar (0.00036s Latenz).
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
5355/udp offen|gefiltert llmnr

Nmap erledigt: 1 IP-Adresse (1 Host aktiv) gescannt in 999.27 Sekunden
```

## Ping-Scan [-sn]

Dies ist sehr nützlich, wenn Sie nur wissen müssen, ob der Host aktiv ist oder nicht und keine Informationen über offene Ports auf den Hosts benötigen.

Dies wird oft als ‚Ping-Sweep‘ bezeichnet. In früheren Versionen von Nmap war -sn als -sP bekannt.
```
nmap -sn 192.168.1.0/24

$nmap -sn 192.168.1.0/24
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 19:39 UTC
Nmap-Scanbericht für server-7.geekflare.com/de (192.168.1.2)
Der Host ist verfügbar (0.033s Latenzzeit).
Nmap-Scan-Bericht für server-10.geekflare.com/de (192.168.1.3)
Der Host ist aktiv (0.035s Latenzzeit).
Nmap-Scan-Bericht für server-13.geekflare.com/de (192.168.1.4)
Der Host ist aktiv (0.10s Latenzzeit).
Nmap fertig: 256 IP-Adressen (3 Hosts aktiv) gescannt in 9,85 Sekunden
```
Im obigen Beispiel konnten wir sehen, dass im angegebenen Zielsubnetz von 256 gescannten IP-Adressen nur drei Hosts aktiv sind.
```
nmap -sn -n -v 192.168.0.0/24 -oG - | grep -iv down
```
–```sn``` –>
Ping-Scan.

–```n``` –>
Ignorieren Sie die DNS-Auflösung und beschleunigen Sie den Scan.

–```v``` –>
Fügen Sie verbose hinzu, um mehr Informationen über den Scan zu erhalten.

–```oG``` –>
Liefert die Ausgabe im grepbaren Format.

```–``` –>
Bindestrich leitet die grepable-Ausgabe auf die Standardausgabe um, die dann an grep weitergeleitet wird.

–```iv``` –>
Ignorieren Sie die Zeilen, die das Wort ‚down‘ enthalten.
```
$nmap -sn -n -v 192.168.0.0/24 -oG - | grep -iv down
# Nmap 7.70 Scan initiiert Fri Sep 18 19:40:17 2020 als: nmap -sn -n -v -oG - 192.168.0.0/24
# Gescannte Ports: TCP(0;) UDP(0;) SCTP(0;) PROTOCOLS(0;)
Host: 192.168.0.7 () Status: Up
Rechner: 192.168.0.8 () Status: Up
Rechner: 192.168.0.9 () Status: Up
Rechner: 192.168.0.10 () Status: Up
# Nmap ausgeführt am Fri Sep 18 19:40:20 2020 -- 256 IP-Adressen (4 Hosts aktiv) gescannt in 2,91 Sekunden

Von den 256 gescannten IP-Adressen im Subnetz sind nur vier Hosts aktiv.
```

## Erkennung von Betriebssystem- und Service-Versionen

### OS-Scannen

Zusätzlich zum Port-Scanning und der Host-Erkennung kann Nmap auch Informationen über das zugrunde liegende Betriebssystem liefern. Nmap verfügt über eine der größten Datenbanken mit Betriebssystem-Fingerabdrücken und kann Betriebssysteme identifizieren, indem es ihre Antworten auf TCP/IP-Sonden analysiert.

Dies kann mit dem Flag -O aktiviert werden. Nachfolgend finden Sie den Befehl –
```
nmap -O localhost

$sudo nmap -O localhost
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 19:32 UTC
Nmap-Scanbericht für localhost (127.0.0.1)
Der Host ist aktiv (0.000012s Latenzzeit).
Andere Adressen für localhost (nicht gescannt): ::1
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE
22/tcp offen ssh
Gerätetyp: Allzweck
Läuft: Linux 3.X
OS CPE: cpe:/o:linux:linux_kernel:3
OS Details: Linux 3.7 - 3.10
Netzwerk Entfernung: 0 Sprünge

OS-Erkennung durchgeführt. Bitte melden Sie alle fehlerhaften Ergebnisse an https://nmap.org/submit/.
Nmap durchgeführt: 1 IP-Adresse (1 Host aktiv) in 3,89 Sekunden gescannt
```

### Version gescannt

Nmap hilft auch beim Scannen von laufenden Diensten und deren Versionsinformationen von offenen Ports. Dies ist hilfreich beim Scannen von Diensten, die auf anfälligen Versionen laufen und aktualisiert werden könnten, um das Risiko zu mindern.

Es kann mit -sV aktiviert werden
```
nmap -sV localhost

$sudo nmap -sV localhost
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 19:35 UTC
Nmap-Scanbericht für localhost (127.0.0.1)
Der Host ist aktiv (0.000010s Latenzzeit).
Andere Adressen für localhost (nicht gescannt): ::1
Nicht angezeigt: 999 geschlossene Ports
PORT STATUS SERVICE VERSION
22/tcp open ssh OpenSSH 8.0 (Protokoll 2.0)
```
Der Dienst wurde erkannt. Bitte melden Sie alle fehlerhaften Ergebnisse an https://nmap.org/submit/.
Nmap ausgeführt: 1 IP-Adresse (1 aktiver Host) in 1,96 Sekunden gescannt

### Aggressiver Scan

Nmap führt auch einen aggressiven und erweiterten Scan durch, der die Erkennung von Betriebssystemen -O, Skript-Scans -sC, Versions-Scans -sV und Traceroute --traceroute ermöglicht.

Wir können das Argument -A übergeben, um einen aggressiven Scan durchzuführen.
```
$sudo nmap -A scanme.nmap.org
Start von Nmap 7.70 ( https://nmap.org ) um 2020-09-18 20:26 UTC
Nmap-Scanbericht für scanme.nmap.org (45.33.32.156)
Der Host ist verfügbar (0.051s Latenzzeit).
Andere Adressen für scanme.nmap.org (nicht gescannt): 2600:3c01::f03c:91ff:fe18:bb2f
Nicht angezeigt: 995 geschlossene Ports
PORT STATUS SERVICE VERSION
22/tcp open ssh OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.13 (Ubuntu Linux; Protokoll 2.0)
| ssh-hostkey: 
| 1024 ac:00:a0:1a:82:ff:cc:55:99:dc:67:2b:34:97:6b:75 (DSA)
| 2048 20:3d:2d:44:62:2a:b0:5a:9d:b5:b3:05:14:c2:a6:b2 (RSA)
| 256 96:02:bb:5e:57:54:1c:4e:45:2f:56:4c:4a:24:b2:57 (ECDSA)
|_ 256 33:fa:91:0f:e0:e1:7b:1f:6d:05:a2:b0:f1:54:41:56 (ED25519)
25/tcp gefiltert smtp
80/tcp offen http Apache httpd 2.4.7 ((Ubuntu))
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: Mach weiter und ScanMe!
9929/tcp open nping-echo Nping-Echo
31337/tcp open tcpwrapped
Aggressive OS-Erwartungen: Linux 2.6.32 (94%), Linux 3.2 - 4.9 (94%), Linux 2.6.32 - 3.10 (94%), Linux 3.4 - 3.10 (93%), Linux 3.1 (92%), Linux 3.2 (92%), Linux 3.3 (92%), Synology DiskStation Manager 5.2-5644 (92%), Netgear RAIDiator 4.2.28 (92%), AXIS 210A oder 211 Netzwerkkamera (Linux 2.6.17) (92%)
Keine exakten OS-Übereinstimmungen für den Host (Testbedingungen nicht ideal).
Netzwerkentfernung: 7 Hops
Service-Informationen: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (über Port 143/tcp)
HOP RTT ADRESSE
1 48.15 ms 72.14.239.197
2 52.74 ms 209.85.253.9
3 49.54 ms 142.250.234.59
4 49,99 ms 108.170.242.251
5 50.70 ms 213.52.131.176
6 50.85 ms 173.230.159.71
7 53,40 ms scanme.nmap.org (45.33.32.156)

Die Erkennung von Betriebssystemen und Diensten wurde durchgeführt. Bitte melden Sie alle fehlerhaften Ergebnisse an https://nmap.org/submit/.
Nmap ausgeführt: 1 IP-Adresse (1 aktiver Host) gescannt in 259,05 Sekunden
$$sudo nmap -A scanme.nmap.org
Startet Nmap 7.70 ( https://nmap.org ) um 2020-09-18 20:33 UTC
Statistik: 0:00:00 verstrichen; 0 Hosts abgeschlossen (0 up), 0 in Bearbeitung Script Pre-Scan
NSE-Zeitplan: Etwa 0.00% erledigt
```





