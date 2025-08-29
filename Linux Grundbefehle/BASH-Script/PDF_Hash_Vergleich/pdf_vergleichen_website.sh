#!/bin/bash
# pdfhttpcompare.sh – vergleicht ein PDF von einer URL mit einer Datei im Ordner alt

if [ $# -ne 2 ]; then
    echo "Usage: $0 <pdf_url> <ordner_alt>"
    exit 1
fi

URL="$1"
ALT_DIR="$2"

if [ ! -d "$ALT_DIR" ]; then
    echo "Fehler: '$ALT_DIR' ist kein gültiger Ordner."
    exit 2
fi

# Dateiname aus der URL extrahieren
FNAME=$(basename "$URL")
ALT_FILE="$ALT_DIR/$FNAME"

if [ ! -f "$ALT_FILE" ]; then
    echo "Fehler: '$ALT_FILE' existiert nicht."
    exit 3
fi

# Temp-Datei für Download
TMP_FILE=$(mktemp /tmp/pdf.XXXXXX.pdf)

echo "Lade PDF von $URL ..."
curl -s -L -o "$TMP_FILE" "$URL"

if [ ! -s "$TMP_FILE" ]; then
    echo "Fehler: Konnte PDF nicht herunterladen."
    rm -f "$TMP_FILE"
    exit 4
fi

# Hashes vergleichen
HASH_NEW=$(sha256sum "$TMP_FILE" | awk '{print $1}')
HASH_OLD=$(sha256sum "$ALT_FILE" | awk '{print $1}')

if [ "$HASH_NEW" != "$HASH_OLD" ]; then
    echo "❌ Unterschied gefunden: $FNAME"
else
    echo "✔ Keine Änderung: $FNAME"
fi

# Aufräumen
rm -f "$TMP_FILE"
