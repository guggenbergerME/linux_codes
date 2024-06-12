# Das erste Script

## Die Shebang-Zeile

Ein Skript wird prinzipiell immer von einem ausführbaren Programm, seinem Interpreter, gelesen und von ihm Befehl für Befehl abgearbeitet. Das Skript selbst erzeugt 
keinen Prozess, sondern nur der ausführende Interpreter – zum Beispiel die Bash. Zur Ausführung eines Skriptes ist also der passende Interpreter zu 
starten und ihm muss mitgeteilt werden, welches Skript er abarbeiten soll. Ein solcher Aufruf hat diese Form:
```
bash mein_Skript.sh 
```
Natürlich ist es möglich, bei jedem Aufruf seines Skriptes die ausführende Shell erneut anzugeben, doch diesen Aufwand möchte man oft 
nicht treiben. Üblicherweise gibt man im Skript die zu verwendende Shell in der ersten Zeile an. Eine solche erste Zeile nennt man Shebang-Zeile oder 
auch oft verkürzt nur "Shebang".

Eine Shebang-Zeile enthält drei Teile und hat diese allgemeine Struktur:
```
1 #!INTERPRETER OPTION …
```
+ Die Zeile muss mit den beiden Zeichen #! beginnen. Diese Zeichenkombination ist der eigentliche Shebang und muss am Anfang der Datei stehen, d.h. davor ist nichts 
zulässig, auch keine Leerzeichen oder Leerzeilen oder Kommentarzeilen. Auch ein BOM (Byte Order Mark) zur Identifizierung der Zeichenkodierung ist nicht erlaubt. 
Nach dem Shebang darf aber die Angabe INTERPRETER optional durch Leerzeichen abgetrennt werden.
+ Der Platzhalter INTERPRETER ist durch das Programm zu ersetzen, welches dieses Skript abarbeiten soll. Da das Skript in der Syntax einer bestimmten Shell verfasst wird, 
ist hier das passende Programm und dieses mit seinem vollständigen absoluten Pfad anzugeben, da die Umgebungsvariable PATH an dieser Stelle nicht beachtet wird.
+ OPTION …: Diese Angabe ist optional und kann auch fehlen. Gemeint sind Optionen für das Programm INTERPRETER, die seine Arbeitsweise modifizieren.

Im Rahmen dieses Artikels sind dies Beispiele für gültige Shebang-Zeilen:
```
1 #!/bin/bash
```
Man legt also für die Ausführung des Skriptes die Shell Bash fest.
```
1 #! /bin/bash
```
Das Leerzeichen dient nur nur Verbesserung der Lesbarkeit.
```
1 #!   /bin/bash -e
```
Die Option -e weist Bash an, bei einem Fehler die weitere Abarbeitung des Skripts zu beenden. Ohne diese Option würde nach einem Fehler das Skript weiter ausgeführt.

Die Raute zu Beginn der Zeile identifiziert für die Bash diese Zeile als Kommentar; somit ignoriert die ausführende Shell selbst die Shebang-Zeile. Der Kernel hingegen erkennt beim Start der Datei durch diese Raute gefolgt vom Ausrufezeichen, dass dieses Skript von einem bestimmten Interpreter ausgeführt werden soll.

Hat das derart vorbereitete Skript Ausführungsrechte und wird es dann über
```
./mein_Skript.sh 
```
aufgerufen, dann ist dieser Aufruf äquivalent hierzu:
```
/bin/bash ./mein_Skript.sh 
```
Benutzt man eine andere Shell, so vermerkt man das in der Shebang-Zeile entsprechend, beispielsweise: #!/bin/zsh. Dieser Artikel bezieht sich aber nur auf die Bash, 
weshalb /bin/bash verwendet wird. Damit wird deutlich die Aussage getroffen: „Dies ist ein Bash-Skript.“

In vielen anderen Anleitungen findet sich jedoch #!/bin/sh. Was hat es damit auf sich? Die Bash ist eine komplexere Shell, die nicht auf allen unixartigen Systemen 
installiert sein muss im Gegensatz hingegen zur laut POSIX-Standard verpflichtend erforderlichen Shell /bin/sh. Hinsichtlich der sprachlichen Ausdrucksmittel stimmen 
die von POSIX geforderte sh und die Bash aber nicht überein, denn die Bash versteht mehr Konstrukte als für sh verpflichtend. Mit der Angabe #!/bin/sh wird also eine 
andere Aussage gemacht: „Dieses Skript entspricht dem POSIX-Standard.“

Grundsätzlich gilt: Man muss einen Interpreter angeben, der alle im Skript benutzten Funktionen beherrscht. Es gilt nicht allgemein, „Shellskripte können /bin/sh verwenden“! Man muss sich stattdessen darüber im Klaren sein, dass man einen zur gewählten Syntax passenden Interpreter wählen muss. Eine falsche Deklaration in der Shebang-Zeile ist ein häufiger Fehler.

Ein Skript, welches mit #!/bin/sh als POSIX-Shell deklariert wurde, kann sich bei einer erzwungenen Abarbeitung durch die Bash anders oder sogar fehlerhaft verhalten.

> [!WARNING]
> Unter Ubuntu ist /bin/sh ein symbolischer Link auf die Dash. Welche Konsequenzen das hat, wird unter anderem im englischen Ubuntu-Wiki Eintrag zur DASH 🇬🇧 erklärt.

Kommentare einfügen

Kommentare sind wichtig, und man sollte regen Gebrauch davon machen. An schwierigen Passagen sollte man kleine Notizen hinterlegen, um festzuhalten, was man sich dabei gedacht hat und wie das Konstrukt funktioniert. So erleichtert man sich selbst, z.B. nach längeren Pausen, oder aber auch anderen, welche das Skript bearbeiten möchten, das Verständnis.

Kommentare beginnen mit dem Hash-Zeichen (#). Dies kann überall in einer Zeile stehen; außer innerhalb von Quotes. Die Bash ignoriert alles, was dahinter steht. 
Allgemein sieht das dann so aus:

# Dies ist ein Kommentar

kein Kommentar # Dies ist ein Kommentar.

echo "auch # kein Kommentar innerhalb" # , wohl aber außerhalb

...
