# JPG ind ein PDF umwandeln

## Benötigt wird

ImageMagick

    apt-get install ImageMagick

## Script

```
#!/bin/bash

# Überprüfen, ob zwei Argumente übergeben wurden (Eingabe- und Ausgabeordner)
if [ "$#" -ne 2 ]; then
    echo "Verwendung: $0 /pfad/zum/eingabeordner /pfad/zum/ausgabeordner"
    exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"

# Überprüfen, ob Eingabeordner existiert
if [ ! -d "$INPUT_DIR" ]; then
    echo "Fehler: Eingabeordner '$INPUT_DIR' existiert nicht."
    exit 2
fi

# Ausgabeordner erstellen, falls nicht vorhanden
mkdir -p "$OUTPUT_DIR"

# Überprüfen, ob ImageMagick installiert ist
if ! command -v convert >/dev/null 2>&1; then
    echo "Fehler: 'convert' (ImageMagick) ist nicht installiert."
    exit 3
fi

# Alle .jpg Dateien verarbeiten (Groß- und Kleinschreibung beachten)
shopt -s nullglob nocaseglob
for jpgfile in "$INPUT_DIR"/*.jpg; do
    filename=$(basename "$jpgfile" .jpg)
    outputfile="$OUTPUT_DIR/$filename.pdf"

    # Konvertieren
    if convert "$jpgfile" "$outputfile"; then
        echo "Erstellt: $outputfile"
        rm "$jpgfile"
        echo "Gelöscht: $jpgfile"
    else
        echo "Fehler beim Konvertieren von: $jpgfile"
    fi
done
shopt -u nullglob nocaseglob

```
## Script ausführbar machen

    chmod +x SCRIPT

## Script ausführen

    ./jpg2pdf.sh /root/upload/20250516_plan /root/upload/pdf    
