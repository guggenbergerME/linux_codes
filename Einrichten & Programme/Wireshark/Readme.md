# Wireshark


## Filter

Nach einem IP Bereich suchen
```
ip.src == 10.100.0.0/16
```
Pakete nach einem Zielport suchen
```
tcp.dstport == 80 
```
Suche verketten
```
tcp.dstport == 80 and ip.src == 172.16.1.32
```
