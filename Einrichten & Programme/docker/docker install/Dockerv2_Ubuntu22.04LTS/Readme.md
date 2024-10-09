# Docker & Docker Compose v2 – auf Ubuntu 22.04 LTS installieren

## Docker-Repository hinzufügen
### Alte Sourcenliste entfernen

Um uns nun die aktuelle Docker-Version installieren zu können müssen wir erst mal das aktuelle Docker-Repository hinzufügen. Dazu löschen wir erst mal eventuell alte vorhandene Repositories:
```
sudo rm /etc/apt/sources.list.d/docker.list
```
Wenn es sich um eine frische Ubuntu-Installation handelt wird uns der Befehl einen Fehler auswerfen, da diese Datei nicht vorhanden ist. Diesen Fehler können wir einfach ignorieren.

### Grundvoraussetzungen überprüfen

Je nach Systemzustand kann es sein, dass wir Ubuntu erstmal in die Lage versetzten müssen sich die aktuellen Pakete via HTTPS zu ziehen. So führen wir folgenden System aus um sicher zu stellen, dass die Grundvoraussetzungen alle vorhanden sind oder ggf. installiert werden.

Aktuelle Paketliste aktualisieren
```
sudo apt update
```
Alle notwendigen Pakete installieren:
```
sudo apt install ca-certificates curl gnupg
```
Normal sollten wir alle Grundvoraussetzungen selbst bei einer Minimal-Version erfüllen.

### Schlüssel hinzufügen

In diesem Schritt laden wir uns den aktuellen PGP-Schlüssel von Docker herunter und stellen ihn auf unserer Maschine zur Verfügung.

Verzeichnis anlegen:
```
sudo install -m 0755 -d /etc/apt/keyrings
```
Schlüssel holen und in das Verzeichnis einfügen:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
Rechte vergeben:
```
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

### Repository hinzufügen

Nun fügen wir noch das aktuelle Repository von Docker hinzu:
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## Docker und Docker Compose installieren

Jetzt haben wir alle Vorraussetzungen geschaffen um die aktuellste Version von Docker zu installieren. Zu erst aktualisieren wir nochmals die Paketliste:
```
sudo apt update
```
Und installieren dann Docker und Docker Compose:
```
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
Version 2 von Docker Compose versteckt sich hinter dem Paket docker-compose-plugin.
```
sudo docker --version && docker compose version
```
