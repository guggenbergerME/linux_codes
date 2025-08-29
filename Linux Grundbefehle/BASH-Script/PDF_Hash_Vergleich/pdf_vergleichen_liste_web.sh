#!/bin/bash
# pdfhttpcompare_list.sh – vergleicht mehrere PDFs von URLs mit Dateien im Ordner alt

if [ $# -ne 2 ]; then
    echo "Usage: $0 <url_liste.txt> <ordner_alt>"
    exit 1
fi

URL_FILE="$1"
ALT_DIR="$2"

if [ ! -f "$URL_FILE" ]; then
    echo "Fehler: '$URL_FILE' existiert nicht."
    exit 2
fi

if [ ! -d "$ALT_DIR" ]; then
    echo "Fehler: '$ALT_DIR' ist kein gültiger Ordner."
    exit 3
fi

# Jede Zeile der URL-Liste verarbeiten
while IFS= read -r URL; do
    # Leere Zeilen überspringen
    [ -z "$URL" ] && continue

    FNAME=$(basename "$URL")
    ALT_FILE="$ALT_DIR/$FNAME"

    echo "➡️  Prüfe $FNAME ..."

    if [ ! -f "$ALT_FILE" ]; then
        echo "   ⚠️  Keine Vergleichsdatei gefunden: $ALT_FILE"
        continue
    fi

    TMP_FILE=$(mktemp /tmp/pdf.XXXXXX.pdf)

    # PDF laden
    curl -s -L -o "$TMP_FILE" "$URL"

    if [ ! -s "$TMP_FILE" ]; then
        echo "   ❌ Fehler beim Download von $URL"
        rm -f "$TMP_FILE"
        continue
    fi

    # Hashvergleich
    HASH_NEW=$(sha256sum "$TMP_FILE" | awk '{print $1}')
    HASH_OLD=$(sha256sum "$ALT_FILE" | awk '{print $1}')

    if [ "$HASH_NEW" != "$HASH_OLD" ]; then
        echo "   ❌ Unterschied erkannt"
    else
        echo "   ✔ Keine Änderung"
    fi

    rm -f "$TMP_FILE"
done < "$URL_FILE"
