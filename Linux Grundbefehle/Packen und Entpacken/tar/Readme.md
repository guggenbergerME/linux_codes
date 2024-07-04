# TAR.gz
## Entpacken von .tar.gz
Die meisten .tar.gz- und andere komprimierte .tar-Dateien kannst du mit dem Dienstprogramm tar entpacken.

Für die einfachste Methode öffnest du zunächst das Terminal (STRG+ALT+T) und navigierst in das Verzeichnis der .tar.gz-Datei, die du entpacken möchtest. Gib dann den folgenden Befehl ein:

Entpacke die .tar.gz-Datei in das aktuelle Arbeitsverzeichnis:

```
tar -xf filename.tar.gz
```

Dieser Befehl entpackt (-x) die angegebene Datei (-f) (in diesem Fall Dateiname.tar.gz) in das aktuelle Verzeichnis. Beachte, dass dieser Befehl auch mit anderen gängigen Komprimierungsformaten wie .tar.bz2 funktioniert.

Für den Befehl tar gibt es noch weitere Optionen. Wie viele Linux-Befehle ist eine davon eine ausführliche Ausgabe (-v), die die entpackten Dateien im Terminalfenster ausgibt:

Entpacke die .tar.gz-Datei in das aktuelle Arbeitsverzeichnis und gib die Ausgabe aus:

```
tar -xvf filename.tar.gz
```

Auch hier entpacken die oben genannten Befehle standardmäßig in das aktuelle Arbeitsverzeichnis. Du kannst die Option -C verwenden, um in ein anderes Verzeichnis zu entpacken (in diesem Fall /home/user/files).

Entpacke die .tar.gz-Datei in ein anderes Arbeitsverzeichnis:

```
tar -xf filename.tar.gz -C /home/user/files
```

## Nur bestimmte Dateien oder Verzeichnisse aus .tar.gz unter Linux extrahieren

Der Befehl tar bietet auch die Möglichkeit, nur bestimmte Dateien oder Verzeichnisse aus einer .tar.gz-Datei zu extrahieren. Füge einfach eine durch Leerzeichen getrennte Liste der Dateien hinzu, die du entpacken möchtest.

Extrahiere Datei1 und Verzeichnis1 aus der .tar.gz-Datei in das aktuelle Arbeitsverzeichnis:
```
tar -xf filename.tar.gz file1 directory1
```
Beachte, dass dieser Befehl einen Fehler auslöst, wenn du nicht genau den Dateinamen angibst, der in der .tar-Datei steht. Wie wir im nächsten Abschnitt näher erläutern werden, kannst du die Dateinamen überprüfen, indem du dir den Inhalt mit dem Befehl tar -tf filename.tar.gz auflistest.

Du kannst auch --wildcards verwenden, um alle Dateien mit einer bestimmten Erweiterung oder einem bestimmten Namen zu extrahieren.

Extrahiere alle Dateien, die mit „.txt“ enden, aus der .tar.gz-Datei:

```
tar -xf filename.tar.gz --wildcards '*.txt'
```

## Entpacken von .tar.gz von stdin in Linux

Du kannst .tar.gz auch direkt aus dem Standardeingabestrom (stdin) extrahieren, indem du es mit der Dekomprimierungsoption (-z) in den Befehl tar einfügst.

Wenn du zum Beispiel die .tar.gz-Datei unter „https://kinsta.com/filename.tar.gz“ extrahieren möchtest (hier gibt es eigentlich keine .tar.gz-Datei, aber sei nachsichtig mit uns), verwendest du den Befehl wget mit der Pipeline tar.

Entpacke eine .tar.gz-Datei von einer URL:
```
wget -c https://kinsta.com/filename.tar.gz -O - | sudo tar -xz
```

## Den Inhalt einer .tar.gz-Datei unter Linux auflisten

Es ist oft nützlich, den Inhalt einer .tar.gz-Datei aufzulisten, ohne das gesamte Archiv entpacken zu müssen. Mit der Option -list (-t) kannst du eine Liste der Dateinamen ausgeben.

Den Inhalt einer .tar.gz-Datei auflisten:
```
tar -tf filename.tar.gz
```
Du kannst auch die Option verbose output (-v) hinzufügen, um eine detaillierte Auflistung zu erhalten, einschließlich Datum, Wertpapiere/Berechtigungen und mehr.

Detaillierten Inhalt einer .tar.gz-Datei auflisten:
```
tar -tvf filename.tar.gz
```
Viele Komprimierungsprogramme bieten auch eigene Befehle an, um den Inhalt von komprimierten Dateien aufzulisten. Mit gzip kannst du zum Beispiel den Inhalt einer .gz-Datei mit dem folgenden Befehl auflisten:

Detaillierten Inhalt einer .gz-Datei mit gzip auflisten:
```
gzip -l filename
```

## Komprimieren und Entpacken von .tar und .tar.gz in Linux mit gzip

Du kannst deine eigenen komprimierten .tar-Dateien mit Komprimierungsprogrammen wie gzip erstellen. Gzip ist eine der beliebtesten und verfügbarsten Optionen, zumal es in den meisten Linux-Distributionen und macOS integriert ist.

Navigiere im Terminal zum Arbeitsverzeichnis der .tar-Datei, die du komprimieren möchtest, und gib einfach den folgenden Befehl ein:

Komprimiere .tar-Datei mit gzip:
```
gzip filename.tar
```
Du kannst die entstandene .tar.gz-Datei genauso gut mit der Option decompress (-d) entpacken.

Dekomprimiere die .tar.gz-Datei mit gzip:
```
gzip -d filename.tar
```
Wenn du die Originaldatei nach der Komprimierung behalten willst, gibt es zwei Möglichkeiten. Die erste ist die Option -k, die andere verwendet die Option -c, um die komprimierte Datei in eine andere Datei auszugeben, wobei das Original erhalten bleibt.

Komprimiere die .tar-Datei und behalte die ursprüngliche Kopie:
```
gzip -c filename.tar
```
Komprimiere die .tar-Datei und speichere sie als eine andere Datei:
```
gzip -c filename.tar > newfilename.tar.gz
```
Wie das Dienstprogramm tar kannst du auch mit gzip mehrere Dateien oder ganze Verzeichnisse auf einmal komprimieren und entpacken.

Mehrere Dateien komprimieren:
```
gzip file1 file2
```
Dekomprimiere mehrere Dateien:
```
gzip -d file1 file2
```
Komprimiere alle Dateien in einem Verzeichnis:
```
gzip -r directory1
```
Dekomprimiere alle Dateien in einem Verzeichnis:
```
gzip -dr directory1
```
