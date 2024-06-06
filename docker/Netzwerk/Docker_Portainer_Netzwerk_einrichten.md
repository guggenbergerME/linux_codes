# Portäiner Docker

## IP`s in Portainer anlegen

Im Bereich Network ein neues Nezuwerk hinzufügen

**Name** 
WUNSCHNAME-conf

**Driver**
macvlan

**Configuration**
Diesen Bereich anklicken um eine Konfig Daŧei zu erzeugen.

**Netzwerkkarte eingeben**
Auf dem "Eltern Gerät" durch nachfolgenden Befehl den Namen der Schnitttstelle auslesen.
```
ip a
```
**Subnetz bereich eingeben**
/24 bestimmt die Netzbits
```
192.168.1.0/24
```
**IP Range**
Wie viele IP`s ksollen erstellt werden.
In diesem Beispiel soll eine IP für einen Dockercontainer angelegt werden
```
192.168.1.22/32
```
/32 setzt die Netbits auf 32 somit kann nur eine Host IP erzeugt werden,
