# NorthVPN einrichten

## Ubuntu / Debian / LM

Wir empfehlen die native NordVPN-Anwendung, wenn du mit einem Linux-Gerät eine Verbindung zu den Servern von NordVPN herstellen möchtest. Wir haben bei der Entwicklung deine Benutzererfahrung berücksichtigt und können dir damit Funktionen wie „Automatisch verbinden“, einen automatisierten Kill Switch und den Bedrohungsschutz (bei ausgewählten Paketen verfügbar) anbieten. Befolge einfach die folgenden Schritte, um die NordVPN-Anwendung unter Linux zu nutzen. 

**Client installieren per Terminal**
```
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
```  

Hinweis: Wenn du kein curl-Paket hast, was du feststellen kannst, wenn der obere Schritt nicht funktioniert, kannst du alternativ auch folgenden Befehl eingeben:
sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh)

## Download des Clients
+ [NorthVPN Download](https://nordvpn.com/download/linux/?_gl=1*ogg51s*_gcl_au*MjAwMzUxODU3NS4xNzIxODkwMTcy*_ga*MTYzMTI2NDcxMy4xNzIxODkwMTY3*_ga_LEXMJ1N516*MTcyMTg5MDE2Ny4xLjEuMTcyMTg5MDE4MC41Mi4wLjA.&_ga=2.18084025.1611776307.1721890167-1631264713.1721890167)

**Permission denied accessing**

Wenn dir zusätzlich das folgende Problem angezeigt wird: Whoops! Permission denied accessing /run/nordvpn/nordvpnd.sock angezeigt wird, musst du nur den folgenden Befehl eingeben: 
```
sudo usermod -aG nordvpn $USER
```
und anschließend dein Gerät neu starten.

## Anmelden bei NorthVPN

Melde dich bei deinem NordVPN-Konto an:
```
nordvpn login
```

Stelle eine Verbindung mit einem NordVPN-Server her:
```
nordvpn connect
```

