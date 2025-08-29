# PDF auf Änderungen vergleichen

## Namensgleiche PDF`s in zwei Ordner vergleichen
[Mit diesem Script werden pdfś mit gleichem Namen in zwei Ordner verglichen.](https://github.com/guggenbergerME/linux_codes/blob/main/Linux%20Grundbefehle/BASH-Script/PDF_Hash_Vergleich/pdf_vergleich.sh)

Ausfüren des Scriptes

```
chmod +x pdfcompare.sh
./pdf_vergleichen.sh ./neu ./alt
```

## Neues pdf von Link herunterladen und mit altem Dokument vergleichen

Funktion
+ PDF von URL laden
+ Mit passender Datei im alt/-Ordner (gleicher Name) vergleichen
+ Unterschiede per Hash melden

[Link zum Script](https://github.com/guggenbergerME/linux_codes/blob/main/Linux%20Grundbefehle/BASH-Script/PDF_Hash_Vergleich/pdf_vergleichen_website.sh)

## Links aus einer Datei auslesen und vergleichen

Die Links zu einer PDF werden aus einer Textdatei gelesen und mit der alten Version auf dem Server verglichen.



