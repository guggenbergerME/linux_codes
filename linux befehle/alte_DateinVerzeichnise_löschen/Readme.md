# Anleitung zum Löschen von Dateien, die älter als X sind, unter Linux

Es wird empfohlen, dass Sie Ihren Server regelmäßig von nicht benötigten Dateien bereinigen. Auf dem Server befinden sich viele unnötige Daten, 
wenn wir zum Beispiel jeden Tag oder jede Stunde ein Backup von Dateien und Datenbanken erstellen. Halten Sie daher einen konsequenten Bereinigungsplan ein. 
Sie können ältere Dateien im Speicherort des Backup-Verzeichnisses suchen und löschen.

Der find Befehl ist in einer solchen Situation hilfreich, da er die Datei zunächst nach einer der folgenden Methoden sucht: mit den Endungen -amin, 
-atime, -cmin, -ctime, -mmin und -mtime.

Wenn der Suchbefehl einen Treffer für die angegebenen Kriterien liefert, können Sie ihn mit der Option -delete oder xargs löschen.

Nicht so kompliziert, oder? Lassen Sie uns zunächst einige der situationsspezifischen Anweisungen ausprobieren.

## Beispiele zum Löschen von Dateien, die älter als X sind, unter Linux

Hier sehen wir uns an, wie Sie unter Linux Dateien löschen können, die älter als x Tage sind. Meistens wird dies verwendet, um zu alte Backups zu löschen oder um rotierende 
Protokolle zu entfernen, die älter als eine bestimmte Anzahl von Tagen sind.

Dieses Material richtet sich an Anfänger und fortgeschrittene Linux-Benutzer, da es ein Thema behandelt, das für das Betriebssystem von grundlegender Bedeutung ist: Das Auffinden u
nd Entfernen von Dateien auf der Grundlage ihrer mtime (Modification/Creation time). Sie können jede beliebige Linux-Distribution mit den mitgelieferten Beispielen verwenden.

## Löschen von Dateien, die älter als X Stunden / Tage sind, unter Linux

Mit der Suchfunktion können Sie nach Dateien suchen, die seit mehr als X Tagen nicht mehr angefasst wurden und sie dann alle löschen. Außerdem können Sie sie mit einem einzigen Befehl entfernen, wenn dies erforderlich ist.
Erstellen Sie zunächst eine Liste mit allen Dateien im Verzeichnis /opt/backup, die älter als 7 Tage sind.
```
find /opt/backup -type f -mtime +7
```
Prüfen Sie die Dateiliste, indem Sie sicherstellen, dass der obige Befehl keine Hilfedateien enthält. Danach können Sie die Dateien mit der folgenden Steuerung dauerhaft entfernen.
```
find /opt/backup -type f -mtime +7 -delete
```
## Dateien löschen, die innerhalb von X Minuten geändert wurden

Manchmal möchten Sie Daten auf der Grundlage des Zeitpunkts der letzten Bearbeitung löschen. So können Sie z.B. alles im aktuellen Verzeichnis löschen, auf das in den letzten X Minuten zugegriffen wurde.
Nehmen wir den Fall, dass ich alle Dateien entfernen möchte, die in der letzten halben Stunde aktualisiert wurden. In einem solchen Fall können Sie alle kürzlich geänderten Dateien mit dem folgenden Befehl löschen.
```
find . -mmin -30 -type f -delete
```
