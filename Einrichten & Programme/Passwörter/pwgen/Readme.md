# pwgen

## Install
```
sudo apt-get install pwgen
```
## Syntax
```
pwgen [Parameter] [Länge der Passwörter]
```

Parameter
```
-0	Benutze keine Zahlen im Passwort.
-A	Benutze keine Großbuchstaben im Passwort.
-B	Benutze keine Zeichen die vom User verwechselt werden können wie l und 1 oder O und 0.
-N ZAHL	Erzeugt soviele Passwörter, wie man hinter N angibt. -N 1 zum Beispiel erzeugt nur ein Passwort.
-s	Erzeugt äußerst sichere und zufällige Passwörter. Dabei wird das "pronounceable"-Feature von pwgen deaktiviert, die Passwörter kann man sich also nicht mehr so einfach merken.
-v	Benutze keine Vokale im Passwort.
-y	Benutze mindestens ein Sonderzeichen im Passwort.
```

## Beispiele

Erzeugt nur ein Passwort:

    pwgen -N 1 

Erzeugt äußerst sichere Passwörter, die aus Zahlen, Groß- und Kleinbuchstaben und Sonderzeichen bestehen und 12 Zeichen lang sind:

    pwgen -s -y 12 

Erzeugt Passwörter, die nur aus Kleinbuchstaben bestehen und 5 Zeichen lang sind:

    pwgen -0 -A 5 
