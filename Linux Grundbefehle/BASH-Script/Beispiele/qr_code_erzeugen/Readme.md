# BASH QR Code erzeugen

## Voraussetzungen
Installiere die nötigen Tools:

```
sudo apt update
sudo apt install qrencode imagemagick
```


## BASH Script für Zweckformat 3475

```
#!/bin/bash

# Einstellungen
start_num=1         # Startnummer
anzahl=24           # Anzahl der QR-Codes (max. 24 pro Blatt)
prefix="CODE"       # Text vor der Nummer
output_dir="qrcodes"
labeled_dir="qrcodes_labeled"
page_output="qr_codes_A4.pdf"

# Maße in mm
etikett_breite_mm=70
etikett_hoehe_mm=36
dpi=300
etikett_breite_px=$((etikett_breite_mm * dpi / 25))
etikett_hoehe_px=$((etikett_hoehe_mm * dpi / 25))
fontsize=20         # Schriftgröße

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

    # QR-Code auf Etikettengröße anpassen und Text hinzufügen
    convert "$qr_file" -resize x$((etikett_hoehe_px - 30)) \
        -gravity center -extent ${etikett_breite_px}x$((etikett_hoehe_px - 30)) \
        -background white miff:- | \
    convert - -gravity south -background white -splice 0x30 \
        -pointsize $fontsize -annotate +0+5 "$code" \
        -extent ${etikett_breite_px}x${etikett_hoehe_px} "$labeled_file"
done

echo "📄 Erzeuge DIN A4-Seite mit montierten QR-Codes..."

# QR-Codes auf A4 montieren
montage "$labeled_dir"/*.png -tile 3x8 \
    -geometry +0+0 -page A4 "$page_output"

echo "✅ Fertig! Gespeichert als: $page_output"
```

## Script Ausführbar machen

        chmod +x qr_dinA4_generator.sh

## FEHLER: ImageMagick security policy 'PDF' blocking conversion

Öffnen der Datei

    /etc/ImageMagick-X/policy.xml

Einfügen/Ändern der Schreibrechte für PDF

    <policy domain="coder" rights="read | write" pattern="PDF" />
