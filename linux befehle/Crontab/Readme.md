# Crontab

Crontab wird die Tabelle genannt, in der die einzelnen Cronjobs definiert und konfiguriert werden. Die Tabelle enthält pro Zeile den Zeitpunkt und die 
Befehlsfolge, die ausgeführt werden soll. Der Begriff Crontab setzt sich aus dem griechischen Chronos (Zeit) und lateinischen Tabula (die Tafel, das Brett) zusammen.

Gleichzeitig ist crontab auch das Programm, mit dessen Hilfe man die Crontabs bearbeiten kann. Um die Contab zu bearbeiten, muß folgender Befehl eingegeben werden

```
crontab -e
```
## Crontab Syntax

Jeder Cronjob hat folgendes Format:
```
* * * * * auszuführender Befehl
┬ ┬ ┬ ┬ ┬
│ │ │ │ │
│ │ │ │ └──── Wochentag (0-7, Sonntag ist 0 oder 7)
│ │ │ └────── Monat (1-12)
│ │ └──────── Tag (1-31)
│ └────────── Stunde (0-23)
└──────────── Minute (0-59)
```
Ein Stern * bedeutet Ausführung wird immer erfolgen, also zu jeder Minute, jeder Stunde, jedem Tag, jedem Monat oder jedem Wochentag. Um die einzelnen Stellen auseinander zu halten, hilft folgendes Diagram:
```
1 2 3 4 5 Befehl

1 = Minute (0-59)
2 = Stunde (0-23)
3 = Tag (0-31)
4 = Monat (1-12)
5 = Wochentag (0-7, Sonntag ist 0 oder 7)
Befehl = Der auszuführende Befehl.
```
Für die ersten fünf Stellen, also die Zeiwerte sind folgende Optionen zusätzlich möglich:
```
* = Ausführung immer (zu jeder…)
*/n = Ausführung aller n
n,x,y = Ausführung um/am n, x und y
```

## Cronjob Beispiele

Um zum Beispiel jede Nacht um 5 Uhr morgens das Backup auszuführen, würde man den Cronjob folgendermaßen anlegen:
```
0 5 * * * /usr/bin/backup.sh
```
Einen Sound alle 10 Minuten Abzuspielen könnte wie folgt aussehen:
```
*/10 * * * * /usr/bin/play_sound.sh
```

## Crontab und das %
Sollte man in einem Befehl ein "%" Zeichen verwenden, beispielsweise bei einem Datum, ist die lösung das Zeichen zu escapen ```\```
```
0 8,17 * * * /usr/bin/script.sh >>/var/log/cron/script_$(date +\%Y\%m\%d).log

```
