# PDF Files

## pdftk
Um Bilder in Linux Mint zu einer einzigen PDF-Datei zusammenzufügen, kann man das Kommandozeilenprogramm pdftk oder die grafische Anwendung PDFsam verwenden. pdftk ist ein mächtiges Werkzeug für die PDF-Manipulation, während PDFsam eine benutzerfreundlichere Oberfläche bietet. 

Installieren: pdftk ist nicht immer vorinstalliert, daher muss es eventuell zuerst installiert werden. Dies kann mit folgendem Befehl im Terminal erfolgen:

```
sudo apt-get update
sudo apt-get install pdftk
```
Bilder konvertieren: Zuerst müssen die Bilder in PDF-Dateien umgewandelt werden. Dazu kann **convert** (aus dem ImageMagick Paket) verwendet werden. Falls ImageMagick nicht installiert ist: 

```
sudo apt-get install imagemagick
```

Konvertierung eines einzelnen Bildes (z.B. bild.jpg):

```
convert bild.jpg bild.pdf
```

Zusammenfügen: Nachdem alle Bilder in PDF-Dateien umgewandelt wurden, können sie mit pdftk zu einer einzigen PDF zusammengefügt werden: 

```
    pdftk bild1.pdf bild2.pdf bild3.pdf cat output endergebnis.pdf
```
