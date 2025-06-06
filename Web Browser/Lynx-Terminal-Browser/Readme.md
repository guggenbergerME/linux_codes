# Lynx - Text Webbrowser

Lynx 🇬🇧 ist ein Webbrowser für die Kommandozeile. Das ist auch der Vorteil gegenüber anderen (grafischen) Webbrowsern: wenn nichts mehr funktioniert - Lynx funktioniert immer noch, da er im reinen Textmodus läuft.

Das heißt, wenn KDE, GNOME oder eine andere grafische Benutzeroberfläche nicht mehr startet, kann man mit Lynx immer noch im Internet surfen, um zum Beispiel eine Lösung für ein bestimmtes Problem zu suchen. Lynx ist außerdem sehr genügsam, was die Systemressourcen angeht.

## Installation

```
apt-get install lynx
```

## Bedienung

Die Bedienung des Browsers ist sehr einfach, denn man startet ihn einfach im Terminal [2]. Optional kann man auch gleich eine URL übergeben, die Webseite wird dann sofort aufgerufen. Beispiele:
```
lynx                                      # Allgemein
lynx http://www.ubuntuusers.de            # Mit URL
```

## Tastenkürzel

Lynx kann mit den folgenden Tastenkürzeln bedient werden:
```
Taste(n) 	Funktion
⌫ 	              Liste der bisher angezeigten Seiten
Bild ↑ / Bild ↓ 	Cursor eine Seite auf/ ab
↑ / ↓ 	          Cursor zum vorigen/ nächsten Link
⏎ od. → 	        Einem Link folgen
← 	              Zurück zum letzten Dokument
A 	              Verweis auf das Dokument in die Bookmark-Liste einfügen (wird in der Datei ~/lynx_bookmarks.html gespeichert)
D 	              Dokument auf den Rechner übertragen
E 	              Editor starten
G 	              Internetadresse (URL) per Tastatur eingeben
K 	              Alle verfügbaren Tastenkürzel anzeigen
O 	              Einstellung von Optionen
V 	              Bookmark-Liste anzeigen
Q 	              Beendet das Programm.
```
