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
