
## Daten per SSH kopieren
Möchte man Dateien von einem auf den anderen Rechner via SSH schicken, so geht das via Secure Copy (SCP) Im folgenden Beispiel wird die index.html aus dem Home-Verzeichnis auf den entfernten Rechner in /var/www/html/ abgelegt.
```
scp /home/intux/index.html pi@192.168.1.60:/var/www/html/
```
Das ganze geht natürlich auch umgekehrt
```
scp pi@192.168.1.60:/var/www/html/index.html /home/intux/
```
Ganze Verzeichnisse lassen sich mit der zusätzlichen Option -r auf Reise schicken.
```
scp -r pi@192.168.1.60:/var/www/html/beispiel /home/intux/
