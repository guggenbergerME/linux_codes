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
´´´
sudo apt-get install nmap -y
´´´
