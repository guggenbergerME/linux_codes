#!/bin/bash

# Einstellungen
start_num=2000         # Startnummer
anzahl=24           # Anzahl der QR-Codes
prefix="ASN"       # Text vor der Nummer
output_dir="ausgabe/qrcodes"
labeled_dir="ausgabe/qrcodes_labeled"
page_output="GIMA_QR_CODES_A4.pdf"

# Layout
cols=3              # Spalten pro Seite
rows=8              # Zeilen pro Seite
qrsize=200          # QR-Code-Größe (quadratisch)
fontsize=28         # Schriftgröße für Text
spacing=100          # Abstand zwischen Codes in der Montage

# Verzeichnisse vorbereiten
mkdir -p "$output_dir" "$labeled_dir"
rm -f "$output_dir"/*.png "$labeled_dir"/*.png "$page_output"

echo "🔄 Generiere QR-Codes mit Text darunter..."

for ((i=0; i<$anzahl; i++)); do
    num=$((start_num + i))
    code="${prefix}${num}"
    qr_file="$output_dir/${code}.png"
    labeled_file="$labeled_dir/${code}.png"

    # QR-Code erzeugen
    qrencode -o "$qr_file" -s 10 -l H "$code"

    # Text unterhalb hinzufügen
    convert -size ${qrsize}x60 xc:white -gravity center \
        -pointsize $fontsize -annotate +0+0 "$code" "label.png"

    convert "$qr_file" -resize ${qrsize}x${qrsize} miff:- | \
    convert - label.png -append "$labeled_file"

    rm label.png
done

echo "📄 Erzeuge DIN A4-Seite mit montierten QR-Codes..."

# QR-Codes auf A4 montieren
montage "$labeled_dir"/*.png -tile ${cols}x${rows} \
    -geometry +${spacing}+${spacing} "$page_output"

echo "✅ Fertig! Gespeichert als: $page_output"
