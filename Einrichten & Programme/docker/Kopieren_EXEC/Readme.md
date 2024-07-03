# Daten in einen Dockercontainer kopieren

## Daten IN einen Docker Container kopieren
```
docker cp /var/tmp/myfile.dmp NAMEDOCKERCONTAINER:/var/tmp/myfile.dmp
```

## Daten AUS einen Docker Container kopieren
```
docker cp NAMEDOCKERCONTAINER:/var/tmp/myfile.dmp /var/tmp/myfile.dmp
```

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
```
