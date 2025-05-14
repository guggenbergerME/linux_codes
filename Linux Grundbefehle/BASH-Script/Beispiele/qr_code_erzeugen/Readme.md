# BASH QR Code erzeugen

## Voraussetzungen
Installiere die nötigen Tools:

```
sudo apt update
sudo apt install qrencode imagemagick
```


## qr_code_script.sh

```
#!/bin/bash

# Einstellungen
start_num=1         # Startnummer
anzahl=30           # Anzahl der QR-Codes
prefix="CODE"       # Text vor der Nummer
output_dir="qrcodes"
labeled_dir="qrcodes_labeled"
page_output="qr_codes_A4.pdf"

# Maße
cols=5              # QR-Codes pro Zeile
rows=6              # Zeilen (QR-Codes pro Spalte)
qrsize=250          # QR-Bildgröße in Pixel
fontsize=20         # Schriftgröße
spacing=10          # Abstand zwischen QR-Codes

# Verzeichnisse vorbereiten
mkdir -p "$output_dir" "$labeled_dir"
rm -f "$output_dir"/*.png "$labeled_dir"/*.png

echo "Generiere QR-Codes mit Text..."

# QR-Codes generieren und beschriften
for ((i=0; i<$anzahl; i++)); do
    num=$((start_num + i))
    content="${prefix}${num}"
    qrfile="$output_dir/${content}.png"
    labeledfile="$labeled_dir/${content}.png"

    # QR-Code erstellen
    qrencode -o "$qrfile" -s 10 -l H "$content"

    # Beschriftung hinzufügen
    convert "$qrfile" -resize ${qrsize}x${qrsize} \
        -gravity center -background white -splice 0x40 \
        -pointsize $fontsize -annotate +0+10 "$content" \
        "$labeledfile"
done

echo "Erzeuge A4-Seite mit beschrifteten QR-Codes..."

# QR-Codes zu einer Seite montieren
montage "$labeled_dir"/*.png -tile ${cols}x${rows} \
    -geometry +${spacing}+${spacing} "$page_output"

echo "Fertig! Datei gespeichert als: $page_output"
```

## Script Ausführbar machen


## FEHLER: ImageMagick security policy 'PDF' blocking conversion

Öffnen der Datei

    /etc/ImageMagick-X/policy.xml

Einfügen/Ändern der Schreibrechte für PDF

    <policy domain="coder" rights="read | write" pattern="PDF" />
