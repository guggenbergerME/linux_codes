# JPG ind ein PDF umwandeln

## Benötigt wird

ImageMagick

    apt-get install ImageMagick

## Script

```
#!/bin/bash

#  ^|berpr  fen, ob zwei Argumente   bergeben wurden (Eingabe- und Ausgabeordner)
if [ "$#" -ne 2 ]; then
    echo "Verwendung: $0 /pfad/zum/eingabeordner /pfad/zum/ausgabeordner"
    exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"

#  ^|berpr  fen, ob Eingabeordner existiert
if [ ! -d "$INPUT_DIR" ]; then
    echo "Fehler: Eingabeordner '$INPUT_DIR' existiert nicht."
    exit 2
fi

# Ausgabeordner erstellen, falls nicht vorhanden
mkdir -p "$OUTPUT_DIR"

#  ^|berpr  fen, ob ImageMagick installiert ist
if ! command -v convert >/dev/null 2>&1; then
    echo "Fehler: 'convert' (ImageMagick) ist nicht installiert."
    exit 3
fi

# Alle .jpg Dateien verarbeiten (Gro ^=- und Kleinschreibung beachten)
shopt -s nullglob nocaseglob
for jpgfile in "$INPUT_DIR"/*.jpg; do
    filename=$(basename "$jpgfile" .jpg)
    outputfile="$OUTPUT_DIR/$filename.pdf"
    convert "$jpgfile" "$outputfile"
    echo "Erstellt: $outputfile"
done
shopt -u nullglob nocaseglob
```

## Script ausführen

    ./jpg2pdf.sh /root/upload/20250516_plan /root/upload/pdf    
