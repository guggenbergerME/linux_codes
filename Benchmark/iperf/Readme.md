# iperf

Möchte man die Geschwindigkeit eines Netzwerkes messen, bietet sich iperf an. Dieses Client-Server-Programm für die Kommandozeile ermöglicht es, den Durchsatz zwischen zwei Rechnern zu messen. 
Es ist dabei recht einfach zu bedienen und bietet eine schnellere und präzisere Auswertung als andere Methoden, wie z.B. das Kopieren einer großen Datei.

## Installation¶

Das Programm kann direkt aus den offiziellen Paketquellen installiert [1] werden:

+ iperf (universe)

Befehl zum Installieren der Pakete:
```
sudo apt-get install iperf 
```
Oder mit apturl installieren, Link: apt://iperf

Das Programm hat keine grafische Benutzeroberfläche und wird über die Konsole gestartet. Für einen Test benötigt man zwei Rechner, auf denen iperf läuft. 
Auf dem einen startet man iperf im Servermodus, auf dem anderen im Clientmodus.

## Bedienung

Zum Start von iperf im Servermodus gibt man ein:
```
iperf -s 
```
Auf dem Client startet man iperf über:
```
iperf -c IP_DES_SERVERS 
```
IP_DES_SERVERS muss natürlich durch die konkrete IP-Adresse ersetzt werden. Anschließend wird die Verbindungsgeschwindigkeit getestet und ausgegeben. Eine Ausgabe kann folgendermaßen aussehen:
```
------------------------------------------------------------
Client connecting to 192.168.1.2, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  3] local 192.168.1.1 port 53233 connected with 192.168.1.2 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec    300 MBytes    252 Mbits/sec
```
Interessant ist der Wert bei Bandwith, der die Verbindungsgeschwindigkeit ausgibt. Im gezeigten Beispiel wurde zwischen zwei virtuellen Maschinen gemessen, die auf dem gleichen Rechner laufen. Andere Verbindung liefern natürlich andere Werte.
