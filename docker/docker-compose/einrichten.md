# Docker Compose einrichten

Um sicherzustellen, dass wir die aktuellste stabile Version von Docker Compose erhalten, werden wir diese Software von ihrem offiziellen Github-Repository herunterladen.

Bestätigen Sie zunächst die auf ihrer Seite verfügbare neueste Version. Zum Zeitpunkt des Schreibens dieses Artikels ist die aktuellste stabile Version 2.27.1

> sudo curl -L "https://github.com/docker/compose/releases/download/2.27.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
