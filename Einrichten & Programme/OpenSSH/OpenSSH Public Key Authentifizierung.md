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
```
