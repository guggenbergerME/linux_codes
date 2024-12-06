# FHEM Feiertag Setup

Feiertage werden im Ordner des jeweiligen Bundeslandes Verwalten
```
/opt/fhem/FHEM/holiday
```
Beispiel Bundesland Bayern
```
# $Id:  $
# Feiertage in Bayern
# Siehe auch
# http://de.wikipedia.org/wiki/Feiertage_in_Deutschland

1 01-01 Neujahr
1 01-06 Heilige Drei K  nige
1 05-01 Tag der Arbeit
#1 08-08 Augsburger Friedensfest
1 08-15 Mari   Himmelfahrt
1 10-03 Tag der Deutschen Einheit
1 11-01 Allerheiligen
1 12-25 1. Weihnachtstag
1 12-26 2. Weihnachtstag

2 -2 Karfreitag
2  1 Ostermontag
2 39 Christi Himmelfahrt
2 50 Pfingstmontag
2 60 Fronleichnam
#5 -1 Wed 11 23 Bu ^=- und Bettag (kein Schulunterricht)
```
## Erklärung
### 1
Genaues Datum. Argumente: <MM-TT> <Feiertagsname>
Beispiel: 1 12-24 Weihnachten
MM-TT kann auch als JJJJ-MM-TT geschrieben werden.
### 2
Osterabhängiges Datum. Argumente: <Tagesversatz> <Feiertagsname>. Der Versatz wird ab Ostersonntag gezählt.
Beispiel: 2 1 Ostermontag
Randbemerkung: Sie können das Osterdatum mit folgendem Befehl überprüfen: fhem> { join("-", western_easter(2011)) }
### 3
Monatsabhängiges Datum. Argumente: <n-ter> <Wochentag> <Monat <Feiertagsname>.
Beispiele:
```
3 1 Mon 05 Erster Montag im Mai
3 2 Mon 05 Zweiter Montag im Mai
3 -1 Mon 05 Letzter Montag im Mai
3 0 Mon 05 Jeder Montag im Mai
```
### 4
Intervall. Argumente: <MM-TT> <MM-TT> <Feiertagsname> .
Hinweis: Ein Intervall kann nicht das Jahresende enthalten. Beispiel:
```
4 06-01 06-30 Sommerferien
4 12-20 01-10 Winterferien # FUNKTIONIERT NICHT. Verwenden Sie stattdessen die folgenden 2 Zeilen:
4 12-20 12-31 Winterferien
4 01-01 01-10 Winterferien
```
MM-TT kann auch als JJJJ-MM-TT geschrieben werden.
### 5
Datum relativ, Wochentag fester Feiertag. Argumente: <n-ter> <Wochentag> <Monat> <Tag> <Feiertagname>
Beachten Sie, dass +0 oder -0 als Offsets zwar nicht verboten sind, ihr Verhalten jedoch undefiniert ist, da es sich ohne Vorankündigung ändern kann.
Beispiele:
```
5 -1 Mi 11 23 Buss und Bettag (erster Mittwoch vor dem 23. Nov.)
5 1 Mo 01 31 Erster Montag nach dem 31. Jan. (1. Montag im Februar)
```
### 6
Berechnen Sie ein Datum mit einer Perl-Funktion. Die Funktion muss das Ergebnis als genaues Datum im Format „mm-dd“ zurückgeben, z. B. „12-02“

Beispiel:
```
6 calcAdvent 21 1.Advent
6 calcAdvent 14 2.Advent
6 calcAdvent 7 3.Advent
6 calcAdvent 0 4.Advent
```

### Links
+ [Detailierte Beschreibung in der FHEM Command](https://fhem.de/commandref.html#holiday)
