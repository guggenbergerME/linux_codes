# DMZ - Demilitarisierte Zone

Die Idee einer demilitarisierten Zone (DMZ) ist, dass Verbindungen aus dem Internet in die DMZ möglich sind, weil dort zum Beispiel ein Server für die 
Kommunikation von außen erreichbar sein muss. Eine Verbindung aus dem Internet ins LAN soll aber unterbunden werden.,

![Bild](https://www.elektronik-kompendium.de/sites/net/bilder/09072411.png)

Die Demilitarisierte Zone ist ein eigenständiges Subnetz, welches das lokale Netzwerk (LAN) durch Firewall-Router (A und B) vom Internet trennt. Der Firewall-Router A ist so konfiguriert, dass er Datenpakete, für die es keine ausgehenden Datenpakete gab, verwirft. Aus dem Internet und der DMZ können also keine Ziele im LAN adressiert werden, weil diese vom Firewall-Router B verworfen werden. Sollte ein Hacker doch auf den Server innerhalb der DMZ Zugriff erhalten und Datenpakete in das LAN zum Schnüffeln oder Hacken schicken wollen, werden diese vom Firewall-Router B verworfen.
Dieses Vorgehen hat den Vorteil, dass es den Datenverkehr vom Internet kommend aus dem LAN fern hält und deshalb im LAN nur der interne Datenverkehr und die Internet-Verbindungen ablaufen. Das LAN ist dann weniger anfällig für Angriffe und Überlastungen, die durch den Datenverkehr aus dem Internet verursacht werden.
Ein Nachteil ist der Konfigurationsaufwand. In beiden Firewall-Routern müssen statische Routen konfiguriert werden, damit die eingehenden Datenpakete der Verbindungen an die richtigen Hosts im LAN zugestellt werden können. 



### Links
+ [DMZ - Demilitarisierte Zone](https://www.elektronik-kompendium.de/sites/net/0907241.htm)
