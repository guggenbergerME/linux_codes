# IP-Bereich im Terminal scannen (Linux Mint)

Kurz und knapp: am bequemsten ist nmap, es gibt aber auch andere Tools und einfache Bash-Loops. Wichtig: nur Netzwerke scannen, für die du die Erlaubnis hast.

## Nmap (empfohlen)

Installation:
```
sudo apt update
sudo apt install nmap
```

Beispiele:

Ping-Sweep (nur Hosts finden):
```
nmap -sn 192.168.1.0/24
```

Schneller Port-Scan (typische 1000 Ports):
```
sudo nmap -sS 192.168.1.0/24
```

Service-/OS-Erkennung (detailliert, langsamer):
```
sudo nmap -sS -sV -O -p 1-65535 192.168.1.0/24
```

Ausgabe in Dateien (normal, XML, grepable):
```
nmap -sn 192.168.1.0/24 -oN scan.txt -oX scan.xml
```

Tipps: -sn ist nur Host-Erkennung; -sS ist SYN-Scan (privilegierte Rechte nötig, daher sudo).

## arp-scan (lokales LAN, sehr schnell)

Installation:
```
sudo apt install arp-scan
```

Scan:
```
sudo arp-scan --interface=eth0 192.168.1.0/24
```

Wenn du Wi-Fi nutzt, ersetze eth0 durch wlan0 (oder ip link zur Interface-Abfrage).

## fping (für schnelle Ping-Sweeps)

Installation:
```
sudo apt install fping
```

Scan:
```
sudo fping -a -g 192.168.1.0/24 2>/dev/null
```

Gibt nur erreichbare Hosts aus.

## Einfacher Bash-Ping-Loop (kein Extra-Tool)

Für einen einfachen Check:
```
for i in $(seq 1 254); do
  ip="192.168.1.$i"
  ping -c1 -W1 $ip >/dev/null && echo "$ip ist erreichbar"
done
```

(-W1 = 1s Timeout; Dauer kann je nach Range lang sein.)

## masscan (bei sehr großen Netzen — sehr schnell, externes Paket)

masscan ist extrem schnell, aber vorsichtig verwenden; meistens nicht nötig auf Heimnetz.

##  Hinweise & Sicherheit

Viele Scans benötigen sudo.

Firewalls/Hosts können auf Ping nicht reagieren, sind aber trotzdem erreichbar (nmap hat daher bessere Erkennungsoptionen).

Scannen fremder Netze kann rechtliche/vertragliche Folgen haben — immer Erlaubnis einholen.