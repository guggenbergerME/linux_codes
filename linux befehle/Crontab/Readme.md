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
