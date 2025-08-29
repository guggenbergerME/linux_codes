#!/bin/bash
# pdfcompare.sh – vergleicht PDFs aus zwei Ordnern per Hash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <ordner_neu> <ordner_alt>"
    exit 1
fi

NEU="$1"
ALT="$2"

if [ ! -d "$NEU" ] || [ ! -d "$ALT" ]; then
    echo "Fehler: Beide Argumente müssen existierende Ordner sein."
    exit 2
fi

echo "Vergleiche PDFs in '$NEU' mit '$ALT'..."
echo

for pdf in "$NEU"/*.pdf; do
    fname=$(basename "$pdf")
    altfile="$ALT/$fname"

    if [ ! -f "$altfile" ]; then
        echo "⚠️  Kein Vergleich möglich: $fname existiert nicht in '$ALT'"
        continue
    fi

    HASH_NEU=$(sha256sum "$pdf" | awk '{print $1}')
    HASH_ALT=$(sha256sum "$altfile" | awk '{print $1}')

    if [ "$HASH_NEU" != "$HASH_ALT" ]; then
        echo "❌ Unterschied: $fname"
    else
        echo "✔ Gleich: $fname"
    fi
done
