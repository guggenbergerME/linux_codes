# OpenSSH Public Key Authentifizierung
Dieser Artikel zeigt, wie ein SSH-Zugang für eine Authentifizierung mittels Public-Key-Verfahren konfiguriert wird. Dazu wird am Client ein Schlüsselpaar erstellt, der öffentliche Teil der Schlüssel auf den Server übertragen und anschließend der Server für die Schlüssel-Authentifizierung eingerichtet. Der Benutzer kann sich dadurch ohne Login-Passwort am Server anmelden, es wird ausschließlich das Passwort zum Schutz des privaten Schlüssels benötigt. Die verwendeten Betriebssysteme in diesem Artikel sind einerseits ein Ubuntu 12.10 am Client und andererseits ein Ubuntu 12.04 am Server. Die Anleitung wurde ebenso unter Ubuntu 16.04 und 18.04 als Client und Server sowie unter Ubuntu 20.04 als Client und Server geprüft. 

## Am Client

Zuerst wird am Client das Schlüsselpaar generiert und anschließend zum Server übertragen.

### Home-Verzeichnis Rechte

Standardmäßig sind unter Ubuntu die Rechte der Home-Verzeichnisse der User auf 755 gesetzt. Prüfen Sie trotzdem zur Sicherheit, ob die Rechte auch bei Ihrem System auf 755 stehen und änderen Sie die Rechte gegebenenfalls:
```
sudo chmod 755 /home/<USER>
```
### Schlüsselpaar generieren

Im ersten Schritt wird am Client ein Schlüsselpaar mit ssh-keygen erstellt. Falls Sie am Server ein Ubuntu 18.04 einsetzen, wird das Paket openssh-server in der Version 7.6 installiert.[1] Seit dieser Version werden RSA Bitlängen kleiner als 1024 Bit nicht mehr akzeptiert.[2]

In diesem Beispiel wird für die RSA-Schlüssel eine Bitlänge von 4096 Bit ausgewählt: 

```
pc@pc:~$ ssh-keygen -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/pc/.ssh/id_rsa): 
/home/pc/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/pc/.ssh/id_rsa
Your public key has been saved in /home/pc/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:jha0u6JEzA7qIBRVqD/b4Ts6ULlNz5PCoplb4ObnVX8 pc813@pc813
The key's randomart image is:
+---[RSA 4096]----+
|   .o.           |
|  ..             |
| .. . .          |
| +.o o .         |
|.o* = =.S        |
|+=.= =.X.        |
|+oB.*.* o. E     |
|*=.+o= .  .      |
| +=+oo+          |
+----[SHA256]-----+
pc@pc:~/.ssh$ ls
authorized_keys  id_rsa  id_rsa.pub  known_hosts  known_hosts.old

```
**Achtung**: Es wird aus sicherheitstechnischen Gründen empfohlen, den Schlüssel auf jeden Fall mit einer Passphrase zu schützen.

## Öffentl. Schlüssel auf Server übertragen

Für das Übertragen des öffentlichen Schlüssels auf den Server wird im ersten Schritt noch die SSH-Verbindung mittels Passwort-Authentifizierung genutzt. Das Werkzeug ssh-copy-id kopiert das entsprechende Identity-File auf den Server: 

```
ssh-copy-id -i /home/pc/.ssh/id_rsa.pub benutzer@XXX.XXX.XXX.XXX
```

Das oben genannte Prozedere hat am Server in der Datei ```/home/benutzer/.ssh/authorized_keys``` folgenden Eintrag erstellt: 

```:~$ cat .ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7qmegDxzv1omqG2cWM+i+qaEGzCoSBwqCeXyGUU93sTqtNYYHJVGj6YZqXeXEGzJtKm2A/uo59Y+WmqhJgW7HcT2Hqvo80NfbIRhqE9TJETyBe
GiiC8qpiYgPC2zigCNvTsRXh0CH5FJ1qy4QEBjztQDWOqSrsoOSJEEWCJiKJizTiXDmlGdiKE409GBo8lvlbMRWbrMj3iX825WTqy/T0Pio1kqANDotLnPA0sRXUPVyzc/ghzqRHzFetzP9j7C0nh
EvjiJphiuYvhbgix79FrCQG0lXBGcAWzsWUeAoT/d3kQu79+UTWxm+z4pnJ7gkKVMejqrWys560SdAqD264dc5UBRGI9j6XxVKdraSaEitDneONrSAt2tE/RwRxh2ASxqQfdF88zyDI8/ma608tHc
FROaNsn5hF+/wzjRK9akdhp5WjA5HXhg2OlkwKvSMhGlSgotRj5pr4Ebxjegysy1mEWRFN/vh/oNq4uHQy8adpfogaVELkI/Z2nuAdQk+uMy6D1hrKhUWubmBPxTbG00IWF25Tyuz8hnFRP9+gB/P
NRlF59/EHy27a72nirvuOyfxKnx/Mn+FD9Ah59OSLhWuo3sN9Im8yc2cliecwMz+DmTtE7TwzNw9v2zfxU9JDQwyLtppULiGpmKFOLHjz+SVGxSbVsWS//IyNK1GrQ== gschoenb@gschoenb-X220
```

## Testen der Key-Authentifizierung

Nachdem sich nun der öffentlich. Schlüssel am Server befindet, kann vom Client aus die Verbindung getestet werden. Wichtig ist dabei, dass nicht nach dem Passwort des Benutzers am Server gefragt wird, sondern die Passphrase, mit der der Schlüssel geschützt ist, verlangt wird!
```
ssh -i /home/pc/.ssh/id_rsa.pub  benutzer@XXX.XXX.XXX.XXX
```
Daraufhin erscheint bei GUI-basierten Systemen eine Fragebox. Nach Eingabe des Passworts, mit dem der Schlüssel beim Erstellen geschützt wurde, ist man am System authentifiziert: 





