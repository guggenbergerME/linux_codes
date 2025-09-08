# PDF zu jpg
BASH Script das PDF Dokumente zu pdf konvertiert.

**pdf2jpg.sh**

```
#!/bin/bash

# Ordner mit PDFs (aktuelles Verzeichnis, falls nicht angegeben)
INPUT_DIR="${1:-.}"
OUTPUT_DIR="${2:-./output_jpg}"

# Ausgabeverzeichnis erstellen
mkdir -p "$OUTPUT_DIR"

# Alle PDF-Dateien durchgehen
for pdf in "$INPUT_DIR"/*.pdf; do
    # Prüfen, ob überhaupt PDFs vorhanden sind
    [ -e "$pdf" ] || { echo "Keine PDF-Dateien in $INPUT_DIR gefunden."; exit 1; }

    # Dateiname ohne Endung
    filename=$(basename "$pdf" .pdf)

    echo "Wandle $pdf um..."

    # pdftoppm: -jpeg = JPG Ausgabe
    # -r 150 = Auflösung (DPI), ggf. anpassen
    pdftoppm -jpeg -r 150 "$pdf" "$OUTPUT_DIR/$filename"
done

echo "Fertig! Alle JPGs liegen in: $OUTPUT_DIR"
```

Verwendung:

- Skript z. B. als pdf2jpg.sh speichern.
- Ausführbar machen

      chmod +x pdf2jpg.sh

-Starten

    ./pdf2jpg.sh /pfad/zu/pdf /pfad/zum/output


Wenn du keine Pfade angibst, nimmt es das aktuelle Verzeichnis als Eingabe und legt die JPGs in ./output_jpg ab.
