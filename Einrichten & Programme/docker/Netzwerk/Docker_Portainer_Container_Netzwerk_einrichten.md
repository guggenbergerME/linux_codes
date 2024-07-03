# Docker/Portainer Container Netzwerk

Wer mehrere Container über das Standard-Netzwerk „bridge“ verbindet, wird wohl früher oder später darüber stolpern: 
Im Standard-Bridge-Netzwerk von Docker gibt es u. a. nicht nur keine Namensauflösung (DNS) sondern auch keine Möglichkeit den Containern feste 
IP-Adressen im virtuellen Netz zu vergeben (Alle Einschränkungen zum Nachlesen in den Docker Docs). 
Doch es gibt eine Lösung. Legt man sich nämlich sein eigenes Bridge-Netzwerk an umgeht man die Beschränkungen.


## Kurzanleitung zum Anlegen des eigenen Bridge Netzwerks

Wir navigieren in der Portainer Weboberfläche zu ```Networks``` und klicken auf den Button „Add network“. 
Es öffnet sich ein Formular. Hier geben wir dem Netzwerk einen aussagekräftigen Namen. 
Passend zum iob_public (MACVLAN) aus meinem Tutorial nenne ich das Netzwerk „iob_private“, da dieses Netzwerk nur für die Docker-interne Kommunikation genutzt werden soll.

Als „Driver“ wählen wir ```bridge```, denn es soll ja schließlich ein Solches werden.

Unter „Network configuration“ benötigen wir lediglich die Angaben für das „Subnet“ und das „Gateway“. 
Hier sollte natürlich ein Subnetz genutzt werdend das noch nicht im gebrauch ist!
```
172.18.0.0/16
```
und lege das Gateway auf 
```
172.18.0.1
```
 fest.

Die Schalter unter „Advanced configuration“ lassen wir aus geschaltet. 
Hier könnten wie das Netzwerk noch als rein internes Netz beschränken, da wir aber ggf. noch einzelne Ports (z.B. von einem Datenbank-Container) 
von außen erreichbar machen wollen, verzichten wir darauf.
Auch den Punkt „Enable manual container attachment“ benötigen wir nicht.

Die „Access Control“ ist, wie auch schon bei der Erstellung des ioBroker-Containers reine Geschmackssache, 
und wirk sich nur auf die Berechtigungen unterschiedlicher User innerhalb von Portainer aus.

Über den Button „Create the network“ erstellen wir das Netzwerk. Es ist ab sofort zur Verwendung bereit.
