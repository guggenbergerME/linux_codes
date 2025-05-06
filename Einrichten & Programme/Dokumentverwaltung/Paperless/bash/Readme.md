# Paperless Bash Scripte
Script Beispiele zum verarbeiten von Scanner PDF Files.


## Beispiel PDF verschieben mit Log

```
#!/bin/bash

# Quelle
source_dir="/home/d1"

# Ziel
destination_dir="/home/paperless/paperless-ngx/consume"

# log
log_file="/home/paperless/bash/logfile/pdfcopy.log"

# log schreiben
log() {
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "[$timestamp] $1" >> "$log_file"
}

# Verzeichnis prüfen
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

# Finde und verschieben die PDF-Dateien
log "Verschieben der PDF-Dateien von '$source_dir' nach '$destination_dir'."
copied_count=0
find "$source_dir" -type f -name "*.pdf" -exec mv {} "$destination_dir" \;
while IFS= read -r -d $'\0' file; do
  copied_count=$((copied_count + 1))
  log "Kopiere: '$file' nach '$destination_dir'."
done < <(find "$source_dir" -type f -name "*.pdf" -print0)

# Gib eine Erfolgsmeldung aus
log "Erfolgreich. $copied_count PDF-Dateien verschoben."

exit 0
```
