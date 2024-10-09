# Installieren von Docker Compose

Um sicherzustellen, dass wir die aktuellste stabile Version von Docker Compose erhalten, werden wir diese Software von ihrem offiziellen [Github-Repository herunterladen](https://github.com/docker/compose/releases).

Bestätigen Sie zunächst die auf ihrer Seite verfügbare neueste Version. Zum Zeitpunkt des Schreibens dieses Artikels ist die aktuellste stabile Version 2.29.7 .

Mit dem folgenden Befehl wird die Version 2.29.7 herunterladen und die ausführbare Datei unter /usr/local/bin/docker-compose gespeichert, wodurch diese Software global als docker-compose zugänglich wird:

```
sudo curl -L "https://github.com/docker/compose/releases/download/2.29.7/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
