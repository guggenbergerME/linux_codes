# Screen – Linux Befehle im Hintergrund

Linux hat die Eigenart das sämtliche Befehle an die aktuelle Terminalsitzung gebunden sind. Besonders problematisch ist das bei Befehlen die sehr lange dauern. Bricht zwischendurch zum Beispiel die SSH Verbindung ab, so wird die Ausführung des Befehls komplett beendet. Auch einem wohlverdienten Feierabend kann die Ausführung eines Befehls der länger dauert als erwartet im Wege stehen. Das Programm Screen erlaubt es unter Linux Befehle, im Hintergrund, ohne aktive Terminalsitzung laufen zu lassen.

## Screen installieren

Screen ist auf den meisten modernen Linux Distributionen bereits vorinstalliert. Sollte das nicht der Fall sein, können Sie es mit dem jeweiligen Paketmanager nachinstallieren.

Hier zum Beispiel mit dem Paketmanager von Ubuntu:
```
apt install screen -y
```
## Screen Session starten

Eine Screen Session lässt sich ganz einfach mit dem Parameter -S und einem frei wählbaren Session Namen starten.
```
screen -S session_name
```
## Arbeiten in Screen

Innerhalb einer Screen Session kann dann ganz normal gearbeitet werden. Die Session unterscheidet sich nicht vom regulären Terminal. Jedoch können hier Befehle gestartet werden die auch noch weiterlaufen wenn man die Screen Session verlässt ohne sie zu beenden.
Screen Session verlassen ohne Sie zu beenden

Um eine Session zu verlassen drücken Sie gleichzeitig die Tasten „strg“, „a“ und „d“.

Die Session taucht dann weiterhin unter den aktiven Session als „Detached“ auf.
Aktive Screen Sessions anzeigen

Aktive Screen Sessions bleiben auch bestehen wenn man zum seine SSH Verbindung beendet. Die bestehenden Sessions kann man sich natürlich anzeigen lassen. Diese tauchen dann sowohl unter dem vergebenen Namen als auch einer individuellen ID auf. Der Status „Attached“ wird angezeigt wenn sie sich aktuell in einer Session befinden. Ansonsten haben die Sessions den Status „Detached“ und laufen im Hintergrund.
```
screen -ls
```
Beispiel Ausgabe:
```
There are screens on:\\
      9986.prod       (01/27/2022 04:25:17 PM)        (Detached)\\
      30635.test      (01/27/2022 04:18:29 PM)        (Detached)
```
## Bestehende Screen Session wiederherstellen

Natürlich können Sie jederzeit wieder eine bestehende Session betreten. Hierzu kann sowohl der Name als auch die ID der Session verwendet werden.
```
screen -r session_name
```
## Screen Session vollständig schließen

Wenn Sie eine Session permanent beenden wollen, lässt sich dies ganz einfach über den exit Befehl bewerkstelligen.
```
exit
```
## Man Page

Screen hat noch einiges mehr zu bieten. Weitere Informationen dazu finden Sie auf der man page.
```
man screen
```
Sie können nun mit Screen Linux Befehle im Hintergrund starten!

## Keys

```

Ctrl + a d      Disconnect from the current screen

Ctrl + a "      View all of the available screen windows

Ctrl + a      1,2,3...9      Connect to a screen with a particular number

Ctrl + a i      View information about the current screen

Ctrl + a k      Kills the current window

Ctrl + a \ Kills all windows and terminates screen
```
