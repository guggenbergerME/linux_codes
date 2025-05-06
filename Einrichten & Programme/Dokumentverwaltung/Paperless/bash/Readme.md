# Paperless Bash Scripte
Script Beispiele zum verarbeiten von Scanner PDF Files.


## Beispiel PDF verschieben mit Log

```
#!/bin/bash

# Quelle
source_dir="/home/d1"

# Ziel
destination_dir="/home/paperless/paperless-ngx/consume"

# UID Paperless
new_owner="1000"

# Logfile
log_file="/home/paperless/bash/logfile/pdfcopy.log"

# log schreiben
log() {
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "[$timestamp] $1" >> "$log_file"
}

# Verzeichnis check
if [ ! -d "$destination_dir" ]; then
  log "Zielverzeichnis '$destination_dir' existiert nicht. Versuche es zu erstellen..."
  mkdir -p "$destination_dir"
  if [ $? -ne 0 ]; then
    log "Fehler: Zielverzeichnis '$destination_dir' konnte nicht erstellt werden. Skript wird beendet."
    exit 1
  else
    log "Zielverzeichnis '$destination_dir' erfolgreich erstellt."
  fi
fi

# PDF UID ändern
log "Starte: Ändere Eigentümer der PDF-Dateien in '$source_dir' zu '$new_owner' und verschiebe sie nach '$destination_dir'."
find "$source_dir" -type f -name "*.pdf" -exec chown "$new_owner" {} \; -exec mv {} "$destination_dir" \;

# Schleife
copied_count=0
while IFS= read -r -d $'\0' file; do
  copied_count=$((copied_count + 1))
  log "Kopiert: '$file' nach '$destination_dir'."
done < <(find "$source_dir" -type f -name "*.pdf" -print0)

# Gib eine Erfolgsmeldung aus
log "Das Ändern des Eigentümers und das Kopieren der PDF-Dateien ist abgeschlossen. Es wurden $copied_count PDF-Dateien bearbeitet und kopiert."

exit 0
```

## Script ausführbar machen

    sudo chmod +x test.sh

## Script per crontab ausführen
Dieses Script per ```root````als crontab ausjühren. Prüfen des Scannerordners alle 5 Minuten. Pfad zu Script anpassen.

```
*/5 * * * * ~/bash_paperless/pdfcopy.sh
```
