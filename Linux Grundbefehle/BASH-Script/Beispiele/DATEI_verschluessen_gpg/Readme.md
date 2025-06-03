# Datei Verschlüsseln und Backup verschieben

```

#!/bin/bash

# Quellverzeichnis
SOURCE_DIR="/home/pc813/Downloads"

# Zielverzeichnisse Nextcloud Ordner
DEST_DIR="[ORDNER]"
DEST_DIR2="[ORDNER]"
DEST_DIR3="[ORDNER]"
DEST_DIR4="[ORDNER]"
DEST_DIR5="[ORDNER]"
DEST_DIR6="[ORDNER]"

# GPG Empfänger
RECIPIENT="GPG EMAIL"         
FILENAME_PATTERN="bitwarden_org_export_*.json"    # Nur diese Dateien werden verschlüsselt

# Zielverzeichnis erstellen, falls es nicht existiert
mkdir -p "$DEST_DIR"

# Durchsuche nur Dateien, die dem Namensmuster entsprechen
for file in "$SOURCE_DIR"/$FILENAME_PATTERN; do
    # Prüfen, ob es eine reguläre Datei ist (nicht leerer Treffer)
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        gpg --yes --batch --encrypt -r "$RECIPIENT" "$file"

        if [ $? -eq 0 ]; then
            rm "$file"
            cp "$file.gpg" "$DEST_DIR/"
            cp "$file.gpg" "$DEST_DIR2/"
            cp "$file.gpg" "$DEST_DIR3/"
            cp "$file.gpg" "$DEST_DIR4/"
            cp "$file.gpg" "$DEST_DIR5/"
            cp "$file.gpg" "$DEST_DIR6/"
            echo "✅ $filename wurde verschlüsselt und verschoben."
        else
            echo "❌ Fehler beim Verschlüsseln von $filename"
        fi
    fi
done

```
