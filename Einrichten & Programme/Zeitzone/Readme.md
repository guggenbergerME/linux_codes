# Linux Zeitzone

Überprüfen Sie die aktuelle Zeitzone

In modernen Linux-Distributionen wie Ubuntu, Debian oder CentOS kann die aktuelle Zeitzone mit dem folgenden Befehl überprüft werden.

```
timedatectl
```
Die Ausgabe lautet wie folgt.
```
Lokale Zeit: Mi 2021-11-06 22:43:42 UTC
 Universelle Zeit: Mi 2021-11-06 22:43:42 UTC
        RTC-Zeit: Mi 2021-11-06 22:43:42
   Zeitzone: Etc/UTC (UTC, +0000)
     NTP aktiviert: nein
NTP synchronisiert: ja
 RTC in lokaler Zeitzone: nein
      DST aktiv: n/a
```
## Zeitzone ändern

Überprüfen Sie zunächst die Liste der derzeit verfügbaren Zeitzonen.

```
timedatectl list-timezones
```
Die Ausgabe lautet wie folgt.
```
...
America/Tijuana
America/Toronto
America/Tortola
America/Vancouver
America/Whitehorse
America/Winnipeg
...
```

Als nächstes können Sie die Zeitzone mit dem folgenden Befehl festlegen.

```
timedatectl set-timezone Asia/Shanghai
```
Um die aktuelle Zeitzone erneut zu überprüfen.
```
timedatectl
```

