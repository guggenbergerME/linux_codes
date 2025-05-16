# SSH Kopie

Alle Bilder in einem Ordner per SSH kopieren

```
#!/bin/bash

# === Konfiguration ===
REMOTE_USER="root"
REMOTE_HOST="10.251.0.30"
REMOTE_PATH="/root/upload"
LOCAL_PATH="/home/pc813/Bilder/Darktable/20250516_plan/"

# === Datei oder Verzeichnis übertragen ===
echo "Starte Dateiübertragung nach $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH ..."
scp -r "$LOCAL_PATH" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

# === Status prüfen ===
if [ $? -eq 0 ]; then
    echo "✅ Übertragung erfolgreich!"
    
    # === Lokal löschen ===
    echo "Lösche lokale Datei/Verzeichnis: $LOCAL_PATH"
    rm -rf "$LOCAL_PATH"

    if [ $? -eq 0 ]; then
        echo "🗑️ Lokal erfolgreich gelöscht."
    else
        echo "⚠️ Fehler beim Löschen der lokalen Datei."
    fi
else
    echo "❌ Fehler bei der Übertragung. Lokale Datei bleibt erhalten."
fi

```
