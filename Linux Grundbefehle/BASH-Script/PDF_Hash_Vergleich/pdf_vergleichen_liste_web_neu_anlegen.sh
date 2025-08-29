#!/bin/bash
# pdfhttpcompare_list.sh – vergleicht mehrere PDFs von URLs mit Dateien im Ordner alt
# Fehlende PDFs werden automatisch gespeichert
# Download-Fehler werden in eine Logdatei geschrieben
# Zeilen in urls.txt mit [Text] werden ignoriert

if [ $# -ne 2 ]; then
    echo "Usage: $0 <url_liste.txt> <ordner_alt>"
    exit 1
fi

URL_FILE="$1"
ALT_DIR="$2"
LOGFILE="$(dirname "$0")/download_errors.log"

if [ ! -f "$URL_FILE" ]; then
    echo "Fehler: '$URL_FILE' existiert nicht."
    exit 2
fi

if [ ! -d "$ALT_DIR" ]; then
    echo "Fehler: '$ALT_DIR' ist kein gültiger Ordner."
    exit 3
fi

echo "==== Starte Vergleich am $(date) ====" >> "$LOGFILE"

# Jede Zeile der URL-Liste verarbeiten
while IFS= read -r URL; do
    # Leere Zeilen, Kommentare (#...) oder Abschnittsmarker ([...]) überspringen
    [[ -z "$URL" || "$URL" =~ ^# || "$URL" =~ ^\[.*\]$ ]] && continue

    FNAME=$(basename "$URL")
    ALT_FILE="$ALT_DIR/$FNAME"

    echo "➡️  Prüfe $FNAME ..."

    TMP_FILE=$(mktemp /tmp/pdf.X_
