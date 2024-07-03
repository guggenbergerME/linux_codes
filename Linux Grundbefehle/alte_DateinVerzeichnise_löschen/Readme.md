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
## Löschen von Dateien, die älter als X Tage sind, mit einem Prompt zur Bestätigung

Sie sollten rm erst ausführen oder die Option -delete verwenden, wenn Sie sich vergewissert haben, dass das von einer Suche zurückgegebene Ergebnis korrekt ist.

Da der Suchbefehl rekursiv entlang des angegebenen Pfads nach dem angegebenen Muster sucht, kann es leicht passieren, dass Sie versehentlich alle Dateien im aktuellen Verzeichnis und in den Unterverzeichnissen löschen, indem Sie den Dateinamen falsch eingeben oder falsche Optionen angeben.

Ich hoffe, Sie verstehen, was ich meine. Es wird empfohlen, -print zu verwenden, um die Ausgabe zu überprüfen, bevor Sie den folgenden Befehl ausführen, der Sie vor dem Löschen der Datei zur Bestätigung auffordert.
```
find . -atime +30 -exec rm -i {} \; -print
```
Dateien, deren Änderungszeit mehr als 30 Tage alt ist, werden von Ihrem System entfernt, wenn Sie den oben genannten Befehl ausführen.

## Löschen von Dateien, die älter als X Tage sind, mit einer bestimmten Erweiterung

Anstatt alles zu löschen, können Sie viele Filter verwenden, um die gewünschten Anweisungen zu finden. Sie können zum Beispiel keine Dateien löschen, die vor mehr als 30 Tagen bearbeitet wurden, wenn sie die Erweiterung ".log" haben.

Um auf Nummer sicher zu gehen, sollten Sie zunächst einen Probelauf durchführen und eine Liste der Dateien zusammenstellen, die den Anforderungen entsprechen.
```
find /var/log -name "*.log" -type f -mtime +30
```
Nachdem Sie die Liste überprüft haben, können Sie die darin enthaltenen Dateien mit dem Befehl entfernen:
```
find /var/log -name "*.log" -type f -mtime +30 -delete
```
Dateien mit der Erweiterung.log und einer Änderungszeit von mehr als 30 Tagen werden von Ihrem System entfernt, wenn Sie den oben genannten Befehl ausführen.

## Altes Verzeichnis rekursiv löschen

Wenn das Verzeichnis nicht leer ist, kann die Option -delete fehlschlagen. In einer solchen Situation verwenden wir den find Befehl in Verbindung mit dem rm Befehl von Linux, um die unerwünschten Daten zu löschen.

Mit dem unten stehenden Befehl durchsuche ich alle Unterverzeichnisse von /var/log, die in den letzten 90 Tagen aktualisiert worden sind.
```
find /var/log -type d -mtime +90
```
Mit dem Kommandozeilenargument -exec des rm Befehls können wir Dateien löschen. Die Ergebnisse des find Befehls werden an den rm Befehl gesendet.
```
find /var/log -type d -mtime +30 -exec rm -rf {} \;
```
Es kommt der Zeitpunkt, an dem Sie die Dateien versehentlich löschen. Wir alle waren schon einmal in der Situation, dass wir Daten verloren haben und sie wiederherstellen wollten. Es ist eine Erleichterung, dass es bei Linux einfacher ist, verlorene Daten wiederherzustellen als bei anderen Betriebssystemen. Hier finden Sie einen Überblick über die Wiederherstellung gelöschter Dateien unter Linux. Sie können Recoverit Linux Data Recovery hier herunterladen, um eine schnelle Lösung zu finden.

