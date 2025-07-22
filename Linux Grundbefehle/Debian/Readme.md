# Debain Grundbefehle

## Debian Benutzer zu sudo Liste hinzufügen
Nutzer der sudo-Gruppe hinzufügen
Ist noch kein Nutzer in der sudo-Gruppe eingetragen, muss dieser Schritt als root durchgeführt werden. Am einfachsten ist der Wechsel auf root mit dem Befehl:

          nutzer@linux:~$ su -

Nach Eingabe des root-Passworts kann ein neuer Nutzer in die Gruppe hinzugefügt werden:

          root@linux:~$ usermod -aG sudo nutzername

Ist man bereits Nutzer mit sudo-Privilegien, ist ein Wechsel auf root nicht notwendig. Hier reicht der Befehl:

          nutzer@linux:~$ sudo usermod -aG sudo nutzername

## Linuxversion anzeigen
```
cat /etc/debian_version
```

## Debain Pakete installieren
Installation von deb Pakete unter Debian.

     sudo apt install -fy ./DEB-PAKET.deb
